import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:broken_soul/models/song_model.dart';

class SongDatabaseHelper {
  static const _databaseName = 'songs.db';
  static const _databaseVersion = 1;

  static const tableSongs = 'songs';
  static const columnId = '_id';
  static const columnLocation = 'location';
  static const columnTitle = 'title';
  static const columnArtist = 'artist';
  static const columnAlbum = 'album';
  static const columnGenre = 'genre';
  static const columnFileSize = 'fileSize';
  static const columnFolder = 'folder';
  static const columnIsPlaying = 'isPlaying';
  static const columnPicture = 'picture';

  // Singleton instance
  static Database? _database;

  // Private constructor
  SongDatabaseHelper._privateConstructor();
  static final SongDatabaseHelper instance =
      SongDatabaseHelper._privateConstructor();

  // Getter for the database instance
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    // Init ffi loader if needed.
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(
            version: _databaseVersion, onCreate: _onCreate));
  }

  // Create the songs table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableSongs (
        $columnId INTEGER PRIMARY KEY,
        $columnLocation TEXT NOT NULL,
        $columnTitle TEXT,
        $columnArtist TEXT,
        $columnAlbum TEXT,
        $columnGenre TEXT,
        $columnFileSize INTEGER,
        $columnFolder TEXT,
        $columnIsPlaying INTEGER,
        $columnPicture BLOB
      )
      ''');
  }

  // Insert a song into the database
  Future<int> insertSong(SongModel song) async {
    Database db = await instance.database;
    return await db.insert(tableSongs, song.toMap());
  }

  // Get all songs from the database
  Future<List<SongModel>> getAllSongs() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableSongs);
    return List.generate(maps.length, (i) {
      return SongModel.fromMap(maps[i]);
    });
  }

  // Get songs by folder
  Future<List<SongModel>> getSongsByFolder(String folderName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableSongs,
        where: '$columnFolder = ?',
        whereArgs: [folderName]);
    return List.generate(maps.length, (i) {
      return SongModel.fromMap(maps[i]);
    });
  }
   // Get songs by genre
  Future<List<SongModel>> getSongsByGenre(String genreName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableSongs,
        where: '$columnGenre = ?',
        whereArgs: [genreName]);
    return List.generate(maps.length, (i) {
      return SongModel(
        location: maps[i][columnLocation],
        title: maps[i][columnTitle],
        artist: maps[i][columnArtist],
        album: maps[i][columnAlbum],
        genre: maps[i][columnGenre],
        fileSize: maps[i][columnFileSize],
        folder: maps[i][columnFolder],
        isPlaying: maps[i][columnIsPlaying] == 1 ? true : false,
      );
    });
  }
   // Get songs by album
  Future<List<SongModel>> getSongsByAlbum(String albumName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableSongs,
        where: '$columnAlbum = ?',
        whereArgs: [albumName]);
    return List.generate(maps.length, (i) {
      return SongModel(
        location: maps[i][columnLocation],
        title: maps[i][columnTitle],
        artist: maps[i][columnArtist],
        album: maps[i][columnAlbum],
        genre: maps[i][columnGenre],
        fileSize: maps[i][columnFileSize],
        folder: maps[i][columnFolder],
        isPlaying: maps[i][columnIsPlaying] == 1 ? true : false,
      );
    });
  }
  // Get songs by artist
  Future<List<SongModel>> getSongsByArtist(String artistName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableSongs,
        where: '$columnArtist = ?',
        whereArgs: [artistName]);
    return List.generate(maps.length, (i) {
      return SongModel(
        location: maps[i][columnLocation],
        title: maps[i][columnTitle],
        artist: maps[i][columnArtist],
        album: maps[i][columnAlbum],
        genre: maps[i][columnGenre],
        fileSize: maps[i][columnFileSize],
        folder: maps[i][columnFolder],
        isPlaying: maps[i][columnIsPlaying] == 1 ? true : false,
      );
    });
  }


  //get artists
  // Get all distinct artists from the database
  Future<List<String>> getAllArtists() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT DISTINCT $columnArtist FROM $tableSongs;
    ''');
    return List.generate(maps.length, (i) {
      return maps[i][columnArtist] as String;
    });
  }
}
