//extension
import 'package:flutter/material.dart';

extension ThemeDataExtension on ThemeData {
  Color get primary => colorScheme.primary;
  Color get secondary => colorScheme.secondary;
  Color get surface => colorScheme.surface;
  Color get background => colorScheme.surface;
  Color get error => colorScheme.error;
  Color get onPrimary => colorScheme.onPrimary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get onSurface => colorScheme.onSurface;
  Color get onBackground => colorScheme.onSurface;
  Color get onError => colorScheme.onError;
}
