import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'package:metadata_god/metadata_god.dart';
import 'package:on_audio_room/on_audio_room.dart';
import 'package:soul_player/utils/device_utils.dart';

import '../providers/shared_preference.dart';

class StartupService {
  StartupService._StartupService();

  static Future<void> initialize() async {
    //intialize locale
    await EasyLocalization.ensureInitialized();
    //initialize sharedpreference
    final prefsService = SharedPreferencesService();
    await prefsService.init();
    if (GlobalUtils.mobile) {
      //  Initialize database for mobile
      await OnAudioRoom().initRoom();
      AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        if (!isAllowed) {
          // This is just a basic example. For real apps, you must show some
          // friendly dialog box before call the request method.
          // This is very important to not harm the user experience
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });
      //  Initialize Notification
      //  await JustAudioBackground.init(
      //  androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      //  androidNotificationChannelName: 'Audio playback',
      //  androidNotificationOngoing: true,
      // );
      AwesomeNotifications().initialize(
          // set the icon to null if you want to use the default app icon
          'resource://mipmap-hdpi/ic_launcher',
          [
            NotificationChannel(
                channelGroupKey: 'basic_channel_group',
                channelKey: 'basic_channel',
                channelName: 'Basic notifications',
                channelDescription: 'Notification channel for basic tests',
                defaultColor: Color(0xFF9D50DD),
                ledColor: Colors.white)
          ],
          // Channel groups are only visual and are not required
          channelGroups: [
            NotificationChannelGroup(
                channelGroupKey: 'basic_channel_group',
                channelGroupName: 'Basic group')
          ],
          debug: true);
    }
    if (GlobalUtils.desktop) {
      //  Initialize Metadata Extractor
      MetadataGod.initialize();
      await windowManager.ensureInitialized();

      WindowOptions windowOptions = const WindowOptions(
        size: Size(1000, 600),
        backgroundColor: Colors.transparent,
        skipTaskbar: false,
        titleBarStyle: TitleBarStyle.hidden,
      );

      await windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.setAsFrameless();
        await windowManager.show();
        await windowManager.focus();
      });
    }
  }
}
