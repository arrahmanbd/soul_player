// player_notifier.dart

import 'dart:io';

import 'package:broken_soul/providers/song_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:broken_soul/providers/music_player/player_state.dart';
import 'package:broken_soul/services/audio_service.dart';

class PlayerNotifier extends StateNotifier<PlayerState> {
  final AudioService audioPlayer;

  PlayerNotifier(this.audioPlayer) : super(PlayerState(mode: PlayerMode.stop));

  void play(String songPath) {
    state = PlayerState(mode: PlayerMode.playing);
    audioPlayer.play(songPath);
  }

  void pause() {
    state = PlayerState(mode: PlayerMode.ause);
    audioPlayer.pause();
  }

  void stop() {
    state = PlayerState(mode: PlayerMode.stop);
    audioPlayer.stop();
  }
}

final playerProvider = StateNotifierProvider<PlayerNotifier, PlayerState>((ref) {
  final audioPlayer = ref.read(audioPlayerProvider);
  final playerNotifier = PlayerNotifier(AudioService(audioPlayer));
  return playerNotifier;
});
