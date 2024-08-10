// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LibraryNotifier extends StateNotifier<List<SongModel>> {
  final OnAudioQuery _audioQuery;
  LibraryNotifier(
    this._audioQuery,
  ) : super([]) {
    getAllSongs();
  }

  Future<void> getAllSongs() async {
    List<SongModel> songs = await _audioQuery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    state = [...songs];
  }
}

final libProvider =
    StateNotifierProvider<LibraryNotifier, List<SongModel>>((ref) {
  final _audioQuery = ref.read(packageProvider);
  return LibraryNotifier(_audioQuery);
});

///Global Dependecy Injection
final packageProvider = Provider<OnAudioQuery>((ref) {
  return OnAudioQuery();
});

final artProvider = FutureProvider.family<Uint8List?, int>((ref, id) async {
  final query = ref.read(packageProvider);
  return await query.queryArtwork(
    id,
    ArtworkType.AUDIO,  // Replace with your actual type
    format: ArtworkFormat.JPEG,  // Replace with your actual format
    size: 200,  // Replace with your actual size
    quality: 100,  // Replace with your actual quality
  );
});