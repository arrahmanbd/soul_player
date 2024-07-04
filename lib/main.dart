import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metadata_god/metadata_god.dart';

import 'screens/start/start_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MetadataGod.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AudioPlayerWidget(),
        ),
      ),
    );
  }
}
