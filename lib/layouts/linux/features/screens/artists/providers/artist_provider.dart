import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:soul_player/database/local_database.dart';

import 'artist_state.dart';

class ArtistNotifier extends StateNotifier<ArtistState> {
  SongDatabaseHelper db;
  ArtistState initial;
  ArtistNotifier(
    this.db,
    this.initial,
  ) : super(initial) {
    getAllArtists();
  }

  Future<void> getAllArtists() async {
    state = state.copyWith(isBrowsing: false, loading: true);
    final artists = await db.getAllArtists();
    print(artists);
    state = state.copyWith(artist: artists, loading: false);
  }

  Future<void> getSongByArtists(String artistName) async {
    state = state.copyWith(loading: true, isBrowsing: true);
    final songs = await db.getSongsByArtist(artistName);
    print(songs);
    state = state.copyWith(
        selectedArtist: artistName, songs: songs, loading: false);
  }

  void setBrowsing(bool val) {
    state = state.copyWith(isBrowsing: val);
  }
}

final artistProvider =
    StateNotifierProvider<ArtistNotifier, ArtistState>((ref) {
  final browse = ArtistState(isBrowsing: false, loading: false);
  final db = ref.read(databaseProvider);
  return ArtistNotifier(db, browse);
});
