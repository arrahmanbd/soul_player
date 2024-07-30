// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soul_player/layouts/linux/features/screens/folders/providers/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:soul_player/database/local_database.dart';

class FolderNotifier extends StateNotifier<FolderBrowser> {
  SongDatabaseHelper db;
  FolderBrowser initial;
  FolderNotifier(
    this.db,
    this.initial,
  ) : super(initial) {
    getAllFolders();
  }

  Future<void> getAllFolders() async {
    state = state.copyWith(isBrowsing: false, loading: true);
    final folders = await db.getAllFolders();
    print(folders);
    state = state.copyWith(directory: folders, loading: false);
  }

  Future<void> getSongByFolders(String dirName) async {
    state = state.copyWith(loading: true, isBrowsing: true);
    final songs = await db.getSongsByFolder(dirName);
    print(songs);

    state = state.copyWith(folder: dirName, songs: songs, loading: false);
  }

  void setBrowsing(bool val) {
    state = state.copyWith(isBrowsing: val);
  }
}

final folderProvider =
    StateNotifierProvider<FolderNotifier, FolderBrowser>((ref) {
  final browse = FolderBrowser(isBrowsing: false, loading: false);
  final db = ref.read(databaseProvider);
  return FolderNotifier(db, browse);
});
