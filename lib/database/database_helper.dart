import 'queries/notes_queries.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  final notesQueries = NotesQueries();
}