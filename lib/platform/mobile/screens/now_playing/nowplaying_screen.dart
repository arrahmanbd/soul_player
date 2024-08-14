import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/platform/mobile/components/album_art.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/media_control.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/providers/nowplaying_providers.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/widgets/icon_button.dart';
import 'package:soul_player/platform/mobile/screens/settings/setting_controller.dart';

import '../library/library_screen.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: deepDark,
      body: SafeArea(
        child: Consumer(
          builder: (_, WidgetRef ref, __) {
            final state = ref.watch(settingsProvider);
            return Stack(children: [
              if (state.particleEffect)
                CircularParticle(
                  height: mq.height,
                  width: mq.width,
                  isRandomColor: state.randomColor,
                ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MediaHeader(),
                  SizedBox(height: 60.0),
                  Expanded(child: MediaControl()),
                ],
              ),
            ]);
          },
        ),
      ),
    );
  }
}

class MediaHeader extends StatelessWidget {
  const MediaHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double high = MediaQuery.of(context).size.height / 2.1;
    return Stack(
      children: [
        Container(
          color: secondaryDark,
          padding:
              const EdgeInsets.only(top: 12, bottom: 48, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIconButton(
                icon: Icons.arrow_back_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LibraryScreen(),
                    ),
                  );
                },
                effect: false,
              ),
              const Text(
                'Now playing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: .08,
                ),
              ),
              CustomIconButton(
                icon: Icons.notification_important_outlined,
                onPressed: () {
                  AwesomeNotifications().createNotification(
                      content: NotificationContent(
                    id: 10,
                    channelKey: 'basic_channel',
                    actionType: ActionType.Default,
                    title: 'Hello World!',
                    body: 'This is my first notification!',
                  ));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SettingPage(),
                  //   ),
                  // );
                },
                effect: false,
              ),
            ],
          ),
        ),
        Positioned(
          top: 75, // Adjust the top position for overlap
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 250,
              height: 280,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: deepDark),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(66, 243, 11, 11),
                    offset: Offset(3, 0),
                    blurRadius: 6,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(66, 11, 208, 243),
                    offset: Offset(-3, 0),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  final now = ref.watch(nowPlayingProvider);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: now.isPlaying && now.currentSong != null
                        ? ArtworkWidget(id: now.currentSong.id)
                        : Image.asset(
                            'assets/images/thumb.jpg',
                            width: 250,
                            height: 280,
                            fit: BoxFit.cover,
                          ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: high,
        ),
      ],
    );
  }
}
