import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/core/errors/failur.dart';
import '../data/database.dart';
import 'repo_abstract.dart'; // Import the generated database

class SongRepoIMP implements SongRepository {
  final AppDatabase _db;

  SongRepoIMP(this._db);

  // Get all songs
  @override
  Future<List<Song>> getAllSongs() {
    return _db.select(_db.songs).get();
  }

  // Get a song by ID
  @override
  Future<Song?> getSongById(int id) {
    return (_db.select(_db.songs)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  // Insert a new song
  @override
  Future<int> insertSong(SongsCompanion song) {
    return _db.into(_db.songs).insert(song);
  }

  // Update a song
  @override
  Future<bool> updateSong(Song song) {
    return _db.update(_db.songs).replace(song);
  }

  // Delete a song
  @override
  Future<int> deleteSong(int id) {
    return (_db.delete(_db.songs)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Search songs by name, artist, or album
  @override
  Future<List<Song>> searchSongs(String query) {
    return (_db.select(_db.songs)
          ..where((song) =>
              song.title.contains(query) |
              song.artist.contains(query) |
              song.album.contains(query)))
        .get();
  }

  // Mark a song as favorite
  @override
  Future<Result<int>> markAsFavorite(int songId) async {
    try {
      final isAlreadyFavorite = await isFavorite(songId);

      if (isAlreadyFavorite) {
        return Result.failure("Song is already in the favorites list.");
      }

      final favorite = FavoriteSongsCompanion(
        songId: Value(songId),
        markedAsFavoriteAt: Value(DateTime.now()),
      );
      final id = await _db.into(_db.favoriteSongs).insert(favorite);
      return Result.success(id);
    } catch (e) {
      return Result.failure("Failed to mark song as favorite.",
          exception: e is Exception ? e : null);
    }
  }

  // Get all favorite songs
  @override
  Future<List<Song>> getFavoriteSongs() {
    return (_db.select(_db.songs)
          ..where((song) => song.id.isInQuery(_db.selectOnly(_db.favoriteSongs)
            ..addColumns([_db.favoriteSongs.songId]))))
        .get();
  }

  // Check if a song is favorite
  @override
  Future<bool> isFavorite(int songId) async {
    final count = await (_db.select(_db.favoriteSongs)
          ..where((tbl) => tbl.songId.equals(songId)))
        .get()
        .then((value) => value.length);
    return count > 0;
  }

  // Remove a song from favorites
  @override
  Future<int> removeFromFavorites(int songId) {
    return (_db.delete(_db.favoriteSongs)
          ..where((tbl) => tbl.songId.equals(songId)))
        .go();
  }

  // Record a song as last played
  @override
  Future<int> recordLastPlayed(int songId) {
    final lastPlayed = LastPlayedSongsCompanion(
      songId: Value(songId),
      playedAt: Value(DateTime.now()),
    );
    return _db.into(_db.lastPlayedSongs).insert(lastPlayed);
  }

  // Get the last played song
  @override
  Future<Song?> getLastPlayedSong() async {
    final lastPlayedSongId = await (_db.select(_db.lastPlayedSongs)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.playedAt)])
          ..limit(1))
        .getSingleOrNull();

    if (lastPlayedSongId != null) {
      return getSongById(lastPlayedSongId.songId);
    }
    return null;
  }

  // Get all last played songs
  @override
  Future<List<Song>> getAllLastPlayedSongs() {
    return (_db.select(_db.songs)
          ..where((song) => song.id.isInQuery(
              _db.selectOnly(_db.lastPlayedSongs)
                ..addColumns([_db.lastPlayedSongs.songId]))))
        .get();
  }

  // Clear all records from FavoriteSongs
  @override
  Future<int> clearFavoriteSongs() {
    return _db.delete(_db.favoriteSongs).go();
  }

  // Clear all records from LastPlayedSongs
  @override
  Future<int> clearLastPlayedSongs() {
    return _db.delete(_db.lastPlayedSongs).go();
  }

  // Clear all songs from the Songs table
  @override
  Future<int> clearAllSongs() {
    return _db.delete(_db.songs).go();
  }
}

//creating provider
final SongRepoProvider = Provider<SongRepoIMP>((ref) {
  final db = ref.read(databaseProvider);
  return SongRepoIMP(db);
});
