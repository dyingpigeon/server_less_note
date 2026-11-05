import 'package:sqflite/sqflite.dart';

class TableNotes {
  static Future<void> create(Database db) async {
    await db.execute("""
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        body TEXT NOT NULL,
        is_archived INTEGER DEFAULT 0,
        is_deleted INTEGER DEFAULT 0,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    """);
  }
}