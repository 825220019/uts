import 'package:uts/modul/user.dart';
import 'package:uts/repository/repository.dart';

class UserService {
  late Repository _repository;

  UserService() {
    _repository = Repository();
  }

  SaveUser(User user) async {
    return await _repository.insertData('user', user.userMap());
  }

  readAllUsers() async {
    return await _repository.readData('user');
  }

  updateUser(User user) async {
    return await _repository.updateData('user', user.userMap());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('user', userId);
  }
}
