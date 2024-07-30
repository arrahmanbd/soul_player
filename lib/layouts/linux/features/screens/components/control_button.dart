import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/linux/providers/player/player_provider.dart';

import '../widgets/control_button.dart';

class MediaController extends StatelessWidget {
  const MediaController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        return ControllerButtons(
          onPlay: () {
            ref.read(linuxPlayerProvider.notifier).resume();
          },
          onPause: () {
            ref.read(linuxPlayerProvider.notifier).pause();
          },
          onNext: () {
            ref.read(linuxPlayerProvider.notifier).playNext();
          },
          onPrevious: () {
            ref.read(linuxPlayerProvider.notifier).playPrevious();
          },
        );
      },
    );
  }
}
