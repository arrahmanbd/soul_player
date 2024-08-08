import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:path/path.dart';
import 'package:soul_player/database/drift/data/database.dart';

import 'package:soul_player/database/drift/repository/database_repository.dart';
//import 'package:soul_player/database/drift/data/database.dart';
//import 'package:soul_player/database/drift/data/database.dart';

//import '../../../../database/drift/data/database.dart';
// ignore: unused_import
import '../../../../database/drift/entity/song_companion.dart';
import 'song_state.dart';

class SongScanner extends StateNotifier<SongScanState> {
  SongScanner(
    this.repo,
  ) : super(
          SongScanState(
            isloading: false,
            songs: [],
          ),
        ) {
    retriveCache();
  }
  final SongRepoIMP repo;

  Future<List<File>> pickSongs(String? dir) async {
    try {
      String? selectedDirectory;
      if (dir != null && dir.isNotEmpty) {
        selectedDirectory = dir;
      } else {
        //if argument not passed then open picker
        selectedDirectory = await FilePicker.platform.getDirectoryPath();
      }
      Directory downloadsDir = Directory(selectedDirectory.toString());
      var downloadsList =
          downloadsDir.list(recursive: true, followLinks: false);

      List<File> songs = [];
      await for (FileSystemEntity entity in downloadsList) {
        if (entity is File && entity.path.endsWith('.mp3')) {
          songs.add(entity);
        }
      }
      songs.sort((a, b) => a.path.compareTo(b.path));
      return songs;
    } catch (e) {
      if (kDebugMode) {
        print('Error scanning songs: $e');
      }
      return []; // or handle error appropriately
    }
  }

  ///check cashed song
  ///
  Future<void> retriveCache() async {
    List<Song> cachedSongs = await repo.getAllSongs();

    //removed sqflite common
    //await SongDatabaseHelper.instance.getAllSongs();
    if (cachedSongs.isNotEmpty) {
      state = state.copyWith(songs: cachedSongs, isloading: false);
      return;
    }
  }

  Future<void> refreshSongs() async {
    retriveCache();
  }

  Future<void> getAllSongs() async {
    try {
      state = state.copyWith(isloading: true);
      // Check database for cached songs
      retriveCache();
      // If no cached songs, scan and fetch new songs
      final List<Song> allSongs = [];
      final List<File> songs = await pickSongs('');

      for (File songFile in songs) {
        try {
          // Fetch metadata for each song
          final String location = songFile.path;
          Metadata fileMetadata =
              await MetadataGod.readMetadata(file: location);
          //print(filemetadata.title.toString());

          // Create a Song instance
          String parentFolder() {
            List<String> p = location.split('/');
            p.removeLast();
            String parentFolder = p.last;
            return parentFolder;
          }

          // Create a SongCompanion instance
          SongsCompanion songCompanion = SongsCompanion(
            id: const drift
                .Value.absent(), // Or drift.Value(null) if the id is nullable
            location: drift.Value(location),
            title: drift.Value(fileMetadata.title ?? basename(location)),
            durationMs: drift.Value(fileMetadata.durationMs ?? 0.0),
            artist: drift.Value(fileMetadata.artist ?? 'Unknown Artist'),
            album: drift.Value(fileMetadata.album ?? 'Unknown Album'),
            albumArtist: drift.Value(fileMetadata.albumArtist ?? ''),
            trackNumber: drift.Value(fileMetadata.trackNumber ?? 0),
            trackTotal: drift.Value(fileMetadata.trackTotal ?? 0),
            discNumber: drift.Value(fileMetadata.discNumber ?? 0),
            discTotal: drift.Value(fileMetadata.discTotal ?? 0),
            year: drift.Value(fileMetadata.year ?? 2024),
            genre: drift.Value(fileMetadata.genre ?? ''),
            picture: drift.Value(fileMetadata.picture?.toString() ?? ''),
            fileSize: drift.Value(fileMetadata.fileSize ?? 0),
            isPlaying: const drift.Value(0), // Assuming 0 means not playing
            folder: drift.Value(parentFolder()),
          );

          // Cache the song in the database

          await repo.insertSong(songCompanion);
        } catch (e) {
          // Handle individual file metadata errors
          print("Error reading metadata for ${songFile.path}: $e");
          // Skip the current file and continue with the next one
          continue;
        }
      }

      // Update the state with the list of all valid songs
      state = state.copyWith(songs: allSongs, isloading: false);
    } catch (e) {
      // Handle general errors
      print("Error getting all songs: $e");
      state = state.copyWith(isloading: false);
    }
  }
}

final scanProvider = StateNotifierProvider<SongScanner, SongScanState>((ref) {
  return SongScanner(ref.read(SongRepoProvider));
});
