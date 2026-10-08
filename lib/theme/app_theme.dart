import 'package:flutter/material.dart';

class AppTheme {
  // Gradient colors (merah → ungu)
  static const Color redDeep = Color(0xFFFF0844);
  static const Color redBright = Color(0xFFFF5F6D);
  static const Color purple = Color(0xFF9D4EDD);
  static const Color purpleDeep = Color(0xFF6A0572);
  static const Color darkBg = Color(0xFF0D1117);
  static const Color darkCard = Color(0xFF161B22);
  static const Color textLight = Color(0xFFF0F6FC);
  static const Color textMuted = Color(0xFF8B949E);

  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [redDeep, redBright, purple],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF161B22), Color(0xFF1C2333)],
  );

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBg,
      primaryColor: redBright,
      colorScheme: const ColorScheme.dark(
        primary: redBright,
        secondary: purple,
        surface: darkCard,
        background: darkBg,
      ),
      fontFamily: 'Inter',
      useMaterial3: true,
    );
  }
}
