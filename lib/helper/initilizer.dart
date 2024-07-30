import 'package:metadata_god/metadata_god.dart';
import 'package:on_audio_room/on_audio_room.dart';
import 'package:soul_player/utils/device_utils.dart';

class StartupService {
  StartupService._StartupService();

 static Future<void> initialize() async {
    if (GlobalUtils.mobile) {
      //  Initialize database for mobile
      await OnAudioRoom().initRoom();
      //  Initialize Notification
      //  await JustAudioBackground.init(
      //  androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      //  androidNotificationChannelName: 'Audio playback',
      //  androidNotificationOngoing: true,
      // );
    }
    if (GlobalUtils.desktop) {
      //  Initialize Metadata Extractor
      MetadataGod.initialize();
    }
  }
}
