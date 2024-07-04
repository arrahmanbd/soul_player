// song_scanner.dart

import 'dart:io';

import 'package:broken_soul/providers/song_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:broken_soul/models/song_model.dart';
import 'song_state.dart';

class SongScanner extends StateNotifier<SongScanState> {
  Future<List<File>>? getsongs;

  SongScanner(this.getsongs)
      : super(SongScanState(isloading: false, songs: [])) {
    getAllSongs();
  }

  Future<void> getAllSongs() async {
    try {
      state = state.copyWith(isloading: true);
      final List<SongModel> allSongs = [];

      // Fetch songs from getsongs (assuming it's a Future<List<File>>)
      final List<File>? songs = await getsongs;

      if (songs != null) {
        for (File songFile in songs) {
          // Fetch metadata for each song
          Metadata filemetadata =
              await MetadataGod.readMetadata(file: songFile.path);

          // Create SongModel and populate with metadata
          SongModel eachSong = SongModel(
            location: songFile.path,
            metadata: filemetadata,
          );

          allSongs.add(eachSong);
        }
      }

      // Update state with allSongs
      state = state.copyWith(isloading: false, songs: allSongs);
    } catch (e) {
      // Handle error appropriately (logging, reporting, etc.)
      print('Error fetching songs or metadata: $e');
      state = state.copyWith(
          isloading: false); // Ensure loading state is reset on error
    }
  }
}

final scanProvider = StateNotifierProvider<SongScanner, SongScanState>((ref) {
  // Use ref.watch to get the future value of getsongs
  final getsongsFuture = ref.watch(songsProvider.future);
  return SongScanner(getsongsFuture);
});
