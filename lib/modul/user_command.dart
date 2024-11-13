import 'package:uts/database/database_connection.dart';
import 'package:uts/modul/user.dart';
import 'package:sqflite/sqflite.dart';

class UserCommand {
  Future<int> insertUser(User user) async {
    Database db = await DatabaseConnection.instance.database;
    return await db.insert('user', user.toMap());
  }

  Future<User?> signIn(String email, String password) async {
    Database db = await DatabaseConnection.instance.database;
    List<Map<String, dynamic?>> maps = await db.query('user',
        where: 'username = ? AND password = ?', whereArgs: [email, password]);
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateUser(User user) async {
    Database db = await DatabaseConnection.instance.database;
    return await db.update('user', user.toMap(),
        where: 'userid = ?', whereArgs: [user.userid]);
  }

  Future<List<User>> getUser() async {
    Database db = await DatabaseConnection.instance.database;
    List<Map<String, dynamic>> allUser = await db.query('user');
    List<User> users = allUser.map((user) => User.fromMap(User)).toList();
    return users;
  }
}
