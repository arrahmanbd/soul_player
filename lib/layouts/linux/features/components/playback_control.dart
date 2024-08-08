//media panel bottom

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/core/styles/theme_text.dart';
import 'package:soul_player/database/drift/data/database.dart';
import 'package:soul_player/layouts/linux/providers/player/player_provider.dart';

import 'control_buttons.dart';

class PlayBackControl extends ConsumerWidget {
  const PlayBackControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(linuxPlayerProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 120,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 3, 179, 185)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ProgressBar(
              progressBarColor: Colors.amber,
              thumbColor: Colors.amber,
              baseBarColor: Colors.amber.withOpacity(.35),
              progress: player.position,
              total: player.duration,
              onSeek: (duration) {
                //ref.read(nowPlayingProvider.notifier).seek(duration);
                ref.read(linuxPlayerProvider.notifier).seek(duration);
              },
              timeLabelTextStyle: const TextStyle(color: Colors.white),
              thumbCanPaintOutsideBar: false,
              timeLabelLocation: TimeLabelLocation.none,
              timeLabelPadding: 8,
              thumbGlowColor: const Color.fromARGB(255, 255, 85, 7),
              thumbGlowRadius: 9,
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _buildSongImage(player.currentSong),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        player.currentSong.title.toString(),
                        style: Typo.bodyMedium,
                      ),
                      Text(
                        player.currentSong.artist.toString(),
                        style: Typo.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const Expanded(child: ControlButtons()),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.bolt),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSongImage(Song song) {
    return 
    // song.picture != null && song.picture!.data.isNotEmpty
    //     ? Image.memory(
    //         song.picture!.data,
    //         fit: BoxFit.cover,
    //         height: 70,
    //         width: 120,
    //       )
    //     : 
        const Icon(Icons.music_note);
  }
}
