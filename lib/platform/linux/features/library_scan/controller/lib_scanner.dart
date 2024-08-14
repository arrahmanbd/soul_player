// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:path/path.dart';

import 'package:soul_player/core/errors/error_ui.dart';
import 'package:soul_player/database/data/database.dart';
import 'package:soul_player/database/repository/database_repository.dart';
import 'package:soul_player/providers/context_provider.dart';
import 'package:soul_player/utils/base64_image.dart';

class LibraryScanning extends StateNotifier<List<Song>> {
  final DatabaseRepository repo;
  final ErrorHandler errorHandler;

  LibraryScanning(
    this.repo,
    this.errorHandler,
  ) : super([]) {
    _retrieveCachedSongs();
  }

  /// Picks songs from a given directory or via a directory picker.
  Future<List<File>> pickSongs({String? directoryPath}) async {
    try {
      String? selectedDirectory = directoryPath;
      if (selectedDirectory == null || selectedDirectory.isEmpty) {
        selectedDirectory = await FilePicker.platform.getDirectoryPath();
      }

      if (selectedDirectory == null) {
        return []; // User canceled the picker
      }

      final directory = Directory(selectedDirectory);
      final fileList = directory.list(recursive: true, followLinks: false);

      List<File> songs = [];
      await for (var entity in fileList) {
        if (entity is File && entity.path.endsWith('.mp3')) {
          songs.add(entity);
        }
      }

      songs.sort((a, b) => a.path.compareTo(b.path));
      return songs;
    } catch (e) {
      _logError('Error picking songs: $e');
      return [];
    }
  }

  /// Retrieves cached songs from the database.
  Future<void> _retrieveCachedSongs() async {
    try {
      List<Song> cachedSongs = await repo.getAllSongs();
      if (cachedSongs.isNotEmpty) {
        state = [...cachedSongs];
      }
    } catch (e) {
      _logError('Error retrieving cached songs: $e');
    }
  }

  /// Refreshes the song list by retrieving cached songs.
  Future<void> refreshSongs() async {
    await _retrieveCachedSongs();
  }

  /// Scans the directory for songs and caches them.
  Future<void> getAllSongs() async {
    try {
      // Retrieve cached songs first
      await _retrieveCachedSongs();

      // Scan for new songs if cache is empty
      final List<Song> allSongs = [];
      final List<File> songs = await pickSongs();

      for (var songFile in songs) {
        try {
          final songCompanion = await _createSongCompanion(songFile);
          if (songCompanion != null) {
            await repo.insertSong(songCompanion);
          }
        } catch (e) {
          _logError('Error processing song ${songFile.path}: $e');
          continue;
        }
      }

      // Optionally update state with all songs
      state = [...state, ...allSongs];
    } catch (e) {
      _logError('Error getting all songs: $e');
    }
  }

  /// Creates a [SongsCompanion] instance from a song file.
  Future<SongsCompanion?> _createSongCompanion(File songFile) async {
    try {
      final String location = songFile.path;
      final Metadata fileMetadata =
          await MetadataGod.readMetadata(file: location);
      // Generate default image data if necessary
      Uint8List defaultImageData = await createHerNameImage();
      return SongsCompanion(
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
        year: drift.Value(fileMetadata.year ?? DateTime.now().year),
        genre: drift.Value(fileMetadata.genre ?? ''),
        picture: drift.Value(fileMetadata.picture?.data ?? defaultImageData),
        // Use default image data if picture is null
        fileSize: drift.Value(fileMetadata.fileSize ?? 0),
        isPlaying: const drift.Value(0),
        isFavorite: const drift.Value(0),
        folder: drift.Value(_getParentFolder(location)),
      );
    } catch (e) {
      _logError('Error creating song companion for ${songFile.path}: $e');
      return null;
    }
  }

  /// Extracts the parent folder name from a file path.
  String _getParentFolder(String filePath) {
    final parts = filePath.split('/');
    if (parts.isNotEmpty) {
      parts.removeLast();
      return parts.last;
    }
    return 'Unknown Folder';
  }

  /// Logs errors for debugging.
  void _logError(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}

final libraryScanerProvider =
    StateNotifierProvider<LibraryScanning, List<Song>>((ref) {
  final context = ref.watch(buildContextProvider);
  return LibraryScanning(ref.read(databaseRepository), ErrorHandler(context));
});
