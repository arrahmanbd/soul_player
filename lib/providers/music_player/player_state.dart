import 'package:equatable/equatable.dart';
import 'package:broken_soul/models/song_model.dart'; // Import your SongModel

enum PlayerMode { playing, paused, stop }

class PlayerState extends Equatable {
  final PlayerMode mode;
  final Duration duration;
  final Duration position;
  final SongModel currentSong; // Updated to SongModel
  final double volume;

  PlayerState({
    required this.mode,
    required this.currentSong, // Updated to SongModel
    this.duration = Duration.zero,
    this.position = Duration.zero,
    this.volume = 1.0,
  });

  PlayerState copyWith({
    PlayerMode? mode,
    Duration? duration,
    Duration? position,
    SongModel? currentSong, // Updated to SongModel
    double? volume,
  }) {
    return PlayerState(
      mode: mode ?? this.mode,
      currentSong: currentSong ?? this.currentSong,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      volume: volume ?? this.volume,
    );
  }

  @override
  List<Object?> get props => [mode, duration, position, currentSong, volume];
}
