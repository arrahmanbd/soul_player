// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:soul_player/database/data/database.dart'; // Import your SongModel

enum RepeatMode { one, all, stop }

class PlayerState extends Equatable {
  final bool isPlaying;
  final Song currentSong;
  final bool isShuffling;
  final Duration seekBarPosition;
  final double volume;
  final bool isMuted;
  final bool isFavorite;
  final RepeatMode mode;
  final Duration duration;

  const PlayerState({
    this.isPlaying=false,
    required this.currentSong,
    this.isShuffling=false,
    this.seekBarPosition=Duration.zero,
    this.volume = 1.0,
    this.isMuted=false,
    this.isFavorite=false,
    this.mode=RepeatMode.one,
    this.duration = Duration.zero,
  });

 

  @override
  List<Object> get props {
    return [
      isPlaying,
      currentSong,
      isShuffling,
      seekBarPosition,
      volume,
      isMuted,
      isFavorite,
      mode,
      duration,
    ];
  }

  PlayerState copyWith({
    bool? isPlaying,
    Song? currentSong,
    bool? isShuffling,
    Duration? seekBarPosition,
    double? volume,
    bool? isMuted,
    bool? isFavorite,
    RepeatMode? mode,
    Duration? duration,
  }) {
    return PlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      currentSong: currentSong ?? this.currentSong,
      isShuffling: isShuffling ?? this.isShuffling,
      seekBarPosition: seekBarPosition ?? this.seekBarPosition,
      volume: volume ?? this.volume,
      isMuted: isMuted ?? this.isMuted,
      isFavorite: isFavorite ?? this.isFavorite,
      mode: mode ?? this.mode,
      duration: duration ?? this.duration,
    );
  }
}
