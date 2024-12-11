import 'package:flutter/material.dart';
import 'package:flutter_notes/model/note.dart';
import 'package:flutter_notes/shared/notes.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

Color generateRandomColor(Color color) {
  var transparentDark = RandomColor.getColorObject(Options(
    colorType: [
      ColorType.red,
      ColorType.blue,
      ColorType.green,
      ColorType.purple,
      ColorType.yellow
    ],
    luminosity: Luminosity.dark,
  ));

  color = transparentDark;
  return color;
}

bool showSearchField = false;

List<Note> searchNotes(value) {
  List<Note> result = [];
  result = listOfNotes.where((Note note) {
    return note.title.toLowerCase().contains(value.toLowerCase()); //ahmad //t
  }).toList();

  return result;
}
