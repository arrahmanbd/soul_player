// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soul_player/database/drift/data/database.dart';
import 'package:soul_player/layouts/linux/models/song_model.dart';

class PlayListState {
  bool isLoading;
  String selectedList;
  List<String>? playList;
  List<AudioSong>? songs;
  PlayListState({
    required this.isLoading,
    required this.selectedList,
    this.playList,
    this.songs,
  });

  PlayListState copyWith({
    bool? isLoading,
    String? selectedList,
    List<String>? playList,
    List<AudioSong>? songs,
  }) {
    return PlayListState(
      isLoading: isLoading ?? this.isLoading,
      selectedList: selectedList ?? this.selectedList,
      playList: playList ?? this.playList,
      songs: songs ?? this.songs,
    );
  }
}
