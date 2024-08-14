import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/providers/shared_preference.dart';

class ColorSchemeNotifier extends StateNotifier<ColorScheme> {
  static const String _colorSchemeKey = 'color_scheme';
  final SharedPreferencesService _prefs;

  ColorSchemeNotifier(this._prefs) : super(colorScheme1) {
    _loadColorScheme();
  }

  void _loadColorScheme() async {
    final index = await loadColorScheme();
    if (index != null) {
      changeColorScheme(_getColorSchemeByIndex(index));
    }
  }

  void changeColorScheme(ColorScheme newScheme) {
    state = newScheme;
    saveColorScheme(_getIndexByColorScheme(newScheme));
  }

  int _getIndexByColorScheme(ColorScheme scheme) {
    if (scheme == colorScheme1) return 1;
    if (scheme == colorScheme2) return 2;
    if (scheme == colorScheme3) return 3;
    if (scheme == colorScheme4) return 4;
    return 1;
  }

  ColorScheme _getColorSchemeByIndex(int index) {
    switch (index) {
      case 2:
        return colorScheme2;
      case 3:
        return colorScheme3;
      case 4:
        return colorScheme4;
      default:
        return colorScheme1;
    }
  }

  //Save Locally

  Future<void> saveColorScheme(int index) async {
    await _prefs.saveInt(_colorSchemeKey, index);
  }

  Future<int?> loadColorScheme() async {
    return _prefs.getInt(_colorSchemeKey);
  }
}

final colorSchemeProvider = StateNotifierProvider<ColorSchemeNotifier, ColorScheme>((ref) {
  return ColorSchemeNotifier(SharedPreferencesService());
});