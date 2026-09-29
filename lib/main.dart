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
      title: 'Zeraus Tech | Soporte técnico para PC',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
