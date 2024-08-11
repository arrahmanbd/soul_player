import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/providers/language_provider.dart';
class LanguageSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<Locale>(
      value: ref.watch(languageProvider),
      onChanged: (Locale? newLocale) {
        if (newLocale != null) {
          ref.read(languageProvider.notifier).changeLanguage(newLocale);
          context.setLocale(newLocale);
        }
      },
      items: const [
        DropdownMenuItem(value: Locale('en'), child: Text('English')),
        DropdownMenuItem(value: Locale('fr'), child: Text('Français')),
        DropdownMenuItem(value: Locale('bn'), child: Text('বাংলা')),
        DropdownMenuItem(value: Locale('zh'), child: Text('中文')),
        DropdownMenuItem(value: Locale('ar'), child: Text('العربية')),
      ],
    );
  }
}
