import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/platform/mobile/services/justAudioProvider.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/providers/nowplaying_providers.dart';
import 'package:soul_player/platform/mobile/utils/snackbar.dart';

import 'icon_button.dart';

class ControllerClassic extends ConsumerWidget {
  const ControllerClassic({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playing = ref.watch(nowPlayingProvider);
    final bool shuffle = playing.isShuffle;
    void _shuffle() {
      ref.read(nowPlayingProvider.notifier).shuffle();
      message('Shuffle is $shuffle', context);
    }

    void repeat() {
      final repeat = ref.read(nowPlayingProvider.notifier);
      switch (playing.repeatMode) {
        case RepeatMode.off:
          repeat.repeat(RepeatMode.one);
          message('Repeat 1 song enabled', context);
          break;
        case RepeatMode.one:
          repeat.repeat(RepeatMode.all);
          message('Repeat All song enabled', context);
          break;
        case RepeatMode.all:
          repeat.repeat(RepeatMode.off);
          message('Repeat song disabled', context);
          break;
        default:
          message('Repeat off', context);
          break;
      }
    }

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
      ref.read(nowPlayingProvider.notifier).previus();
    }

    void _onRightButtonPress() {
      print('Right button pressed');
      ref.read(nowPlayingProvider.notifier).next();
    }

    void _onPlayPauseButtonPress() {
      print('Play/Pause button pressed');
      if (playing.isPlaying) {
        ref.read(nowPlayingProvider.notifier).pause();
      } else {
        ref.read(nowPlayingProvider.notifier).resume();
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomIconButton(
          icon: Icons.repeat,
          onPressed: repeat,
          radius: 100,
        ),
        CustomIconButton(
          icon: Icons.skip_previous,
          onPressed: _onLeftButtonPress,
          radius: 100,
          size: 12,
        ),
        CustomIconButton(
          icon: playing.isPlaying ? Icons.pause : Icons.play_arrow,
          onPressed: _onPlayPauseButtonPress,
          radius: 100,
          size: 18,
          media: 42,
        ),
        CustomIconButton(
          icon: Icons.skip_next,
          onPressed: _onRightButtonPress,
          radius: 100,
          size: 12,
        ),
        CustomIconButton(
          icon: shuffle ? Icons.shuffle : Icons.arrow_forward_rounded,
          onPressed: _shuffle,
          radius: 100,
        )
      ],
    );
  }
}
