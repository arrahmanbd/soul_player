import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:soul_player/providers/shared_preference.dart';

class LanguageNotifier extends StateNotifier<Locale> {
  final SharedPreferencesService _storage;

  LanguageNotifier(this._storage) : super(const Locale('en')) {
    _loadLanguage();
  }

  void _loadLanguage() async {
    state = await _storage.loadLanguage();
  }

  void changeLanguage(Locale locale) {
    state = locale;
    _storage.saveLanguage(locale);
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier(SharedPreferencesService());
});
