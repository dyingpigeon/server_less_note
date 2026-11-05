import 'package:flutter/material.dart';
import 'package:server_less_note/database/database_helper.dart';

class NotesController {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    return await _databaseHelper.notesQueries.getAllNotes();
  }

  Future<int> insertNote(Map<String, dynamic> note) async {
    return await _databaseHelper.notesQueries.insertNote(note);
  }

  Future<int> updateNote(int id, Map<String, dynamic> note) async {
    return await _databaseHelper.notesQueries.updateNote(id, note);
  }

  Future<int> deleteNote(int id) async {
    return await _databaseHelper.notesQueries.deleteNote(id);
  }
}