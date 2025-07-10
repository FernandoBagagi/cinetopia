import 'package:cinetopia/screens/filmes_screen.dart';
import 'package:cinetopia/widgets/cores.dart' as cores;
import 'package:flutter/material.dart';

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinetopia',
      theme: _buildThemeData(),
      home: FilmesScreen(),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      useMaterial3: true,
      textTheme: _buildTextTheme(),
      iconTheme: _buildIconThemeData(),
      primaryIconTheme: _buildIconThemeData(),
      appBarTheme: _buildAppBarTheme(),
      floatingActionButtonTheme: _buildFloatingActionButtonThemeData(),
      bottomNavigationBarTheme: _buildBottomNavigationBarThemeData(),
      navigationBarTheme: _buildNavigationBarThemeData(),
      elevatedButtonTheme: _buildElevatedButtonThemeData(),
      outlinedButtonTheme: _buildOutlinedButtonThemeData(),
      snackBarTheme: _buildSnackBarThemeData(),
      toggleButtonsTheme: _buildToggleButtonsTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      colorScheme: _buildColorSceme(),
    );
  }

  TextTheme _buildTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 1.0,
        color: cores.onPrimaria,
      ),
      titleMedium: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        fontSize: 20,
        height: 1.5,
        color: cores.onPrimaria,
      ),
      titleSmall: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1.0,
        color: cores.onPrimaria,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.0,
        color: cores.onPrimaria,
      ),
      bodySmall: TextStyle(
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.5,
        color: cores.onPrimaria,
      ),
    );
  }

  IconThemeData _buildIconThemeData() => IconThemeData(color: cores.onPrimaria);

  AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: cores.fundoEscuro,
      iconTheme: IconThemeData(color: cores.onPrimaria),
      titleTextStyle: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: cores.onPrimaria,
      ),
    );
  }

  FloatingActionButtonThemeData _buildFloatingActionButtonThemeData() {
    return FloatingActionButtonThemeData(
      backgroundColor: cores.secundaria,
      foregroundColor: cores.onSecundaria,
    );
  }

  BottomNavigationBarThemeData _buildBottomNavigationBarThemeData() {
    return BottomNavigationBarThemeData(
      backgroundColor: cores.surfaceDark,
      selectedItemColor: cores.primaria,
      unselectedItemColor: cores.cinzaNeutro,
    );
  }

  NavigationBarThemeData _buildNavigationBarThemeData() {
    return NavigationBarThemeData(
      backgroundColor: cores.surfaceDark,
      indicatorColor: cores.primaria,
      labelTextStyle: WidgetStatePropertyAll(
        const TextStyle(fontFamily: 'SF Pro Display', fontSize: 14),
      ),
      iconTheme: WidgetStatePropertyAll(
        const IconThemeData(color: cores.onPrimaria),
      ),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => states.contains(WidgetState.pressed)
              ? cores.secundaria
              : cores.primaria,
        ),
        foregroundColor: WidgetStatePropertyAll(cores.surfaceDark),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        padding: WidgetStatePropertyAll(
          const EdgeInsets.symmetric(vertical: 19, horizontal: 26),
        ),
        textStyle: WidgetStatePropertyAll(
          const TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            height: 1.5,
            color: cores.onPrimaria,
          ),
        ),
      ),
    );
  }

  OutlinedButtonThemeData _buildOutlinedButtonThemeData() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: cores.secundaria),
      ),
    );
  }

  SnackBarThemeData _buildSnackBarThemeData() {
    return SnackBarThemeData(
      backgroundColor: cores.roxoMedio,
      contentTextStyle: TextStyle(color: cores.onPrimaria),
    );
  }

  ToggleButtonsThemeData _buildToggleButtonsTheme() {
    return ToggleButtonsThemeData(
      color: cores.cinzaNeutro,
      selectedColor: cores.onPrimaria,
      fillColor: cores.roxoMedio,
    );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    return const InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),
      filled: true,
      fillColor: cores.fundoEscuro,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: cores.onSurfaceDark, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: cores.onSurfaceDark, width: 1),
      ),
      hintStyle: TextStyle(color: cores.onSurfaceDark),
      labelStyle: TextStyle(color: cores.onPrimaria),
    );
  }

  ColorScheme _buildColorSceme() {
    return ColorScheme.fromSeed(seedColor: cores.primaria).copyWith(
      primary: cores.primaria,
      onPrimary: cores.onPrimaria,
      secondary: cores.secundaria,
      onSecondary: cores.onSecundaria,
      surface: cores.surfaceDark,
      onSurface: cores.onSurfaceDark,
      error: Colors.redAccent,
      onError: Colors.white,
    );
  }
}
