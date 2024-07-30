import 'package:soul_player/layouts/linux/models/song_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class SongLibrary {
  Future<Database> get database;

  // Insert a song into the database
  Future<int> insertSong(AudioModel song);

  // Get all songs from the database
  Future<List<AudioModel>> getAllSongs();

  // Get songs by folder
  Future<List<AudioModel>> getSongsByFolder(String folderName);

  // Get songs by genre
  Future<List<AudioModel>> getSongsByGenre(String genreName);

  // Get songs by album
  Future<List<AudioModel>> getSongsByAlbum(String albumName);

  // Get songs by artist
  Future<List<AudioModel>> getSongsByArtist(String artistName);

  // Get all distinct artists from the database
  Future<List<String>> getAllArtists();
  // Get all distinct folders
  Future<List<String>> getAllFolders();
  // Get all distinct albums from the database
  Future<List<String>> getAllAlbums();
  // Get all distinct genres from the database
  Future<List<String>> getAllGenres();

  // Add a song to the favorites
  Future<int> addSongToFavorites(AudioModel song);

  // Get all favorite songs
  Future<List<AudioModel>> getFavoriteSongs();

  // Add a song to the recently played
  Future<int> addSongToRecentlyPlayed(AudioModel song);

  // Get all recently played songs
  Future<List<AudioModel>> getRecentlyPlayedSongs();

  // Create a new playlist
  Future<int> createPlaylist(String playlistName);

  // Add a song to a playlist
  Future<int> addSongToPlaylist(int playlistId, int songId);
  // Get all distinct playlists
  Future<List<String>> getAllPlayList();
  // Get all songs in a playlist
  Future<List<AudioModel>> getSongsInPlaylist(int playlistId);
}
