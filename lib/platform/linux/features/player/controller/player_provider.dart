import 'package:soul_player/database/data/database.dart';
import 'package:soul_player/database/data/dummy_song.dart';
import 'package:soul_player/platform/linux/features/player/controller/player_state.dart';
import 'package:soul_player/platform/linux/services/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LinuxPlayerNotifier extends StateNotifier<PlayerState> {
  final AudioService audioPlayer;
  final Ref ref;
  LinuxPlayerNotifier(this.audioPlayer, this.ref)
      : super(
          PlayerState(
            currentSong: dummySong(),
            isPlaying: false,
          ),
        );

  void pause() {
    state = state.copyWith(mode: RepeatMode.all);
    audioPlayer.pause();
  }

  void updateScreen(Song current) {
    print(current.title.toString());
    state= state.copyWith(isPlaying: true, isFavorite: false, currentSong: current);
  }

  void stop() {
    state = state.copyWith(mode: RepeatMode.stop);
    audioPlayer.stop();
  }

  void resume() {
    state = state.copyWith(mode: RepeatMode.one);
    audioPlayer.resume();
  }

  void setDuration(Duration duration) {
    state = state.copyWith(duration: duration);
  }

  void setPosition(Duration position) {
    audioPlayer.seekPercent(2);
    state = state.copyWith(seekBarPosition: position);
  }

  void setVolume(double volume) {
    state = state.copyWith(volume: volume);
  }

  void setPlaylist(List<Song> playlist, int startIndex) {
    audioPlayer.setPlaylist(playlist, startIndex);
    updateScreen(playlist[startIndex]);
    print(playlist[startIndex].title.toString());
  }

  void playNext() {
    audioPlayer.playNext();
  }

  void playPrevious() {
    audioPlayer.playPrevious();
  }

  void seek(Duration duration) {
    audioPlayer.seekAudio(duration);
  }
}

final linuxPlayerProvider =
    StateNotifierProvider<LinuxPlayerNotifier, PlayerState>((ref) {
  final audioPlayer = ref.read(audioPlayerProvider);
  return LinuxPlayerNotifier(audioPlayer, ref);
});
