// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/platform/mobile/components/album_art.dart';
import 'package:soul_player/platform/mobile/services/justAudioProvider.dart';
import 'package:soul_player/platform/mobile/screens/library/widgets/song_list.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/providers/nowplaying_providers.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/providers/playlist_controll.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/widgets/control_pro.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/widgets/controller_classic.dart';
import 'package:soul_player/platform/mobile/screens/settings/setting_controller.dart';
import 'package:soul_player/platform/mobile/utils/snackbar.dart';

import 'components/sleep_timer.dart';
import 'providers/now_playingg_state.dart';
import 'widgets/icon_button.dart';

class MediaControl extends StatelessWidget {
  const MediaControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Color.fromARGB(255, 28, 28, 32),
      ),
      child: Column(
        children: [
          _buildInfo(),
          const Seekbar(),
          //const DurationInfo(),
          const SizedBox(height: 10.0),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final bool ui =
                  ref.watch(settingsProvider).classicMediacontroller;
              return ui ? ControllerClassic() : ControlMenu();
            },
          )
        ],
      ),
    );
  }

  Container _buildInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 20, 20, 20),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 29, 29, 29).withOpacity(0.2),
            offset: const Offset(0, .05),
            blurRadius: .5,
          ),
          const BoxShadow(
            color: Color.fromARGB(241, 48, 48, 48),
            offset: Offset(0, .65),
            blurRadius: 1,
          ),
        ],
      ),
      child: _buildSongInfoCard(),
    );
  }

  Consumer _buildSongInfoCard() {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final playing = ref.watch(nowPlayingProvider);
        return ListTile(
          tileColor: Colors.transparent,
          leading: ArtworkWidget(id: playing.currentSong.id),
          title: Text(
            playing.currentSong.title,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            playing.currentSong.artist.toString(),
            style: const TextStyle(color: Color.fromARGB(169, 255, 255, 255)),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: CustomTextButton(
            ref: ref,
          ),
        );
      },
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final WidgetRef ref;
  const CustomTextButton({
    super.key,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          ref.read(nowPlayingProvider.notifier).next();
        },
        highlightColor: Colors.blue,
        splashColor: Colors.red,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          margin: const EdgeInsets.all(.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(238, 39, 39, 39),
                offset: Offset(0, .05),
                blurRadius: 1,
              ),
              BoxShadow(
                color: Color.fromARGB(52, 0, 0, 0),
                offset: Offset(1, -1),
                blurRadius: 2,
              ),
            ],
            color: secondaryDark, // Grey background
            border: Border.all(color: deepDark, width: 2), // 2px block border
            shape: BoxShape.rectangle,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class ControlMenu extends StatelessWidget {
  const ControlMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 180,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 130,
              width: 130,
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  return const IpodControl();
                },
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: CustomIconButton(
              icon: Icons.list,
              onPressed: () {
                soulBottomSheet(context, const NowPlayList());
              },
              media: 32,
              radius: 100,
              size: 8,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: CustomIconButton(
              icon: Icons.alarm_on,
              media: 32,
              radius: 100,
              size: 8,
              onPressed: () {
                showDialog(
                  context: context,
                  useSafeArea: true,
                  barrierDismissible: true,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text(
                        'Sleep Timer  == [Min]',
                        style: TextStyle(
                            color: wh,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      content: SetTimer(),
                    );
                  },
                );
              },
            ),
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final watch = ref.watch(nowPlayingProvider);

              return Positioned(
                left: 0,
                bottom: 0,
                child: CustomIconButton(
                  icon: Icons.repeat,
                  onPressed: () {
                    final repeat = ref.read(nowPlayingProvider.notifier);
                    switch (watch.repeatMode) {
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
                  },
                  media: 32,
                  radius: 100,
                  size: 8,
                ),
              );
            },
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              bool shuffle = ref.watch(nowPlayingProvider).isShuffle;
              return Positioned(
                right: 0,
                bottom: 0,
                child: CustomIconButton(
                  icon: shuffle ? Icons.shuffle : Icons.arrow_forward_rounded,
                  onPressed: () {
                    ref.read(nowPlayingProvider.notifier).shuffle();
                    message('Shuffle is $shuffle', context);
                  },
                  media: 32,
                  radius: 100,
                  size: 8,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NowPlayList extends ConsumerWidget {
  const NowPlayList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ScrollController();
    final nowplay = ref.watch(nowPlayingProvider);
    final offset = ref.watch(getCurrentInListProvider);
    void goToIndex() {
      controller.animateTo(offset * 50.toDouble(),
          duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
      //controller.position.jumpTo(500)
    }

    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              goToIndex();
            },
            child: const Text('Go to scroll')),
        Expanded(child: SongTile(media: nowplay.queue)),
      ],
    );
  }
}

class DurationInfo extends StatelessWidget {
  const DurationInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final duration = ref.watch(nowPlayingProvider);
        final String time =
            Duration(milliseconds: duration.currentSong.duration ?? 000000)
                .toString();
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                duration.currentPosition.toString().substring(
                    0, duration.currentPosition.toString().length - 7),
                style: const TextStyle(color: wh),
              ),
              Text(
                time.substring(0, time.length - 7),
                style: const TextStyle(color: wh),
              )
            ],
          ),
        );
      },
    );
  }
}

class Seekbar extends ConsumerWidget {
  const Seekbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(nowPlayingProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: ProgressBar(
        progressBarColor: primary,
        thumbColor: primary,
        baseBarColor: primary.withOpacity(.35),
        progress: duration.currentPosition,
        total: Duration(milliseconds: duration.currentSong.duration ?? 5000000),
        onSeek: (duration) {
          ref.read(nowPlayingProvider.notifier).seek(duration);
        },
        timeLabelTextStyle: const TextStyle(color: Colors.white),
        thumbCanPaintOutsideBar: false,
        timeLabelLocation: TimeLabelLocation.below,
        timeLabelPadding: 8,
        thumbGlowColor: const Color.fromARGB(255, 255, 85, 7),
        thumbGlowRadius: 9,
      ),
    );
  }
}

class IpodControl extends ConsumerWidget {
  const IpodControl({
    super.key,
  });
  Color genColor(NowPlayingState playing) {
    // Use a hue value between 0 and 360 degrees
    int index = playing.currentPosition.inSeconds;
    double hue = (index * 137.5) % 360; // Golden angle approximation
    return HSLColor.fromAHSL(1.0, hue, 1.0, 0.6).toColor();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playing = ref.watch(nowPlayingProvider);
    final light = ref.watch(settingsProvider).lightIndicator;
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

    void _onSwipeLeft() {
      print('Swiped left');
    }

    void _onSwipeRight() {
      print('Swiped right');
    }

    void _onSwipeUp() {
      print('Swiped up');
    }

    void _onSwipeDown() {
      print('Swiped down');
    }

    return ControlPro(
      onTopButtonPress: _onTopButtonPress,
      onBottomButtonPress: _onBottomButtonPress,
      onLeftButtonPress: _onLeftButtonPress,
      onRightButtonPress: _onRightButtonPress,
      onPlayPauseButtonPress: _onPlayPauseButtonPress,
      onSwipeLeft: _onSwipeLeft,
      onSwipeRight: _onSwipeRight,
      onSwipeUp: _onSwipeUp,
      onSwipeDown: _onSwipeDown,
      isGestureEnabled: true,
      playing: playing.isPlaying,
      animateColor: playing.isPlaying && light ? genColor(playing) : primary,
    );
  }
}
