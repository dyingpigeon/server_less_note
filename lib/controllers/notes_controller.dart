import 'package:flutter/material.dart';
import 'package:server_less_note/database/database_helper.dart';

class NotesController extends ChangeNotifier {
  // final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  List<Map<String, dynamic>> _notesTitles = [];
  String _notesBody = 'kalau ada ini berarti kosong';
  List<Map<String, dynamic>> _notes = [];

  List<Map<String, dynamic>> get notesTitles => _notesTitles;
  String get notesBody => _notesBody;
  List<Map<String, dynamic>> get notes => _notes;

  Future<void> fetchNoteTitles() async {
    _notesTitles = await DatabaseHelper.instance.notesQueries.getNoteTitles();
    notifyListeners();
  }

  Future<void> fetchAllNotes() async {
    _notes = await DatabaseHelper.instance.notesQueries.getAllNotes();
    notifyListeners();
  }

  Future<void> fetchNoteBody(int id) async {
    List<Map<String, dynamic>> nah = await DatabaseHelper.instance.notesQueries
        .getNoteBody(id);
    _notesBody = nah.isNotEmpty ? (nah[0]['body'] as String? ?? '') : '';
    notifyListeners();
  }

  Future<int> insertNote(Map<String, dynamic> note) async {
    return await DatabaseHelper.instance.notesQueries.insertNote(note);
  }

  Future<int> updateNote(int id, Map<String, dynamic> note) async {
    return await DatabaseHelper.instance.notesQueries.updateNote(id, note);
  }

  Future<int> deleteNote(int id) async {
    return await DatabaseHelper.instance.notesQueries.deleteNote(id);
  }
}
