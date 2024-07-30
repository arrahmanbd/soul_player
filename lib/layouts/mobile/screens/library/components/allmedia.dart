import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/layouts/mobile/screens/library/providers/library_provider.dart';
import 'package:soul_player/layouts/mobile/screens/library/widgets/song_list.dart';
import 'package:soul_player/layouts/mobile/screens/now_playing/providers/nowplaying_providers.dart';
import 'package:soul_player/layouts/mobile/screens/settings/setting.dart';
import 'package:yaru/widgets.dart';

import '../../now_playing/widgets/icon_button.dart';
import '../providers/library_state.dart';
import '../widgets/search.dart';

class AllMedia extends ConsumerWidget {
  const AllMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = ref.watch(libraryProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ButtonIcon(
            icon: Icons.play_arrow,
            size: 16,
            effect: false,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: secondaryDark,
        title: const Text('All Media'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ButtonIcon(
              icon: Icons.search,
              size: 16,
              effect: false,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ButtonIcon(
              icon: Icons.settings,
              size: 16,
              effect: false,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: _buildBody(context, ref, media),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, LibraryState media) {
    if (media.isLoading) {
      return const Center(child: YaruCircularProgressIndicator());
    }

    if (media.songs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('No songs found'),
            const SizedBox(height: 8),
            ElevatedButton(
              child: const Text('Refresh'),
              onPressed: () {
                ref.read(libraryProvider.notifier).getAllSongs();
              },
            ),
          ],
        ),
      );
    }
 
    return SongTile(media: media.songs);
  }
}
