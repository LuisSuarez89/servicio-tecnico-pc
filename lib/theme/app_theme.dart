import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor =
      Color(0xFF0D6EFD); // Un azul moderno y vibrante
  static const Color secondaryColor = Color(0xFF6C757D);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color surfaceColor = Colors.white;
  static const Color onPrimaryColor = Colors.white;
  static const Color onSurfaceColor = Color(0xFF212529);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        onPrimary: onPrimaryColor,
        onSurface: onSurfaceColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceColor,
        foregroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryColor),
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
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
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFE9ECEF), width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
