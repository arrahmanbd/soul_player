// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart' show IconData, ImageProvider;

import 'package:soul_player/database/drift/data/database.dart';

class MusicPlayerScreenState {
  final bool isPlaying;
  final Song currentSong;
  final Duration playbackPosition;
  final Duration duration;
  final bool isShuffling;
  final RepeatMode repeatMode;
  final ImageProvider albumArt;
  final IconData playButtonIcon;
  final double seekBarPosition;
  final double volume;
  final bool isMuted;
  final bool nextSongAvailable;
  final bool previousSongAvailable;
  final bool isFavorite;
  final List<String>? availableActions;
  final bool? isBuffering;
  final Duration? bufferedPosition;

  MusicPlayerScreenState({
    required this.isPlaying,
    required this.currentSong,
    required this.playbackPosition,
    required this.duration,
    required this.isShuffling,
    required this.repeatMode,
    required this.albumArt,
    required this.playButtonIcon,
    required this.seekBarPosition,
    required this.volume,
    required this.isMuted,
    required this.nextSongAvailable,
    required this.previousSongAvailable,
    required this.isFavorite,
    required this.availableActions,
    required this.isBuffering,
    required this.bufferedPosition,
  });

  MusicPlayerScreenState copyWith({
    bool? isPlaying,
    Song? currentSong,
    Duration? playbackPosition,
    Duration? duration,
    bool? isShuffling,
    RepeatMode? repeatMode,
    ImageProvider? albumArt,
    IconData? playButtonIcon,
    double? seekBarPosition,
    double? volume,
    bool? isMuted,
    bool? nextSongAvailable,
    bool? previousSongAvailable,
    bool? isFavorite,
    List<String>? availableActions,
    bool? isBuffering,
    Duration? bufferedPosition,
  }) {
    return MusicPlayerScreenState(
      isPlaying: isPlaying ?? this.isPlaying,
      currentSong: currentSong ?? this.currentSong,
      playbackPosition: playbackPosition ?? this.playbackPosition,
      duration: duration ?? this.duration,
      isShuffling: isShuffling ?? this.isShuffling,
      repeatMode: repeatMode ?? this.repeatMode,
      albumArt: albumArt ?? this.albumArt,
      playButtonIcon: playButtonIcon ?? this.playButtonIcon,
      seekBarPosition: seekBarPosition ?? this.seekBarPosition,
      volume: volume ?? this.volume,
      isMuted: isMuted ?? this.isMuted,
      nextSongAvailable: nextSongAvailable ?? this.nextSongAvailable,
      previousSongAvailable: previousSongAvailable ?? this.previousSongAvailable,
      isFavorite: isFavorite ?? this.isFavorite,
      availableActions: availableActions ?? this.availableActions,
      isBuffering: isBuffering ?? this.isBuffering,
      bufferedPosition: bufferedPosition ?? this.bufferedPosition,
    );
  }
}

enum RepeatMode {
  none,
  one,
  all,
}
