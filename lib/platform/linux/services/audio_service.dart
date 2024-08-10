import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/database/data/database.dart';
import 'package:soul_player/platform/linux/features/player/controller/player_provider.dart';

class AudioService {
  final AudioPlayer audioPlayer;
  final Ref ref;

  List<Song> playlist = [];
  int currentIndex = -1;

  AudioService(this.ref, this.audioPlayer) {
    audioPlayer.onDurationChanged.listen((duration) {
      ref.read(linuxPlayerProvider.notifier).setDuration(duration);
    });

    audioPlayer.onPlayerComplete.listen((event) {
      playNext();
    });
    audioPlayer.onPositionChanged.listen((event) {
      ref
          .read(linuxPlayerProvider.notifier)
          .setPosition(Duration(seconds: event.inSeconds));
    });
  }

  Future<void> play(int songId) async {
    ref.read(linuxPlayerProvider.notifier).updateScreen(playlist[songId]);
    try {
      await audioPlayer.play(DeviceFileSource(playlist[songId].location));
    } catch (e) {
      //Report(message: e.toString());
    }
  }

  Future<void> pause() async {
    await audioPlayer.pause();
  }

  Future<void> stop() async {
    await audioPlayer.stop();
  }

  Future<void> resume() async {
    await audioPlayer.resume();
  }

  Future<void> setVolume(double vol) async {
    await audioPlayer.setVolume(vol);
  }

  Future<void> seekSong(int seekTime) async {
    await audioPlayer.seek(Duration(seconds: seekTime));
  }

  Future<void> setPlaylist(List<Song> newplaylist, int startIndex) async {
    playlist = newplaylist;
    currentIndex = startIndex;
    await play(currentIndex);
  }

  Future<void> playNext() async {
    if (currentIndex + 1 < playlist.length) {
      currentIndex++;
      await play(currentIndex);
       //ref.read(linuxPlayerProvider.notifier).updateScreen(playlist[currentIndex]);
    }
  }

  Future<void> playPrevious() async {
    if (currentIndex - 1 >= 0) {
      currentIndex--;
      await play(currentIndex);
      // ref.read(linuxPlayerProvider.notifier).updateScreen(playlist[currentIndex]);
    }
  }

  Future<void> seekPercent(double percent) async {}

  Future<void> seekAudio(Duration time) async {
    await audioPlayer.seek(time);
  }
}

final audioPlayerProvider = Provider<AudioService>((ref) {
  return AudioService(ref, AudioPlayer());
});
