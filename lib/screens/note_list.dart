import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/notes_controller.dart';
import 'note_inside.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  late final NotesController _notesController;
  late Future<List<Map<String, dynamic>>> _futureNoteTitles;

  @override
  void initState() {
    super.initState();

    _notesController = context.read<NotesController>();
    _futureNoteTitles = _notesController.fetchNoteTitles().then(
      (_) => _notesController.notesTitles,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note What?')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureNoteTitles,
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error
          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          }

          // Data
          final listNotes = snapshot.data ?? [];

          // Empty state
          if (listNotes.isEmpty) {
            return const Center(child: Text('Belum ada catatan.'));
          }

          // List notes
          return ListView.builder(
            itemCount: listNotes.length,
            itemBuilder: (context, index) {
              final note = listNotes[index];
              final noteTitle = note['title'] ?? 'Tanpa Judul';
              final noteId = note['id'] ?? '0';

              return ListTile(
                title: Text(noteTitle.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Note(
                        title: noteTitle.toString(),
                        noteId: noteId as int,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
