import 'package:soul_player/database/drift/data/database.dart';
import 'package:soul_player/database/drift/data/dummy_song.dart';
import 'package:soul_player/layouts/linux/providers/player/player_state.dart';
import 'package:soul_player/layouts/linux/services/audio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LinuxPlayerNotifier extends StateNotifier<PlayerState> {
  final AudioService audioPlayer;
  final Ref ref;
  LinuxPlayerNotifier(this.audioPlayer, this.ref)
      : super(PlayerState(mode: PlayerMode.stop, currentSong: dummySong()));

  void play(Song song) {
    state = state.copyWith(mode: PlayerMode.playing, currentSong: song);
    audioPlayer.play(song.location);
    // if (song.picture != null && song.picture!.data.isNotEmpty) {
    //   ref.read(skinProvider.notifier).autoSkin(MemoryImage(song.picture!.data));
    // }
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

  void setPlaylist(List<Song> playlist, int startIndex) {
    audioPlayer.setPlaylist(playlist, startIndex);
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
