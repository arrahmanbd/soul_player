import 'package:broken_soul/providers/music_player/player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:broken_soul/providers/music_player/player_provider.dart';
import 'package:glass/glass.dart';
import 'package:move_to_background/move_to_background.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerProvider);
    final playerNotifier = ref.read(playerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Audio Player'),
        actions: [
          IconButton(onPressed: () {
            MoveToBackground.moveTaskToBack();
            
          }, icon: Icon(Icons.remove_circle_outline)),
          IconButton(onPressed: () {
            SystemNavigator.pop();
          }, icon: Icon(Icons.hide_source_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Current Position: ${playerState.position.toString()}'),
            Text('Duration: ${playerState.duration.toString()}'),
            Slider(
              value: playerState.position.inSeconds.toDouble(),
              max: playerState.duration.inSeconds.toDouble(),
              onChanged: (value) {
                //playerNotifier.audioPlayer.seekSong(1000);
                print('OkSOngs $value');

                playerNotifier.setPosition(Duration(seconds: value.toInt()));
                //playerNotifier.audioPlayer.seekSong(value.toInt());
              },
            ),
            playerState.mode == PlayerMode.playing
                ? IconButton(
                    icon: const Icon(Icons.pause),
                    onPressed: () {
                      playerNotifier.pause();
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {
                      playerNotifier.play(playerState.currentSong);
                    },
                  ),
            IconButton(
              icon: const Icon(Icons.stop),
              onPressed: () {
                playerNotifier.stop();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () {
                    playerNotifier.playPrevious();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: () {
                    playerNotifier.playNext();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Volume Control'),
            Slider(
              value: playerState.volume,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                playerNotifier.audioPlayer.setVolume(value);
                playerNotifier.setVolume(value);
              },
            ),
          ],
        ),
      ),
    ).asGlass();
  }
}
