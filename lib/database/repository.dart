import 'package:sqflite/sqflite.dart';
import 'package:uts/database/database_connection.dart';

class Repository {
  late DatabaseConnection _databaseConnetion;

  Repository(){
    _databaseConnetion = DatabaseConnection();
  }

  static Database? _database;

  Future<Database?> get database async{
    if(_database != null){
      return _database;
    }else {
      _database = await _databaseConnetion.setDatabase();
      return _database;
    }
  }

  insertData(table,data) async{
    var connection = await database;
    return await connection?.insert(table, data);
  }

  readData(table) async{
    var connetion = await database;
    return await connetion?.query(table);
  }

  readDataById(table,itemId) async{
    var connetion = await database;
    return await connetion?.query(table,where: 'id = ?', whereArgs: [itemId]);
  }

  updateData(table,data) async{
    var connetion = await database;
    return await connetion?.update(table, data,where: 'id = ?',whereArgs: [data['id']]);
  }

  deleteDataById(table,itemId) async{
    var connetion = await database;
    return await connetion?.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

}


