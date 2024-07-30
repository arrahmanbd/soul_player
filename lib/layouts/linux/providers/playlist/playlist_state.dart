import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/linux/models/song_model.dart';

class NowPlayingList extends StateNotifier<List<AudioModel>> {
  NowPlayingList() : super([]);

  void setPlayList(List<AudioModel> songList) {
    state = [...songList];
  }
}

final nowProvider =
    StateNotifierProvider<NowPlayingList, List<AudioModel>>((ref) {
  return NowPlayingList();
});
