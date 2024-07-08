import 'package:broken_soul/models/song_model.dart';
import 'package:broken_soul/providers/music_player/player_state.dart';
import 'package:broken_soul/services/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerNotifier extends StateNotifier<PlayerState> {
  final AudioService audioPlayer;

  PlayerNotifier(this.audioPlayer)
      : super(PlayerState(
            mode: PlayerMode.stop,
            currentSong: SongModel(location: '', title: '', folder: '')));

  void play(SongModel song) {
    state = state.copyWith(mode: PlayerMode.playing, currentSong: song);
    audioPlayer.play(song.location);
  }

  void pause() {
    state = state.copyWith(mode: PlayerMode.paused);
    audioPlayer.pause();
  }

  void stop() {
    state = state.copyWith(mode: PlayerMode.stop);
    audioPlayer.stop();
  }

  void resume() {
    state = state.copyWith(mode: PlayerMode.playing);
    audioPlayer.resume();
  }

  void setDuration(Duration duration) {
    state = state.copyWith(duration: duration);
  }

  void setPosition(Duration position) {
    audioPlayer.seekPercent(2);
    state = state.copyWith(position: position);
  }

  void setVolume(double volume) {
    state = state.copyWith(volume: volume);
  }

  void setPlaylist(List<SongModel> playlist, int startIndex) {
    audioPlayer.setPlaylist(playlist, startIndex);
  }

  void playNext() {
    audioPlayer.playNext();
  }

  void playPrevious() {
    audioPlayer.playPrevious();
  }
}

final playerProvider =
    StateNotifierProvider<PlayerNotifier, PlayerState>((ref) {
  final audioPlayer = ref.read(audioPlayerProvider);
  return PlayerNotifier(audioPlayer);
});
