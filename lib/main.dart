import 'package:flutter/material.dart';
import 'package:uts/screens/login.dart';
import 'package:uts/utils/ourTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: OurTheme().buildTheme(),
      debugShowCheckedModeBanner: false,
      home: OurLogin(),
    );
  }
}
