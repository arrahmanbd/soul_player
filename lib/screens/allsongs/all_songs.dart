import 'package:broken_soul/providers/music_player/player_provider.dart';
import 'package:broken_soul/providers/music_player/player_state.dart';
import 'package:broken_soul/providers/song_scanner/song_provider.dart';
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
      return ListView.builder(
        itemCount: songScanState.songs.length,
        itemBuilder: (BuildContext context, int index) {
          final song = songScanState.songs[index];
          return ListTile(
            leading: CircleAvatar(
              child: Image.memory(song.metadata.picture!.data),
            ),
            title: Text(song.metadata.title.toString()),
            subtitle: Text(song.metadata.artist.toString()),
            trailing: Consumer(
              builder: (_, WidgetRef ref, __) {
                final buttonState = ref.watch(playerProvider);
                if (buttonState.mode==PlayerMode.playing){
                  return IconButton(
                    onPressed: () {
                      ref.read(playerProvider.notifier).pause();
                    },
                    icon: const Icon(Icons.pause));
                }
                return IconButton(
                    onPressed: () {
                      ref.read(playerProvider.notifier).play(song.location);
                    },
                    icon: const Icon(Icons.play_arrow_outlined));
              },
            ),
          );
        },
      );
    }
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            // Trigger getAllSongs to start scanning songs
            final songScanner = ref.read(scanProvider.notifier);
            await songScanner.getAllSongs();
          },
          child: const Text('Scan Library')),
    );
  }
}
