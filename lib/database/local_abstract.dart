import 'package:soul_player/database/drift/data/database.dart';
import 'package:soul_player/layouts/linux/models/song_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class SongLibrary {
  Future<Database> get database;

  // Insert a song into the database
  //Future<int> insertSong(Song song);

  // Get all songs from the database
  Future<List<AudioSong>> getAllSongs();

  // Get songs by folder
  Future<List<AudioSong>> getSongsByFolder(String folderName);

  // Get songs by genre
  Future<List<AudioSong>> getSongsByGenre(String genreName);

  // Get songs by album
  Future<List<AudioSong>> getSongsByAlbum(String albumName);

  // Get songs by artist
  Future<List<AudioSong>> getSongsByArtist(String artistName);

  // Get all distinct artists from the database
  Future<List<String>> getAllArtists();
  // Get all distinct folders
  Future<List<String>> getAllFolders();
  // Get all distinct albums from the database
  Future<List<String>> getAllAlbums();
  // Get all distinct genres from the database
  Future<List<String>> getAllGenres();

  // Add a song to the favorites
  //Future<int> addSongToFavorites(Song song);

  // Get all favorite songs
  Future<List<AudioSong>> getFavoriteSongs();

  // Add a song to the recently played
  //Future<int> addSongToRecentlyPlayed(Song song);

  // Get all recently played songs
  Future<List<AudioSong>> getRecentlyPlayedSongs();

  // Create a new playlist
  Future<int> createPlaylist(String playlistName);

  // Add a song to a playlist
  Future<int> addSongToPlaylist(int playlistId, int songId);
  // Get all distinct playlists
  Future<List<String>> getAllPlayList();
  // Get all songs in a playlist
  Future<List<AudioSong>> getSongsInPlaylist(int playlistId);
}
