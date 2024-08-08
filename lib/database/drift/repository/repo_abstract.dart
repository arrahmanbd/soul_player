import 'package:drift/drift.dart';
import 'package:soul_player/core/errors/failur.dart';
import '../data/database.dart';  // Import the generated database

abstract class SongRepository {
  // Get all songs
  Future<List<Song>> getAllSongs();

  // Get a song by ID
  Future<Song?> getSongById(int id);

  // Insert a new song
  Future<int> insertSong(SongsCompanion song);

  // Update a song
  Future<bool> updateSong(Song song);

  // Delete a song
  Future<int> deleteSong(int id);

  // Search songs by name, artist, or album
  Future<List<Song>> searchSongs(String query);

  // Mark a song as favorite
  Future<Result<int>> markAsFavorite(int songId);

  // Get all favorite songs
  Future<List<Song>> getFavoriteSongs();

  // Check if a song is favorite
  Future<bool> isFavorite(int songId);

  // Remove a song from favorites
  Future<int> removeFromFavorites(int songId);

  // Record a song as last played
  Future<int> recordLastPlayed(int songId);

  // Get the last played song
  Future<Song?> getLastPlayedSong();

  // Get all last played songs
  Future<List<Song>> getAllLastPlayedSongs();

  // Clear all records from FavoriteSongs
  Future<int> clearFavoriteSongs();

  // Clear all records from LastPlayedSongs
  Future<int> clearLastPlayedSongs();

  // Clear all songs from the Songs table
  Future<int> clearAllSongs();
}
