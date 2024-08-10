import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:soul_player/platform/mobile/services/justAudioProvider.dart';

import 'now_playingg_state.dart';
import 'playlist_controll.dart';

class NowPlayingNotifier extends StateNotifier<NowPlayingState> {
  final Ref ref;
  final PlayerService audioPlayer;

  NowPlayingNotifier(super.state, this.ref, this.audioPlayer) {
    audioPlayer.justAudio.positionStream.listen((position) {
      state = state.copyWith(currentPosition: position);
    });

    // audioPlayer.justAudio.durationStream.listen((duration) {
    //   state = state.copyWith(songDuration: duration ?? Duration.zero);
    // });

    // audioPlayer.justAudio.bufferedPositionStream.listen((bufferedPosition) {
    //   state = state.copyWith(bufferedPosition: bufferedPosition);
    // });

    audioPlayer.justAudio.playerStateStream.listen((playerState) {
      state = state.copyWith(isPlaying: playerState.playing);
    });
  }

  void playSong(int index, List<SongModel> playList) async {
    state = state.copyWith(
        isPlaying: true,
        queue: playList,
        currentSong: playList[index],
        currentSongIndex: index);
    await audioPlayer.setPlaylist(playList, index);
    scrollToList(index);
  }

  void pause() {
    audioPlayer.pause();
    state = state.copyWith(isPlaying: false);
  }

  void resume() {
    audioPlayer.resume();
    state = state.copyWith(isPlaying: true);
  }

  void next() {
    audioPlayer.playNext();
    state = state.copyWith(isPlaying: true);
  }

  void previus() {
    audioPlayer.playPrevious();
    state = state.copyWith(isPlaying: true);
  }

  void stop() {
    audioPlayer.stop();
    state = state.copyWith(isPlaying: false, currentPosition: Duration.zero);
  }

  void scrollToList(int index) {
    ref.read(getCurrentInListProvider.notifier).state = index;
    print('set scrolling');
  }

  void seek(Duration duration) {
    audioPlayer.seekAudio(duration);
  }

  void setVolume() {
    final newVolume = (state.volume + 0.1).clamp(0.0, 1.0);
    audioPlayer.setVolume(newVolume);
    state = state.copyWith(volume: newVolume);
  }

  void downVolume() {
    final newVolume = (state.volume - 0.1).clamp(0.0, 1.0);
    audioPlayer.setVolume(newVolume);
    state = state.copyWith(volume: newVolume);
  }

  void updateState(SongModel song) {
    state = state.copyWith(currentSong: song);
  }

  void setProgress(Duration sec) {
    state = state.copyWith(currentPosition: sec);
  }

  void repeat(RepeatMode mode) {
    audioPlayer.setRepeatMode(mode);
    state = state.copyWith(repeatMode: mode);
  }

  void shuffle() {
    state = state.copyWith(isShuffle: !state.isShuffle);
    audioPlayer.toggleShuffle(!state.isShuffle);
  }

  
}

final nowPlayingProvider =
    StateNotifierProvider<NowPlayingNotifier, NowPlayingState>((ref) {
  final audioPlayer = ref.watch(audioPlayerService);
  final SongModel initialSong =
      SongModel({'_id': 0, 'title': 'Title', 'artist': 'Unknown', 'uri': ''});
  final NowPlayingState initialState = NowPlayingState(
    isPlaying: false,
    queue: const [],
    currentSong: initialSong,
    currentPosition: Duration.zero,
    songDuration: Duration.zero,
    volume: 1.0,
    isShuffle: false,
    repeatMode: RepeatMode.off,
    bufferedPosition: Duration.zero,
    currentSongIndex: 1,
  );
  return NowPlayingNotifier(initialState, ref, audioPlayer);
});
