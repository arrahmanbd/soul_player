// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:soul_player/platform/mobile/screens/library/providers/library_provider.dart';

class SearchState {
  final List<SongModel> songs;
  final List<SongModel> result;
  final bool isSearching;
  SearchState({
    this.songs = const [],
    this.result = const [],
    this.isSearching = false,
  });

  SearchState copyWith({
    List<SongModel>? songs,
    List<SongModel>? result,
    bool? isSearching,
  }) {
    return SearchState(
      songs: songs ?? this.songs,
      result: result ?? this.result,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier(super.state);

  void search(String keyword) {
    state = state.copyWith(isSearching: true);
    List<SongModel> result = state.songs
        .where(
            (song) => song.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    state = state.copyWith(result: result);
    state.copyWith(isSearching: false);
  }
}

final serachProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  final songs = ref.watch(libraryProvider);
  return SearchNotifier(SearchState(songs: songs.songs));
});
