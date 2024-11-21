import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uts/database/database_connection.dart';
import 'package:uts/modul/user.dart';
import 'package:uts/screens/viewuser.dart'; // Pastikan Anda sudah mengimpor file user.dart

class EditUser extends StatefulWidget {
  final User user;

  const EditUser({Key? key, required this.user}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _userUsernameController = TextEditingController();
  final _userPasswordController = TextEditingController();
  bool _validateUsername = false;
  bool _validatePassword = false;
  late Database _database;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
    // Mengisi kontroler dengan data pengguna yang diterima
    _userUsernameController.text = widget.user.username ?? '';
    _userPasswordController.text = widget.user.password ?? '';
  }

  Future<void> _initializeDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      version: 1,
    );
  }

  Future<void> _updateUser(int userId, String username, String password) async {
    await _database.update(
      'user',
      {'username': username, 'password': password},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit User Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Edit User Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _userUsernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter Username',
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.orange),
                  errorText:
                  _validateUsername ? 'Username cannot be empty' : null,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _userPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.orange),
                  errorText:
                  _validatePassword ? 'Password cannot be empty' : null,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _validateUsername =
                              _userUsernameController.text.isEmpty;
                          _validatePassword =
                              _userPasswordController.text.isEmpty;
                        });
                        if (!_validateUsername && !_validatePassword) {
                          User user = User(
                              userid: widget.user.userid!,
                              password: _userPasswordController.text,
                              username: _userUsernameController.text);

                          await DatabaseConnection.instance.updateUser(user);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("User updated successfully!")),
                          );
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => ViewUser(),
                            ),
                                (route) => false,
                          );
                        }
                      },
                      child: Text(
                        "Update Details",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        _userUsernameController.clear();
                        _userPasswordController.clear();
                      },
                      child: Text(
                        "Clear Details",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
