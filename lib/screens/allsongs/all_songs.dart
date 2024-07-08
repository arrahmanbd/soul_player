import 'package:broken_soul/providers/music_player/player_provider.dart';
import 'package:broken_soul/providers/song_scanner/song_provider.dart';
import 'package:broken_soul/screens/allsongs/widgets/songs_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanAllSongs extends ConsumerWidget {
  const ScanAllSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songScanState = ref.watch(scanProvider);
    if (songScanState.isloading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (songScanState.songs.isNotEmpty) {
      ref.read(playerProvider.notifier).setPlaylist(songScanState.songs,1);
      return SongList(songs: songScanState.songs);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (songScanState.errorMsg.isNotEmpty) Text(songScanState.errorMsg),
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
