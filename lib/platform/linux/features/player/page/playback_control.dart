//media panel bottom

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:soul_player/core/styles/theme_text.dart';
import 'package:soul_player/database/data/database.dart';
import 'package:soul_player/database/repository/database_repository.dart';
import 'package:soul_player/platform/linux/features/player/controller/player_provider.dart';
import 'package:soul_player/utils/base64_image.dart';

import '../widgets/control_buttons.dart';

class PlayBackControl extends ConsumerWidget {
  const PlayBackControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(linuxPlayerProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 150,
      color: Color.fromARGB(255, 40, 157, 235),
      //decoration: const BoxDecoration(color: Color.fromARGB(255, 3, 179, 185)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ProgressBar(
              progressBarColor: Colors.amber,
              thumbColor: Colors.amber,
              baseBarColor: Colors.amber.withOpacity(.35),
              progress: player.seekBarPosition,
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
                      child: SizedBox(
                          height: 80,
                          width: 120,
                          child: buildSongImage(player.currentSong.picture)),
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
                    icon: player.isFavorite
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      ref.read(databaseRepository).markAsFavorite(0);
                    },
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
}
