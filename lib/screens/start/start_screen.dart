import 'package:flutter/material.dart';

import '../allsongs/all_songs.dart';
import '../player/music_player.dart';

class AudioPlayerWidget extends StatelessWidget {
  const AudioPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 400,
          child: ScanAllSongs(),
        ),
        MusicPlayer(),
      ],
    );
  }
}
