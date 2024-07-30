// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../services/justAudioProvider.dart';

class NowPlayingState extends Equatable {
  final bool isPlaying;
  final List<SongModel> queue;
  final SongModel currentSong;
  final Duration currentPosition;
  final Duration songDuration;
  final double volume;
  final bool isShuffle;
  final RepeatMode repeatMode;
  final Duration bufferedPosition;
  final int currentSongIndex;

  const NowPlayingState({
    required this.isPlaying,
    required this.queue,
    required this.currentSong,
    required this.currentPosition,
    required this.songDuration,
    required this.volume,
    required this.isShuffle,
    required this.repeatMode,
    required this.bufferedPosition,
    required this.currentSongIndex,
  });
  



  NowPlayingState copyWith({
    bool? isPlaying,
    List<SongModel>? queue,
    SongModel? currentSong,
    Duration? currentPosition,
    Duration? songDuration,
    double? volume,
    bool? isShuffle,
    RepeatMode? repeatMode,
    Duration? bufferedPosition,
    int? currentSongIndex,
  }) {
    return NowPlayingState(
      isPlaying: isPlaying ?? this.isPlaying,
      queue: queue ?? this.queue,
      currentSong: currentSong ?? this.currentSong,
      currentPosition: currentPosition ?? this.currentPosition,
      songDuration: songDuration ?? this.songDuration,
      volume: volume ?? this.volume,
      isShuffle: isShuffle ?? this.isShuffle,
      repeatMode: repeatMode ?? this.repeatMode,
      bufferedPosition: bufferedPosition ?? this.bufferedPosition,
      currentSongIndex: currentSongIndex ?? this.currentSongIndex,
    );
  }

  @override
  List<Object> get props {
    return [
      isPlaying,
      queue,
      currentSong,
      currentPosition,
      songDuration,
      volume,
      isShuffle,
      repeatMode,
      bufferedPosition,
      currentSongIndex,
    ];
  }
}
