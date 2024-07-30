import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  AppTheme._();

  //initialize Color schema
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.amber,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onError: Colors.white,
  );

  static final ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Colors.blueGrey,
    secondary: Colors.teal,
    surface: Colors.grey[850]!,
    error: Colors.redAccent,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onError: Colors.black,
  );

  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: lightColorScheme.onSurface),
    titleLarge: TextStyle(
        fontSize: 20.0,
        fontStyle: FontStyle.italic,
        color: lightColorScheme.onSurface),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontFamily: 'Hind', color: lightColorScheme.onSurface),
  );

  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: darkColorScheme.onSurface),
    titleLarge: TextStyle(
        fontSize: 20.0,
        fontStyle: FontStyle.italic,
        color: darkColorScheme.onSurface),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontFamily: 'Hind', color: darkColorScheme.onSurface),
  );

  static ThemeData lightThemeData = ThemeData(
    colorScheme: lightColorScheme,
    textTheme: lightTextTheme,
    primaryColor: lightColorScheme.primary,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.primary,
      titleTextStyle: TextStyle(color: lightColorScheme.onPrimary),
    ),
    listTileTheme: ListTileThemeData(
        titleTextStyle: const TextStyle(
            fontSize: 18, color: deepDark, overflow: TextOverflow.ellipsis),
        subtitleTextStyle:
            TextStyle(fontSize: 16, color: deepDark.withOpacity(.5))),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: secondaryDark),
    iconTheme: const IconThemeData(color: deepDark),
  );

  static ThemeData darkThemeData = ThemeData(
    colorScheme: darkColorScheme,
    textTheme: darkTextTheme,
    primaryColor: darkColorScheme.primary,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      titleTextStyle: TextStyle(color: darkColorScheme.onPrimary),
    ),
     listTileTheme: ListTileThemeData(
        titleTextStyle: const TextStyle(
            fontSize: 18, color: Colors.white, overflow: TextOverflow.ellipsis),
        subtitleTextStyle:
            TextStyle(fontSize: 16, color: Colors.white.withOpacity(.5))),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: secondaryDark),
  );
}
