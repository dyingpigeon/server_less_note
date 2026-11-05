import 'package:flutter/material.dart';

import 'note_inside.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final List<String> notes = ['Note 1', 'Note 2', 'Note 3', 'Note 4', 'Note 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note What?')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Note(title: notes[index])),
              );
            },
          );
        },
      ),
    );
  }
}
