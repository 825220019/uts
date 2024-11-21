import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/screens/login.dart';
import 'package:uts/utils/ourTheme.dart';
import 'package:uts/modul/cart_provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: OurTheme().buildTheme(),
      debugShowCheckedModeBanner: false,
      home: OurLogin(),
    );
  }
}
