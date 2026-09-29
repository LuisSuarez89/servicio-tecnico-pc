import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF168DFF);
  static const Color secondaryColor = Color(0xFF63718B);
  static const Color backgroundColor = Color(0xFFF4F7FC);
  static const Color surfaceColor = Colors.white;
  static const Color onPrimaryColor = Colors.white;
  static const Color onSurfaceColor = Color(0xFF212529);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        primaryContainer: Color(0xFF081323),
        surface: surfaceColor,
        onPrimary: onPrimaryColor,
        onSurface: onSurfaceColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: const Color(0xFF081323),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: onSurfaceColor,
            letterSpacing: -1.5),
        displayMedium: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: onSurfaceColor,
            letterSpacing: -1.0),
        headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: onSurfaceColor,
            letterSpacing: -0.5),
        headlineMedium: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: onSurfaceColor),
        titleLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: onSurfaceColor),
        titleMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: onSurfaceColor),
        bodyLarge: TextStyle(fontSize: 18, color: onSurfaceColor, height: 1.6),
        bodyMedium: TextStyle(fontSize: 16, color: secondaryColor, height: 1.5),
      ),
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: Color(0xFFE3EAF4), width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
