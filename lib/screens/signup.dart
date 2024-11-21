//tampilan ui login mengikuti tutorial yt Tadas Petra
//sqlite menyesuaikan kodingan pertemuan 11

import 'package:flutter/material.dart';
import 'package:uts/screens/login.dart';
import 'package:uts/widgets/ourContainer.dart';
import 'package:uts/modul/user_command.dart';
import 'package:uts/modul/user.dart';

class OurSignUp extends StatefulWidget {
  const OurSignUp({super.key});

  @override
  State<OurSignUp> createState() => _OurSignUpState();
}

class _OurSignUpState extends State<OurSignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final formState = GlobalKey<FormState>();
  UserCommand dbUser = UserCommand();

  // Fungsi untuk proses sign-up
  void _signUp(BuildContext context) async {
    if (formState.currentState!.validate()) {
      User user = User(
        username: emailController.text,
        password: passwordController.text,
      );
      await dbUser.insertUser(user);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OurLogin()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7A900),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[BackButton()],
                ),
                SizedBox(height: 40.0),
                OurContainer(
                  child: Form(
                    key: formState,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 8.0),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email),
                            hintText: "Email",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: "Password",
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open),
                            hintText: "Confirm Password",
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password confirmation cannot be empty";
                            }
                            if (value != passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (formState.currentState!.validate()) {
                              User user = User(
                                username: emailController.text,
                                password: passwordController.text,
                              );
                              await dbUser.insertUser(user);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OurLogin()),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
