import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/themes/app_theme.dart';
import 'helper/initilizer.dart';
import 'layouts/layout.dart';

void main(List<String>? args) async {
  WidgetsFlutterBinding.ensureInitialized();
  StartupService.initialize();
  runApp(ProviderScope(child: MyApp(args)));
}

class MyApp extends ConsumerWidget {
  final List<String>? args;
  const MyApp(this.args, {super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ensure the unilink provider is initialized with the passed arguments
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //ref.read(unilinkProvider.notifier).getUniLink(widget.args);
    });
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData,
      themeMode: ThemeMode.light,
      home: const LayoutFinder(),
    );
  }
}

