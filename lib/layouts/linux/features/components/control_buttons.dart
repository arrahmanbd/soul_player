import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/linux/providers/player/player_provider.dart';
import 'package:soul_player/layouts/mobile/screens/now_playing/widgets/icon_button.dart';



class ControlButtons extends ConsumerWidget {
  const ControlButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(linuxPlayerProvider);

    void _shuffle() {
      // ref.read(nowPlayingProvider.notifier).shuffle();
      // message('Shuffle is', context);
    }

    void repeat() {
      //final repeat = ref.read(nowPlayingProvider.notifier);
      // switch (playing.repeatMode) {
      //   case RepeatMode.off:
      //     repeat.repeat(RepeatMode.one);
      //     message('Repeat 1 song enabled', context);
      //     break;
      //   case RepeatMode.one:
      //     repeat.repeat(RepeatMode.all);
      //     message('Repeat All song enabled', context);
      //     break;
      //   case RepeatMode.all:
      //     repeat.repeat(RepeatMode.off);
      //     message('Repeat song disabled', context);
      //     break;
      //   default:
      //     message('Repeat off', context);
      //     break;
      // }
    }

    void _onTopButtonPress() {
      print('volume up');
      
    }

    void _onBottomButtonPress() {
      print('volume down');
      
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
      if (player.currentSong.isPlaying) {
        ref.read(linuxPlayerProvider.notifier).pause();
      } else {
        ref.read(linuxPlayerProvider.notifier).resume();
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
          icon: player.currentSong.isPlaying ? Icons.pause : Icons.play_arrow,
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
          icon: true ? Icons.shuffle : Icons.arrow_forward_rounded,
          onPressed: _shuffle,
          radius: 100,
        )
      ],
    );
  }
}
