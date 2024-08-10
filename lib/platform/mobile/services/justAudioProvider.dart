// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/providers/nowplaying_providers.dart';

enum RepeatMode { off, one, all }

enum Suffle { on, off }

class PlayerService {
  final AudioPlayer justAudio;
  final Ref ref;

  List<SongModel> playlist = [];
  int currentIndex = -1;

  PlayerService(this.ref, this.justAudio) {
    justAudio.bufferedPositionStream.listen((duration) {
      print('duraion:' + duration.toString());
      ref.read(nowPlayingProvider.notifier).setProgress(duration);
    });

    justAudio.playerStateStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        playNext();
      }
    });

    // justAudio.positionStream.listen((event) {
    //   // print(event);
    //   //ref.read(nowPlayingProvider.notifier).setProgress(event);
    // });
  }

  Future<void> play(String songFile) async {
    skipSilence();
    await justAudio.setFilePath(songFile);
    await justAudio.play();
  }

  Future<void> pause() async {
    await justAudio.pause();
  }

  Future<void> stop() async {
    await justAudio.stop();
  }

  Future<void> resume() async {
    await justAudio.play();
  }

  Future<void> setVolume(double vol) async {
    await justAudio.setVolume(vol);
  }

  Future<void> seekSong(int seekTime) async {
    await justAudio.seek(Duration(seconds: seekTime));
  }

  Future<void> setPlaylist(List<SongModel> newPlaylist, int startIndex) async {
    playlist = newPlaylist;
    currentIndex = startIndex;
    await play(playlist[currentIndex].data);
    updateScreen(playlist[currentIndex]);
  }

  Future<void> playNext() async {
    if (currentIndex + 1 < playlist.length) {
      currentIndex++;
      await play(playlist[currentIndex].data);
      updateScreen(playlist[currentIndex]);
    }
  }

  Future<void> playPrevious() async {
    if (currentIndex - 1 >= 0) {
      currentIndex--;
      await play(playlist[currentIndex].data);
      updateScreen(playlist[currentIndex]);
    }
  }

  Future<void> seekPercent(double percent) async {
    final duration = justAudio.duration;
    if (duration != null) {
      final position = duration * percent;
      await justAudio.seek(position);
    }
  }

  Future<void> seekAudio(Duration time) async {
    await justAudio.seek(time);
  }

  void updateScreen(SongModel song) {
    ref.read(nowPlayingProvider.notifier).updateState(song);
  }

  //repeart
  void setRepeatMode(RepeatMode repeatMode) {
    switch (repeatMode) {
      case RepeatMode.off:
        justAudio.setLoopMode(LoopMode.off);
        break;
      case RepeatMode.one:
        justAudio.setLoopMode(LoopMode.one);
        break;
      case RepeatMode.all:
        justAudio.setLoopMode(LoopMode.all);
        break;
    }
  }

  //shuffle
  void toggleShuffle(bool value) {
    playlist.shuffle();
    justAudio.setShuffleModeEnabled(value);
  }

  void skipSilence() {
    justAudio.skipSilenceEnabled;
  }
}

final audioPlayerService = Provider<PlayerService>((ref) {
  return PlayerService(ref, AudioPlayer());
});
