import 'package:flutter/material.dart';
import 'package:flutter_notes/controller/writeNote.dart';
import 'package:flutter_notes/model/note.dart';

// ignore: must_be_immutable
class WriteNotePage extends StatefulWidget {
  Note note;
  WriteNotePage({super.key, Note? note})
      : note = note ?? Note(title: '', noteDescription: '');

  @override
  State<WriteNotePage> createState() => _WriteNotePageState();
}

class _WriteNotePageState extends State<WriteNotePage> {
  @override
  void initState() {
    super.initState();
    if (widget.note.title.isNotEmpty) {
      titleController.text = widget.note.title;
      descriptionController.text = widget.note.noteDescription;
    }
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          actions: [
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: Colors.blueGrey,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                onTap: () {
                  if (widget.note.title.isNotEmpty) {
                    // update mode
                    if (titleController.text.isNotEmpty) {
                      widget.note.title = titleController.text;
                      widget.note.noteDescription = descriptionController.text;
                      Navigator.pop(context, true);
                    } else {
                      fillTitleSnackbar(context);
                    }
                    // add new mode
                  } else {
                    if (titleController.text.isNotEmpty) {
                      addToNoteList(
                          titleController.text, descriptionController.text);
                      Navigator.pop(context, true);
                    } else {
                      fillTitleSnackbar(context);
                    }
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15),
            ),
          ],
        ),
        body: ListView(children: [
          Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: titleController,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title...',
                ),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    height: 700,
                    child: TextFormField(
                      controller: descriptionController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write something ....',
                      ),
                      style: const TextStyle(fontSize: 21),
                    )))
          ])
        ]));
  }
}
