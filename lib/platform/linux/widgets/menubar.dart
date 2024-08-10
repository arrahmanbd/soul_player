// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/global/components/media_controller.dart';
import 'package:yaru/yaru.dart';

import 'package:soul_player/platform/linux/features/player/controller/player_provider.dart';

class MusicProgressBar extends StatefulWidget {
  final double progress;

  const MusicProgressBar({
    Key? key,
    required this.progress,
  }) : super(key: key);
  @override
  _MusicProgressBarState createState() => _MusicProgressBarState();
}

class _MusicProgressBarState extends State<MusicProgressBar> {
  bool isDurationZero = false;

  @override
  Widget build(BuildContext context) {
    // Calculate progress
    double progress = 0.0;

    if (progress > 0) {
      progress = widget.progress;
    } else {
      // Duration is 0, trigger animation to decrease width to 0
      progress = 1.0; // Ensures the bar is visible before animating to 0
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          isDurationZero = true;
        });
      });
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          color: Theme.of(context).primaryColor, // Foreground color
          height: 120,
          width: isDurationZero
              ? 0
              : constraints.maxWidth *
                  progress, // Width based on progress or 0 if duration is 0
        );
      },
    );
  }
}

class CustomMenuBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomMenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize:
          const Size.fromHeight(240.0), // Set the desired height here
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 54),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Menu items on the left

              const LinuxControllButton(),
              const SizedBox(width: 2.0),
              const MusicInfoMenu(),
              const Spacer(), // Spacer to push the icon buttons to the right
              // Icon buttons on the right
              IconButton(icon: const Icon(YaruIcons.menu), onPressed: () {}),
              IconButton(
                  icon: const Icon(YaruIcons.settings), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0);
}

class MusicInfoMenu extends StatelessWidget {
  const MusicInfoMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final song = ref.watch(linuxPlayerProvider);
        return SizedBox(
          width: 400,
          child: YaruTile(
            title: Text(song.currentSong.title,
                style: const TextStyle(overflow: TextOverflow.ellipsis)),
            trailing: const Icon(YaruIcons.speaker),
            leading: Container(
              width: 64,
              height: 64,
              color: YaruColors.coolGrey.withOpacity(.15),
              child: const Icon(
                Icons.music_note,
                size: 48,
                color: Color.fromARGB(255, 39, 38, 38),
              ),
            ),
            subtitle: Consumer(
              builder: (_, WidgetRef ref, __) {
                final player = ref.watch(linuxPlayerProvider);
                // Ensure duration is not zero to avoid division by zero
                final double progress = (player.duration.inSeconds > 0)
                    ? player.seekBarPosition.inSeconds / player.duration.inSeconds
                    : 0.0;
                return YaruLinearProgressIndicator(
                  value: progress,
                  trackColor: YaruColors.coolGrey.withOpacity(.5),
                  trackStrokeWidth: 6,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
