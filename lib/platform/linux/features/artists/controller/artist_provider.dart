import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/database/repository/database_repository.dart';

import 'artist_state.dart';

class ArtistsNotifier extends StateNotifier<ArtistState> {
  final DataBaseIMP repo;
  ArtistsNotifier(this.repo, super.state) {
    getAllArtist();
  }

  void getAllArtist() async {
    state = state.copyWith(loading: true, mode: ViewMode.artist);
    final artists = await repo.getAllArtists();
    state = state.copyWith(artist: artists, loading: false);
  }

  void getSongByArtists(String artistName) async {
    state = state.copyWith(loading: true, mode: ViewMode.songs);
    final songs = await repo.getSongsByArtist(artistName);
    //print(songs);
    state = state.copyWith(
        selectedArtist: artistName, songs: songs, loading: false);
  }
}

final artistProvider =
    StateNotifierProvider<ArtistsNotifier, ArtistState>((ref) {
  final browse = ArtistState(loading: false);
  final db = ref.read(databaseRepository);
  return ArtistsNotifier(db, browse);
});
