import 'package:cinetopia/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinetopia',
      theme: _buildThemeData(),
      home: HomeScreen(),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    );
  }
}
