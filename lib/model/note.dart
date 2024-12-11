import 'package:flutter/material.dart';

class Note {
  String title = "";
  String noteDescription = "";
  Color noteTileColor = Colors.greenAccent;

  Note(
      {required this.title,
      required this.noteDescription,
      this.noteTileColor = Colors.white});
}
