import 'package:soul_player/layouts/linux/features/library_scan/controller/lib_scanner.dart';
import 'package:soul_player/layouts/linux/features/screens/components/songs_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

class ScanAllSongs extends ConsumerWidget {
  const ScanAllSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songScanState = ref.watch(libraryScanerProvider);
    if (songScanState.isEmpty) {
      return Column(
        children: [
          const Center(
            child: YaruCircularProgressIndicator(),
          ),
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

    if (songScanState.isNotEmpty) {
      return SongList(songs: songScanState);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //if (songScanState.errorMsg.isNotEmpty) Text(songScanState.errorMsg),
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
