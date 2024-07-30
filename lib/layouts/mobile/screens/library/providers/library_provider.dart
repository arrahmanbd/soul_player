import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:soul_player/layouts/mobile/screens/library/providers/library_state.dart';

import 'folder_model.dart';

class LibraryNotifier extends StateNotifier<LibraryState> {
  final OnAudioQuery audioQuery;
  LibraryNotifier(super.state, {required this.audioQuery});

  // Get all media files (songs)
  Future<void> getAllSongs() async {
    try {
      state = state.copyWith(isLoading: true);
      List<SongModel> songs = await audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      state = state.copyWith(isLoading: false, songs: songs);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMsg: e.toString());
    }
  }

  // Get all albums
  Future<void> getAllAlbums() async {
    try {
      state = state.copyWith(isLoading: true);
      List<AlbumModel> albums = await audioQuery.queryAlbums(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      state = state.copyWith(isLoading: false, albums: albums);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMsg: e.toString());
    }
  }

  // Get all artists
  Future<void> getAllArtists() async {
    try {
      state = state.copyWith(isLoading: true);
      List<ArtistModel> artists = await audioQuery.queryArtists(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      state = state.copyWith(isLoading: false, artists: artists);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMsg: e.toString());
    }
  }

  // Get all genres
  Future<void> getAllGenres() async {
    try {
      state = state.copyWith(isLoading: true);
      List<GenreModel> genres = await audioQuery.queryGenres(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      state = state.copyWith(isLoading: false, genre: genres);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMsg: e.toString());
    }
  }

  // Get all playlists
  Future<void> getAllPlaylists() async {
    try {
      state = state.copyWith(isLoading: true);
      List<PlaylistModel> playlists = await audioQuery.queryPlaylists(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      state = state.copyWith(isLoading: false, playlist: playlists);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMsg: e.toString());
    }
  }

  Future<void> getAllFolders() async {
    try {
      state = state.copyWith(isLoading: true);

      // Query all songs
      List<SongModel> songs = await audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );

      // Map to store folder paths and song counts
      Map<String, int> folderSongCount = {};

      // Count songs per folder
      for (SongModel song in songs) {
        String folderPath = song.uri!.replaceAll(song.title!, '') ?? '';
        folderSongCount[folderPath] = (folderSongCount[folderPath] ?? 0) + 1;
      }

      // Convert map to list of FolderModel
      List<FolderModel> folders = folderSongCount.entries.map((entry) {
        return FolderModel(folder :' ' , folderPath: entry.key, numberOfSongs: entry.value, isScanning: false);
      }).toList();

      // Update state with folders data
      state = state.copyWith(isLoading: false, folders: folders);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMsg: e.toString());
    }
  }

  // Scan all media
  Future<void> scanAll() async {
    state = state.copyWith(isLoading: true, errorMsg: 'Getting songs');
    await getAllSongs();
    state = state.copyWith(errorMsg: 'Getting folders');
    getAllFolders();
    state = state.copyWith(errorMsg: 'Getting albums');
    await getAllAlbums();
    state = state.copyWith(errorMsg: 'Getting artists');
    await getAllArtists();
    state = state.copyWith(errorMsg: 'Getting genres');
    await getAllGenres();
    state = state.copyWith(errorMsg: 'Getting playlists');
    await getAllPlaylists();
    state = state.copyWith(isLoading: false, errorMsg: 'Scan complete');
    
  }
}

final libraryProvider =
    StateNotifierProvider<LibraryNotifier, LibraryState>((ref) {
  final audioQuery = ref.watch(queryLibrary);
  return LibraryNotifier(const LibraryState(), audioQuery: audioQuery);
});

/// Dependency
/// Global Dependency Injection
final queryLibrary = Provider<OnAudioQuery>((ref) {
  return OnAudioQuery();
});
