import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/platform/linux/features/player/controller/player_provider.dart';

class BorderProgress extends StatelessWidget {
  const BorderProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final player = ref.watch(linuxPlayerProvider);

        // Ensure duration is not zero to avoid division by zero
        final double progress = (player.duration.inSeconds > 0)
            ? player.seekBarPosition.inSeconds / player.duration.inSeconds
            : 0.0;
        return Stack(
          children: [
            Container(
              color: Theme.of(context).primaryColor.withOpacity(.12),
              height: 5,
            ),
            Container(
              color: Theme.of(context).primaryColor, // Foreground color
              height: 5,
              width: MediaQuery.of(context).size.width *
                  progress, // Width based on progress
            ),
          ],
        );
      },
    );
  }
}
