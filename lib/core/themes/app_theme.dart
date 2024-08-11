import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: lightTextTheme,
      primaryColor: colorScheme.primary,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        titleTextStyle: TextStyle(color: colorScheme.onPrimary),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: const TextStyle(
            fontSize: 18, color: Colors.black, overflow: TextOverflow.ellipsis),
        subtitleTextStyle:
            TextStyle(fontSize: 16, color: Colors.black.withOpacity(.5))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  static ThemeData darkTheme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: darkTextTheme,
      primaryColor: colorScheme.primary,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        titleTextStyle: TextStyle(color: colorScheme.onPrimary),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: const TextStyle(
            fontSize: 18, color: Colors.white, overflow: TextOverflow.ellipsis),
        subtitleTextStyle:
            TextStyle(fontSize: 16, color: Colors.white.withOpacity(.5))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 20.0,
        fontStyle: FontStyle.italic,
        color: Colors.black),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    titleLarge: TextStyle(
        fontSize: 20.0,
        fontStyle: FontStyle.italic,
        color: Colors.white),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
  );
}
