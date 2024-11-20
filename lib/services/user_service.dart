import 'package:uts/database/repository.dart';
import 'package:uts/modul/user.dart';

class UserService {
  late Repository _repository;

  UserService() {
    _repository = Repository();
  }

  get database => null;

  Future<int> saveUser(User user) async {
    return await _repository.insertData('user', user.userMap());
  }

  Future<List<User>> readAllUsers() async {
    var usersMap = await _repository.readData('user');
    return usersMap.map<User>((userMap) => User.fromMap(userMap)).toList();
  }

  Future<int> updateUser(String table, Map<String, dynamic> data) async {
    var connection = await database;
    return await connection?.update(
      table,
      data,
      where: 'userid = ?',  // Pastikan query ini benar
      whereArgs: [data['Userid']],  // Pastikan 'Userid' sesuai dengan nama kolom
    ) ?? 0;
  }


  Future<int> deleteUser(int userId) async {
    return await _repository.deleteDataById('user', userId);
  }
}
