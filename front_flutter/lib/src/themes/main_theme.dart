import 'package:flutter/material.dart';

class MainTheme {

  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1ABC9C),
    ),
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(
          Color(0xFF1ABC9C),
        ),
        foregroundColor: WidgetStatePropertyAll<Color>(
          Colors.white, // Cor do texto
        ),
        padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Padding
        ),
        textStyle: WidgetStatePropertyAll<TextStyle>(
          TextStyle(fontSize: 16, fontWeight: FontWeight.normal), // Estilo do texto
        ),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)), // Bordas arredondadas
          ),
        ),
      ),
    ),
    textTheme: const TextTheme(

    ),
    appBarTheme: const AppBarTheme(

    ),
  );
}