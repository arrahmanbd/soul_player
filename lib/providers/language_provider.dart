import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:soul_player/providers/shared_preference.dart';

class LanguageNotifier extends StateNotifier<Locale> {
  static const String _languageCodeKey = 'language_code';
  static const String _countryCodeKey = 'country_code';
  final SharedPreferencesService _preferences;

  LanguageNotifier(this._preferences) : super(const Locale('en')) {
    _loadLanguage();
  }

  void _loadLanguage() async {
    final languageCode = _preferences.getString(_languageCodeKey) ?? 'en';
    final countryCode = _preferences.getString(_countryCodeKey);
    state = Locale(languageCode, countryCode);
  }

  void changeLanguage(Locale locale) {
    state = locale;
    saveLanguage(locale);
  }

  // Save Localization
  Future<void> saveLanguage(Locale locale) async {
    await _preferences.saveString(_languageCodeKey, locale.languageCode);
    await _preferences.saveString(_countryCodeKey, locale.countryCode ?? '');
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier(SharedPreferencesService());
});
