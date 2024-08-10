import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import 'core/themes/app_theme.dart';
import 'helper/initilizer.dart';
import 'platform/layout.dart';
import 'utils/device_utils.dart';

void main(List<String>? args) async {
  WidgetsFlutterBinding.ensureInitialized();
  StartupService.initialize();
  runApp(ProviderScope(child: MyApp(args)));
}

class MyApp extends ConsumerWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final List<String>? args;
  const MyApp(this.args, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //safe context
    //ref.read(buildContextProvider.notifier).update(context);
    final virtualWindowFrameBuilder = VirtualWindowFrameInit();
    final linux = GlobalUtils.desktop;
    // Ensure the unilink provider is initialized with the passed arguments
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //ref.read(unilinkProvider.notifier).getUniLink(widget.args);
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: linux ? AdwaitaThemeData.light() : AppTheme.lightThemeData,
      themeMode: ThemeMode.light,
      darkTheme: linux ? AdwaitaThemeData.dark() : AppTheme.darkThemeData,
      builder: (context, child) {
        child = virtualWindowFrameBuilder(context, child);
        return child;
      },
      home: const LayoutFinder(),
    );
  }
}
