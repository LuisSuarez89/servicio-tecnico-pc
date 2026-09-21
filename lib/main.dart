import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const ComputoTocancipaApp());
}

class ComputoTocancipaApp extends StatelessWidget {
  const ComputoTocancipaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Servicios de Cómputo Tocancipá',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
