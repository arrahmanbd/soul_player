
import 'package:soul_player/database/repository/database_repository.dart';
import 'package:soul_player/platform/linux/features/folders/providers/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FolderNotifier extends StateNotifier<FolderBrowser> {
  DataBaseIMP db;
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
  final db = ref.read(databaseRepository);
  return FolderNotifier(db, browse);
});
