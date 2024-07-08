import 'package:broken_soul/database/local_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtistNotifier extends StateNotifier<List<String>> {
  ArtistNotifier() : super([]) {
    getAllArtist();
  }

  Future<void> getAllArtist() async {
    try {
      // Check database for cached songs
      List<String> cachedSongs =
          await SongDatabaseHelper.instance.getAllArtists();
      print(cachedSongs);
      state = cachedSongs;
    } catch (e) {
      // Handle general errors
      print("Error getting all songs: $e");
    }
  }
}

final artistProvider =
    StateNotifierProvider<ArtistNotifier, List<String>>((ref) {
  return ArtistNotifier();
});
