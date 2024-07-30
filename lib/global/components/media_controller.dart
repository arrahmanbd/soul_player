import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/linux/providers/player/player_state.dart';
import 'package:soul_player/layouts/mobile/screens/now_playing/providers/nowplaying_providers.dart';

import '../../layouts/linux/providers/player/player_provider.dart';
import 'icon_button.dart';

class LinuxControllButton extends ConsumerWidget {
  const LinuxControllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playing = ref.watch(linuxPlayerProvider);


    // void repeat() {
    //   final repeat = ref.read(nowPlayingProvider.notifier);
    //   switch (playing.repeatMode) {
    //     case RepeatMode.off:
    //       repeat.repeat(RepeatMode.one);
    //       message('Repeat 1 song enabled', context);
    //       break;
    //     case RepeatMode.one:
    //       repeat.repeat(RepeatMode.all);
    //       message('Repeat All song enabled', context);
    //       break;
    //     case RepeatMode.all:
    //       repeat.repeat(RepeatMode.off);
    //       message('Repeat song disabled', context);
    //       break;
    //     default:
    //       message('Repeat off', context);
    //       break;
    //   }
    // }

    void _onTopButtonPress() {
      print('volume up');
      ref.read(nowPlayingProvider.notifier).setVolume();
    }

    void _onBottomButtonPress() {
      print('volume down');
      ref.read(nowPlayingProvider.notifier).downVolume();
    }

    void _onLeftButtonPress() {
      print('Left button pressed');
       ref.read(linuxPlayerProvider.notifier).playPrevious();
    }

    void _onRightButtonPress() {
      print('Right button pressed');
       ref.read(linuxPlayerProvider.notifier).playNext();
    }

    void _onPlayPauseButtonPress() {
      print('Play/Pause button pressed');
      if (playing.mode==PlayerMode.playing) {
         ref.read(linuxPlayerProvider.notifier).pause();
      } else {
        ref.read(linuxPlayerProvider.notifier).resume();
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LinuxButton(
          icon: Icons.repeat,
          onPressed: (){},
          radius: 100,
        ),
        LinuxButton(
          icon: Icons.skip_previous,
          onPressed: _onLeftButtonPress,
          radius: 100,
          size: 12,
        ),
        LinuxButton(
          icon: playing.mode==PlayerMode.playing ? Icons.pause : Icons.play_arrow,
          onPressed: _onPlayPauseButtonPress,
          radius: 100,
          size: 18,
          media: 24,
        ),
        LinuxButton(
          icon: Icons.skip_next,
          onPressed: _onRightButtonPress,
          radius: 100,
          size: 12,
        ),
        LinuxButton(
          icon: Icons.shuffle,
          onPressed: (){},
          radius: 100,
        )
      ],
    );
  }
}
