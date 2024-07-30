import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/core/styles/theme_text.dart';
import 'package:soul_player/global/extensions/contex.dart';
import 'package:soul_player/layouts/linux/features/home_page.dart';
import 'package:soul_player/layouts/linux/features/provider/tab_provider.dart';

class LinuxApp extends StatelessWidget {
  const LinuxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (context.sizeWidth > 850) const SideDrawer(),
          const Expanded(
            child: LinuxHome(),
          ),
        ],
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sizeWidth < 850 ? 200 : context.sizeWidth * .15,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          final selected = ref.watch(tabBarProvider);
          return Column(
            children: [
              ListTile(
                selected: selected==Tabs.home,
                onTap: () {
                  ref.read(tabBarProvider.notifier).state = Tabs.home;
                },
                leading: const Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: Typo.bodyMedium,
                ),
              ),
              ListTile(
                selected: selected==Tabs.library,
                onTap: () {
                  ref.read(tabBarProvider.notifier).state = Tabs.library;
                },
                leading: const Icon(Icons.music_note_outlined),
                title: const Text(
                  'Library',
                  style: Typo.bodyMedium,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.folder_outlined),
                title: Text(
                  'Folders',
                  style: Typo.bodyMedium,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.style),
                title: Text(
                  'Themes',
                  style: Typo.bodyMedium,
                ),
              ),
              ListTile(
                selected: selected==Tabs.settings,
                onTap: () {
                  ref.read(tabBarProvider.notifier).state = Tabs.settings;
                },
                leading: const Icon(Icons.settings_outlined),
                title: const Text(
                  'Settings',
                  style: Typo.bodyMedium,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.cached_outlined),
                title: Text(
                  'Reload',
                  style: Typo.bodyMedium,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  'About',
                  style: Typo.bodyMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
