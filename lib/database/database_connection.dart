import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/modul/user.dart';

class DatabaseConnection {
  static const databaseName = 'db_perpustakaan_5.db';
  static const versi = 5;

  // Singleton pattern
  DatabaseConnection._privateConstructor();

  static final DatabaseConnection instance =
  DatabaseConnection._privateConstructor();

  static Database? _db;

  // The 'database' getter will give the same instance of the database
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, databaseName);

    return await openDatabase(
      dbPath,
      version: versi,
      onCreate: _onCreate,
    );
  }

  // Database creation
  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE user(userid INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NOT NULL, password TEXT NOT NULL);',
    );

    await db.execute('''
  CREATE TABLE buku(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    gambar TEXT,
    sinopsis TEXT,
    judul TEXT NOT NULL,
    kategori TEXT, 
    rating REAL,
    author TEXT,
    is_recommended INTEGER DEFAULT 0,  -- 0 means not recommended, 1 means recommended
    trending_book INTEGER DEFAULT 0  -- 0 means not trending, 1 means trending
  );
''');
  }

  // Insert data
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('user', user.toMap());
  }

  // Get all data
  Future<List<User>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('user');
    return result.map((json) => User.fromMap(json)).toList();
  }

  // Update data
  Future<int> updateUser(User user) async {
    final db = await database;
    return await db.update(
      'user',
      user.toMap(),
      where: 'userid = ?',
      whereArgs: [user.userid],
    );
  }

  // Delete data
  Future<int> deleteUser(int userid) async {
    final db = await database;
    return await db.delete(
      'user',
      where: 'userid = ?',
      whereArgs: [userid],
    );
  }

  Future<Database?> setDatabase() async {
    _db ??= await _initDatabase();
    return _db;
  }
}
