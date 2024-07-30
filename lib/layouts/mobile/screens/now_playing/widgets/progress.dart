import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/mobile/screens/now_playing/providers/nowplaying_providers.dart';

class Progress extends StatelessWidget {
  const Progress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final player = ref.watch(nowPlayingProvider);
    
        // Ensure duration is not zero to avoid division by zero
        final double progress = (player.currentPosition.inSeconds > 0)
            ? player.currentPosition .inSeconds / player.songDuration .inSeconds
            : 0.0;
        return Stack(
          children: [
            Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular( 12),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(240, 65, 65, 65),
                    offset: Offset(0, -.65),
                    blurRadius: 1,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(52, 0, 0, 0),
                    offset: Offset(1, -1),
                    blurRadius: 2,
                  ),
                ],
                color: const Color(0xFF1C1C20), // Grey background
                border: Border.all(
                    color: const Color.fromARGB(255, 15, 15, 15),
                    width: 3), // 2px block border
                shape: BoxShape.rectangle,
              ),
            ),
            Container(
              height: 5,
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular( 12),
                  color: Colors.red, 
              ),
              width: MediaQuery.of(context).size.width * .12, // Width based on progress
            ),
          ],
        );
      },
    );
  }
}