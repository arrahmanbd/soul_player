import 'package:audioplayers/audioplayers.dart';
import 'package:broken_soul/providers/music_player/player_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/song_model.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Ref ref;
  //cleaner method is
  //final PlayerNotifier _playerNotifier;

  List<SongModel> playlist = [];
  int currentIndex = -1;

  AudioService(this.ref) {
    _audioPlayer.onDurationChanged.listen((duration) {
      ref.read(playerProvider.notifier).setDuration(duration);
    });

    _audioPlayer.onDurationChanged.listen((position) {
      ref.read(playerProvider.notifier).setPosition(position);
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      // Implement logic for when playback completes (e.g., play next song)
      ref.read(playerProvider.notifier).playNext();
    });
  }

  Future<void> play(String songFile) async {
    await _audioPlayer.play(DeviceFileSource(songFile));
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<void> resume() async {
    await _audioPlayer.resume();
  }

  Future<void> setVolume(double vol) async {
    await _audioPlayer.setVolume(vol);
  }

  Future<void> seekSong(int seekTime) async {
    await _audioPlayer.seek(Duration(seconds: seekTime));
  }

  Future<void> setPlaylist(List<SongModel> newplaylist, int startIndex) async {
    playlist = newplaylist;
    currentIndex = startIndex;
    await play(playlist[currentIndex].location);
  }

  Future<void> playNext() async {
    if (currentIndex + 1 < playlist.length) {
      currentIndex++;
      ref.read(playerProvider.notifier).play(playlist[currentIndex]);

      /// await play(playlist[currentIndex].location);
    }
  }

  Future<void> playPrevious() async {
    if (currentIndex - 1 >= 0) {
      currentIndex--;
      ref.read(playerProvider.notifier).play(playlist[currentIndex]);
      //await play(playlist[currentIndex].location);
    }
  }

  //percent seek
  Future<void> seekPercent(double percent) async {
    final duration = Duration(microseconds: 234);
    if (duration == null) {
      print(
        'Failed to get duration for proportional seek.',
      );
      return;
    }
    final position = duration * percent;
    _seekDuration(position);
  }

  Future<void> _seekDuration(Duration position) async {
    await _audioPlayer.seek(position);
   // ref.read(playerProvider.notifier).setDuration(position);
  }
}

final audioPlayerProvider = Provider<AudioService>((ref) {
  return AudioService(ref);
});
