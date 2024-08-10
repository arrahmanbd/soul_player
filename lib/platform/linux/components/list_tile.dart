// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

import 'package:soul_player/platform/linux/features/player/controller/player_provider.dart';
import 'package:soul_player/platform/linux/features/library_scan/controller/lib_scanner.dart';
import 'package:soul_player/platform/linux/components/songs_card.dart';

class CommonList extends ConsumerWidget {
  final StateNotifierProvider provider;
  //This is a list of songs provider
  const CommonList({
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songScanState = ref.watch(provider);
    if (songScanState.isloading) {
      return const Center(
        child: YaruCircularProgressIndicator(),
      );
    }

    if (songScanState.songs.isNotEmpty) {
      ref
          .read(linuxPlayerProvider.notifier)
          .setPlaylist(songScanState.songs, 1);
      return SongList(songs: songScanState.songs);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (songScanState.errorMsg.isNotEmpty) Text(songScanState.errorMsg),
        const YaruCircularProgressIndicator(),
        const Text('Collection is Empty'),
        const SizedBox(height: 50.0),
        ElevatedButton(
            onPressed: () async {
              // Trigger getAllSongs to start scanning songs
              final songScanner = ref.read(libraryScanerProvider.notifier);
              await songScanner.getAllSongs();
            },
            child: const Text('Scan Library')),
      ],
    );
  }
}
