import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/database/drift/data/database.dart';

class NowPlayingList extends StateNotifier<List<Song>> {
  NowPlayingList() : super([]);

  void setPlayList(List<Song> songList) {
    state = [...songList];
  }
}

final nowProvider = StateNotifierProvider<NowPlayingList, List<Song>>((ref) {
  return NowPlayingList();
});
