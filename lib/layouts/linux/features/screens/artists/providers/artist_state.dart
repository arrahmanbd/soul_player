// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soul_player/database/drift/data/database.dart';
import 'package:soul_player/layouts/linux/models/song_model.dart';

class ArtistState {
  bool isBrowsing;
  bool loading;
  String? totalItem;
  List<String> artist;
  String? selectedArtist;
  List<AudioSong> songs;
  ArtistState({
    required this.isBrowsing,
    required this.loading,
    this.totalItem,
    this.artist = const [],
    this.selectedArtist,
    this.songs = const [],
  });

  ArtistState copyWith({
    bool? isBrowsing,
    bool? loading,
    String? totalItem,
    List<String>? artist,
    String? selectedArtist,
    List<AudioSong>? songs,
  }) {
    return ArtistState(
      isBrowsing: isBrowsing ?? this.isBrowsing,
      loading: loading ?? this.loading,
      totalItem: totalItem ?? this.totalItem,
      artist: artist ?? this.artist,
      selectedArtist: selectedArtist ?? this.selectedArtist,
      songs: songs ?? this.songs,
    );
  }
}
