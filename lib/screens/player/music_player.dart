import 'package:broken_soul/providers/music_player/player_provider.dart';
import 'package:broken_soul/providers/music_player/player_state.dart';
import 'package:broken_soul/screens/player/components/player_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glass/glass.dart';
import 'package:music_visualizer/music_visualizer.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

import 'data/config.dart';

class MusicPlayer extends ConsumerWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerProvider);
    return Stack(
      children: [
        CircularParticle(
          key: UniqueKey(),
          awayRadius: 80,
          numberOfParticles: 200,
          speedOfParticles: 4,
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          onTapAnimation: true,
          particleColor: Colors.white.withAlpha(150),
          awayAnimationDuration: const Duration(milliseconds: 300),
          maxParticleSize: 6,
          isRandSize: true,
          isRandomColor: true,
          randColorList: [
            Colors.red.withAlpha(210),
            Colors.white.withAlpha(210),
            Colors.yellow.withAlpha(210),
            Colors.green.withAlpha(210)
          ],
          awayAnimationCurve: Curves.easeInOutBack,
          enableHover: true,
          hoverColor: Colors.white,
          hoverRadius: 90,
          connectDots: false, //not recommended
        ).asGlass(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            const SquarePercentIndicator(
              width: 140,
              height: 140,
              startAngle: StartAngle.bottomRight,
              reverse: true,
              borderRadius: 25,
              shadowWidth: 1.5,
              progressWidth: 5,
              shadowColor: Colors.grey,
              progressColor: Colors.blue,
              progress: 0.54,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Icon(
                    Icons.music_note_outlined,
                    size: 80,
                  ),
                ),
              ),
            ).asGlass(
                clipBorderRadius: const BorderRadius.all(Radius.circular(25))),
            const SizedBox(height: 30.0),
            Text(
              'Pagol Ei Duti Cokh Tomar',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 120,
              child: MusicVisualizer(
                barCount: 100,
                colors: mcolors,
                duration: mduration,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text('Unknown Aritist'),
            const Text('Unknown Album'),
            Container(
              width: 320,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MediaButtons(
                      icon: Icons.arrow_circle_left_outlined, action: () {}),
                  if (playerState.mode == PlayerMode.playing)
                    MediaButtons(
                        icon: Icons.pause,
                        action: () {
                          // Handle pause action
                          ref.read(playerProvider.notifier).pause();
                        }),
                  if (playerState.mode == PlayerMode.paused)
                    MediaButtons(
                        icon: Icons.play_arrow,
                        action: () {
                          // Handle play action
                          ref.read(playerProvider.notifier).resume();
                        }),
                  MediaButtons(
                      icon: Icons.arrow_circle_right_outlined, action: () {})
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
