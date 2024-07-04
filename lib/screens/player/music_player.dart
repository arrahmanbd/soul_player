import 'package:broken_soul/providers/music_player/player_provider.dart';
import 'package:broken_soul/providers/music_player/player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicPlayer extends ConsumerWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerProvider);
    return Column(
       children: [
        const Text('Music Player'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (playerState.mode == PlayerMode.playing)
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () {
                  // Handle pause action
                  ref.read(playerProvider.notifier).pause();
                },
              ),
            if (playerState.mode == PlayerMode.ause)
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  // Handle play action
                  ref.read(playerProvider.notifier).play(''); 
                },
              ),
            IconButton(
              icon: const Icon(Icons.stop),
              onPressed: () {
                // Handle stop action
                ref.read(playerProvider.notifier).stop();
              },
            ),
          ],
        ),
      ],
    );
  }
}