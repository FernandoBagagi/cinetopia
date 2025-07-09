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

  // === PALETA BASE ===
  static const Color primary = Color(0xFFB370FF);
  static const Color primaryHover = Color(0xFFCEA1FF);
  static const Color navbar = Color(0xFF151317);
  static const Color textPrimary = Color(0xFFEBEBEB);
  static const Color textSecondary = Color(0xFFA5A5A5);
  static const Color buttonText = Color(0xFF1D0E44);
  // O background será aplicado como gradiente no Scaffold
  // de #000000 (início) para #1D0E44 (fim).

  /// Retorna o ThemeData configurado para Material3
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    // === ColorScheme ===
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primary,
      onPrimary: buttonText, // texto em superfícies primárias
      secondary: primaryHover,
      onSecondary: Colors.white, // texto em superfícies secundárias
      surface: navbar, // cards, bottomSheet, etc.
      onSurface: textPrimary,
      error: Colors.redAccent,
      onError: Colors.white,
      primaryContainer: primaryHover,
      onPrimaryContainer: buttonText,
      secondaryContainer: primaryHover,
      onSecondaryContainer: Colors.white,
    ),

    // === Scaffold & AppBar ===
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: navbar,
      iconTheme: IconThemeData(color: textPrimary),
      titleTextStyle: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: textPrimary,
      ),
    ),

    // === NavigationBar (Navbar inferior) ===
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: navbar,
      indicatorColor: primary,
      labelTextStyle: WidgetStatePropertyAll(
        const TextStyle(fontFamily: 'SF Pro Display', fontSize: 14),
      ),
      iconTheme: WidgetStatePropertyAll(
        const IconThemeData(color: textPrimary),
      ),
    ),

    // === Tipografia (TextTheme) ===
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 1.0,
        color: textPrimary,
      ),
      titleMedium: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        fontSize: 20,
        height: 1.5,
        color: textPrimary,
      ),
      titleSmall: TextStyle(
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1.0,
        color: textPrimary,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.0,
        color: textPrimary,
      ),
      bodySmall: TextStyle(
        fontFamily: 'SF Pro Text',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.5,
        color: textPrimary,
      ),
    ),

    // === ElevatedButton (Primário) ===
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) =>
              states.contains(WidgetState.pressed) ? primaryHover : primary,
        ),
        foregroundColor: WidgetStatePropertyAll(buttonText),
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
          ),
        ),
      ),
    ),

    // === TextInput (InputDecorationTheme) ===
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),
      filled: true,
      fillColor: navbar,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: textSecondary, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: textSecondary, width: 1),
      ),
      hintStyle: TextStyle(color: textSecondary),
      labelStyle: TextStyle(color: textPrimary),
    ),
  );
}
