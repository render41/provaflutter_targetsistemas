import 'package:flutter/material.dart';

class AppStyle {
  static const Color primaryColor = Colors.white;
  static const Color secondaryColor = Colors.black;
  static const Color accentColor = Colors.redAccent;
  static const Color greenBaseColor = Color(0xFF44BD6E);
  static const Color errorBaseColor = Color(0xFF802A2A);

  static const TextStyle infoTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static const LinearGradient backgroundColorLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1D4E65), Color(0xFF29988F)],
  );
}