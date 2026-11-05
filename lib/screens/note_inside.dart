import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_less_note/controllers/notes_controller.dart';

import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class Note extends StatefulWidget {
  const Note({super.key, required this.title, required this.noteId});

  final String title;
  final int noteId;

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  late final NotesController _notesController;
  late Future<String> _futureNoteBody;
  @override
  void initState() {
    super.initState();
    _notesController = context.read<NotesController>();
    // hapus addPostFrameCallback, biarkan FutureBuilder yang handle

    _futureNoteBody = _notesController
        .fetchNoteBody(widget.noteId)
        .then((_) => _notesController.notesBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: _futureNoteBody,
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
          final body = snapshot.data ?? '';

          return Markdown(
            data: body,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                .copyWith(
                  h1: const TextStyle(
                    fontFamily: 'ariel',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  h2: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  h3: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  p: const TextStyle(fontSize: 16),
                  blockquoteDecoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  codeblockDecoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
          );
        },
      ),
    );
  }
}
