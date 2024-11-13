import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection{
  static const databaseName = 'user.db';
  static const versi = 1;

  DatabaseConnection._privateConstructor();

  static final DatabaseConnection instance = DatabaseConnection._privateConstructor();

  static Database? _db;

  Future<Database> get database async{
    if (_db !=null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path,databaseName);

    return await openDatabase(dbPath, version: versi, onCreate: await _onCreate);
  }

  Future _onCreate(Database db, int version) async{
    await db.execute('CREATE TABLE user(userid INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NOT NULL, password TEXT NOT NULL);');
  }
}