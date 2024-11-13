import 'package:flutter/material.dart';

class OurTheme {
  Color _yellow = Color(0xFFF7A900);

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: _yellow,
    );
  }
}
