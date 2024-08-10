// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soul_player/database/data/database.dart';

enum ViewMode { artist, songs }

class ArtistState {
  ViewMode mode;
  bool loading;
  String? totalItem;
  List<String> artist;
  String? selectedArtist;
  List<Song> songs;
  ArtistState({
    this.mode = ViewMode.artist,
    required this.loading,
    this.totalItem,
    this.artist = const [],
    this.selectedArtist,
    this.songs = const [],
  });

 

  ArtistState copyWith({
    ViewMode? mode,
    bool? loading,
    String? totalItem,
    List<String>? artist,
    String? selectedArtist,
    List<Song>? songs,
  }) {
    return ArtistState(
      mode: mode ?? this.mode,
      loading: loading ?? this.loading,
      totalItem: totalItem ?? this.totalItem,
      artist: artist ?? this.artist,
      selectedArtist: selectedArtist ?? this.selectedArtist,
      songs: songs ?? this.songs,
    );
  }
}
