// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:soul_player/database/local_database.dart';
import 'package:soul_player/layouts/linux/features/screens/playlists/providers/playlist_state.dart';

class PlaylistNotifier extends StateNotifier<PlayListState> {
  SongDatabaseHelper db;
  PlaylistNotifier(this.db, super._state) {
    getPlayList();
  }
  //getting all playlist
  Future<void> getPlayList() async {
    state = state.copyWith(isLoading: true);
    final result = await db.getAllPlayList();
    state = state.copyWith(isLoading: false, playList: result);
  }

  //getting all  song of a playlist
  Future<void> getSongsOfList(int id) async {
    state = state.copyWith(isLoading: true);
    final result = await db.getSongsInPlaylist(id);
    state = state.copyWith(isLoading: false, songs: result);
  }

  //create a playlist
  Future<void> createPlayList(String name) async {
    state = state.copyWith(isLoading: true);
    await db.createPlaylist(name);
    //now refresh list
    getPlayList();
  }
}

final playlistProvider =
    StateNotifierProvider<PlaylistNotifier, PlayListState>((ref) {
  final state = PlayListState(isLoading: false, selectedList: '');
  final db = ref.read(databaseProvider);
  return PlaylistNotifier(db, state);
});
