import 'package:flutter/material.dart';
import 'package:flutter_notes/controller/home.dart';
import 'package:flutter_notes/pages/writeNote.dart';
import 'package:flutter_notes/shared/notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchFieldNoteController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.blueGrey,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              onTap: () {
                setState(() {
                  showSearchField = !showSearchField;
                  if (showSearchField == false) {
                    searchFieldNoteController.text = "";
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.search,
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
      body: Column(children: [
        if (showSearchField)
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              controller: searchFieldNoteController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Search",
                  hintText: "Search for a note title.."),
              onChanged: (value) {
                setState(() {
                  listSearchNotes = searchNotes(value);
                });
              },
            ),
          ),
        listOfNotes.isEmpty
            //if no notes available
            ? ifNotesEmpty()
            //show all notes
            : searchFieldNoteController.text.isEmpty
                ? showAllNotes()
                : showAllSearchNotes()
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => WriteNotePage()));
            setState(() {});
          },
          child: const Icon(Icons.add)),
    );
  }

  //widgets

  Widget showAllNotes() {
    return Expanded(
        child: ListView.builder(
      itemCount: listOfNotes.length,
      itemBuilder: (context, index) {
        return Card(
            margin: const EdgeInsets.all(10),
            color: listOfNotes[index].noteTileColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Text(
                listOfNotes[index].title,
                style: const TextStyle(fontSize: 22),
              ),
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WriteNotePage(
                              note: listOfNotes[index],
                            )));
                setState(() {});
              },
            ));
      },
    ));
  }

  Widget showAllSearchNotes() {
    return Expanded(
        child: ListView.builder(
            itemCount: listSearchNotes.length,
            itemBuilder: (context, index) {
              return Card(
                  margin: const EdgeInsets.all(10),
                  color: listSearchNotes[index].noteTileColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    title: Text(
                      listSearchNotes[index].title,
                      style: const TextStyle(fontSize: 22),
                    ),
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WriteNotePage(
                                    note: listSearchNotes[index],
                                  )));
                      setState(() {});
                    },
                  ));
            }));
  }

  Widget ifNotesEmpty() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: NetworkImage("/assets/images/note.png")),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Create your first note !",
            style: TextStyle(fontSize: 17),
          ),
        ),
      ],
    );
  }
}
