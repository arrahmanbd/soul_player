import 'package:adwaita/adwaita.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'helper/initilizer.dart';
import 'platform/layout.dart';
import 'providers/color_schema_provider.dart';
import 'providers/language_provider.dart';
import 'utils/device_utils.dart';

void main(List<String>? args) async {
  WidgetsFlutterBinding.ensureInitialized();
  StartupService.initialize();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
        Locale('bn'),
        Locale('zh'),
        Locale('ar')
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: ProviderScope(
        child: MyApp(args),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  final List<String>? args;
  const MyApp(this.args, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);
    final colorScheme = ref.watch(colorSchemeProvider);
    final virtualWindowFrameBuilder = VirtualWindowFrameInit();
    final linux = GlobalUtils.desktop;
    // Ensure the unilink provider is initialized with the passed arguments
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //ref.read(unilinkProvider.notifier).getUniLink(widget.args);
    });

    return MaterialApp(
      title: AppString.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: locale,
      debugShowCheckedModeBanner: false,
      theme:
          linux ? AdwaitaThemeData.light() : AppTheme.lightTheme(colorScheme),
      themeMode: ThemeMode.light,
      darkTheme:
          linux ? AdwaitaThemeData.dark() : AppTheme.darkTheme(colorScheme),
      builder: (context, child) {
        child = virtualWindowFrameBuilder(context, child);
        return child;
      },
      home: const LayoutFinder(),
    );
  }
}
