import 'package:flutter/material.dart';
import 'package:uts/widgets/ourContainer.dart';

class OurSignUp extends StatelessWidget {
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
                  children: <Widget>[
                    BackButton(),
                  ],
                ),
                SizedBox(height: 40.0),
                OurContainer(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_outline),
                              hintText: "Full Name")),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.alternate_email),
                              hintText: "Email")),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              hintText: "Password"),
                          obscureText: true),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_open),
                              hintText: "Confirm Password"),
                          obscureText: true),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 100),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        onPressed: () {
                        },
                      ),
                    ],
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
