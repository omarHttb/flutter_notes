import 'package:flutter/material.dart';
import 'package:flutter_notes/controller/home.dart';
import 'package:flutter_notes/model/note.dart';
import 'package:flutter_notes/shared/notes.dart';

Color color = Colors.white;

void fillTitleSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("You have to fill the Title..."),
    ),
  );
}

void addToNoteList(String title, String description) {
  listOfNotes.add(Note(
      title: title,
      noteDescription: description,
      noteTileColor: generateRandomColor(color)));
}
