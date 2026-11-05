import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_constants.dart';

import '../tables/table_notes.dart';

import '../seeds/seed_notes.dart';

class DatabaseCore {
  DatabaseCore._();
  static final DatabaseCore instance = DatabaseCore._();

  static Database? _database;

  /// Getter database dengan pengecekan koneksi aktif
  Future<Database> get database async {
    if (_database != null && _database!.isOpen) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(
      await getDatabasesPath(),
      DatabaseConstants.databaseName,
    );

    return await openDatabase(
      path,
      version: DatabaseConstants.databaseVersion,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    // ===============================================
    // Buat semua tabel
    // ===============================================
    await TableNotes.create(db);

    // ===============================================
    // Buat semua view
    // ===============================================
    await SeedNotes.run(db);

    // ===============================================
    // Jalankan seeder
    // ===============================================
    // await SeedRunner.run(db);
  }

  // ===============================================================
  // MANAJEMEN KONEKSI UNTUK PROSES RESTORE DATABASE
  // ===============================================================

  /// Menutup koneksi database aktif & mengosongkan variabel instance
  Future<void> closeDatabase() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
      _database = null;
    }
  }

  /// Membuka kembali koneksi baru setelah file database ditimpa
  Future<Database> reinitDatabase() async {
    await closeDatabase();
    return await database;
  }
}
