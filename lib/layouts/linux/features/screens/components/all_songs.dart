import 'package:soul_player/layouts/linux/providers/scanner/song_provider.dart';
import 'package:soul_player/layouts/linux/features/screens/components/songs_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

class ScanAllSongs extends ConsumerWidget {
  const ScanAllSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songScanState = ref.watch(scanProvider);
    if (songScanState.isloading) {
      return const Center(
        child: YaruCircularProgressIndicator(),
      );
    }

    if (songScanState.songs.isNotEmpty) {
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
              final songScanner = ref.read(scanProvider.notifier);
              await songScanner.getAllSongs();
            },
            child: const Text('Scan Library')),
      ],
    );
  }
}
