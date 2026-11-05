import 'package:sqflite/sqflite.dart';
import '../core/database_core.dart';

class NotesQueries {
  Future<Database> get db => DatabaseCore.instance.database;

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final database = await db;
    return await database.query('notes', limit: 500);
  }

  Future<List<Map<String, dynamic>>> getNoteTitles() async {
    final database = await db;
    return await database.query('notes', columns: ['id', 'title'], limit: 500);
  }

  Future<List<Map<String, dynamic>>> getNoteBody(int id) async {
    final database = await db;
    return await database.query(
      'notes',
      columns: ['body'],
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> insertNote(Map<String, dynamic> note) async {
    final database = await DatabaseCore.instance.database;
    return await database.insert('notes', note);
  }

  Future<int> updateNote(int id, Map<String, dynamic> note) async {
    final database = await DatabaseCore.instance.database;
    return await database.update(
      'notes',
      note,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteNote(int id) async {
    final database = await DatabaseCore.instance.database;
    return await database.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
