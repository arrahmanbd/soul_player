import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/global/extensions/contex.dart';
import 'package:soul_player/layouts/linux/features/provider/tab_provider.dart';
import 'package:soul_player/layouts/linux/features/tabs/settings.dart';
import 'package:soul_player/layouts/linux/features/tabs/tab_library.dart';
import 'package:soul_player/layouts/linux/linux.dart';
import 'package:soul_player/layouts/linux/providers/scanner/song_provider.dart';
import 'package:soul_player/layouts/mobile/utils/snackbar.dart';

import 'components/playback_control.dart';
import 'tabs/home_tab.dart';

class LinuxHome extends StatelessWidget {
  const LinuxHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary.withOpacity(.15),
      drawer: context.sizeWidth < 850 ? const SideDrawer() : null,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Hey Nikhi,',
            style: TextStyle(
                color: deepDark, fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 254, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Consumer(
          builder: (_, WidgetRef ref, __) {
            final tabs = ref.watch(tabBarProvider);
            switch (tabs) {
              case Tabs.library:
                return const TabLibrary();
              case Tabs.settings:
                return const SettingsTab();
              default:
                return const HomeTab();
            }
          },
        ),
      ),
      bottomNavigationBar: const PlayBackControl(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Consumer(
        builder: (_, WidgetRef ref, __) {
          return FloatingActionButton(
            elevation: 0,
            backgroundColor: primary,
            onPressed: () async {
              ref
                  .read(scanProvider.notifier)
                  .getAllSongs()
                  .then((v) => message('Song Added', context));
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
