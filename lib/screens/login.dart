import 'package:flutter/material.dart';
import 'package:uts/screens/signup.dart';
import 'package:uts/screens/home.dart';
import 'package:uts/modul/user_command.dart';
import 'package:uts/modul/user.dart';

class OurLogin extends StatefulWidget {
  const OurLogin({super.key});

  @override
  State<OurLogin> createState() => _OurLoginState();
}

class _OurLoginState extends State<OurLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formState = GlobalKey<FormState>();
  late UserCommand dbUser = UserCommand();

  void _goToOurHome(BuildContext context) async {
    if (formState.currentState!.validate()) {
      User? user =
      await dbUser.signIn(_emailController.text, _passwordController.text);
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OurHome(),
          ),
        );
      } else {
        Widget okButton = TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("OK"),
        );
        AlertDialog alert = AlertDialog(
          title: Text("Error"),
          content: Text("Incorrect Email or Password!"),
          actions: [okButton],
        );
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            });
      }
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
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Image.asset("assets/logo.jpg"),
                ),
                SizedBox(height: 0.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  ),
                  child: Form(
                    key: formState,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 8.0),
                          child: Text("Log In",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email),
                            hintText: "Email",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: "Password",
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (formState.currentState!.validate()) {
                              User? user = await dbUser.signIn(
                                  _emailController.text,
                                  _passwordController.text);
                              if (user != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OurHome()),
                                );
                              } else {
                                Widget okButton = TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                );
                                AlertDialog alert = AlertDialog(
                                  title: Text("Error"),
                                  content: Text(
                                      "Username or Password is incorrect!"),
                                  actions: [okButton],
                                );
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              }
                            }
                          },
                        ),
                        TextButton(
                          child: Text("Don't have an account? Sign up here"),
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OurSignUp(),
                            ));
                          },
                        ),
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
