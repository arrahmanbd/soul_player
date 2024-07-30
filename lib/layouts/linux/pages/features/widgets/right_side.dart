import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/helper/linux_uilink.dart';
import 'package:soul_player/layouts/linux/features/screens/components/control_button.dart';
import 'package:soul_player/layouts/linux/providers/player/player_provider.dart';

import '../../../models/song_model.dart';

class NowPlayingScreen extends ConsumerWidget {
  const NowPlayingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(linuxPlayerProvider);
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(.02),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Now Playing',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Container(
                width: 200,
                height: 200,
                color: Colors.grey,
                child: _buildSongImage(player.currentSong)),
            const SizedBox(height: 20),
            Text(
              player.currentSong.title,
              style: TextStyle(fontSize: 20),
            ),
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final link = ref.watch(unilinkProvider);
                return Text('Location: ' + link);
              },
            ),
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final player = ref.watch(linuxPlayerProvider);
                Color primary = Theme.of(context).primaryColor;
                return ProgressBar(
                  progressBarColor: primary,
                  thumbColor: primary,
                  baseBarColor: primary.withOpacity(.35),
                  progress: player.position,
                  buffered: Duration(milliseconds: 2000),
                  total: player.duration,
                  onSeek: (duration) {
                    ref.read(linuxPlayerProvider.notifier).seek(duration);
                    print('User selected a new time: $duration');
                  },
                );
              },
            ),
            MediaController(),
          ],
        ),
      ),
    );
  }

  Widget _buildSongImage(AudioModel song) {
    return song.picture != null && song.picture!.data.isNotEmpty
        ? Image.memory(
            song.picture!.data,
            fit: BoxFit.cover,
          )
        : const Icon(Icons.music_note);
  }
}
