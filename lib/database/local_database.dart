import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:soul_player/layouts/linux/models/song_model.dart';
import 'package:soul_player/utils/device_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:soul_player/database/local_abstract.dart';
import 'package:soul_player/database/drift/data/database.dart';

import '../core/constants/database_constants.dart';

class SongDatabaseHelper implements SongLibrary {
  // Singleton instance
  static Database? _database;

  // Private constructor
  SongDatabaseHelper._privateConstructor();
  static final SongDatabaseHelper instance =
      SongDatabaseHelper._privateConstructor();

  // Getter for the database instance
  @override
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  //Initilazie for Android IOS Mac and Linux
  Future<Database> _initDatabase() async {
    bool desktop = GlobalUtils.desktop;
    Future<String> getPath() async {
      if (!desktop) {
        var dataBasePath = await getDatabasesPath();
        String path = join(dataBasePath, "music.db");
        return path;
      }
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, databaseName);
      return path;
    }

    String path = await getPath();
    // Platform check to use appropriate database factory
    dynamic databaseFactory;
    if (desktop) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    } else if (Platform.isAndroid || Platform.isIOS) {
      databaseFactory = databaseFactory;
    } else {
      throw UnsupportedError('Platform not supported');
    }

    // Check if the database exists

    bool databaseExists = await databaseFactory.databaseExists(path);
    if (!databaseExists) {
      //Report(message: 'No Dotabase! Creating New');
      return await databaseFactory.openDatabase(path,
          options: OpenDatabaseOptions(
              version: databaseVersion, onCreate: _onCreate));
    }

    // Else return old db
    //Report(message: 'Database Exists! Reading Database');
    return await databaseFactory.openDatabase(path);
  }

  // Create the songs and additional tables
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnLocation TEXT NOT NULL,
        $columnTitle TEXT NOT NULL,
        $columnDurationMs REAL,
        $columnArtist TEXT,
        $columnAlbum TEXT,
        $columnAlbumArtist TEXT,
        $columnTrackNumber INTEGER,
        $columnTrackTotal INTEGER,
        $columnDiscNumber INTEGER,
        $columnDiscTotal INTEGER,
        $columnYear INTEGER,
        $columnGenre TEXT,
        $columnPicture TEXT,
        $columnFileSize INTEGER,
        $columnIsPlaying INTEGER,
        $columnFolder TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $favoriteTable (
        $columnId INTEGER PRIMARY KEY,
        $columnLocation TEXT NOT NULL,
        $columnTitle TEXT NOT NULL,
        $columnDurationMs REAL,
        $columnArtist TEXT,
        $columnAlbum TEXT,
        $columnAlbumArtist TEXT,
        $columnTrackNumber INTEGER,
        $columnTrackTotal INTEGER,
        $columnDiscNumber INTEGER,
        $columnDiscTotal INTEGER,
        $columnYear INTEGER,
        $columnGenre TEXT,
        $columnPicture TEXT,
        $columnFileSize INTEGER,
        $columnIsPlaying INTEGER,
        $columnFolder TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $recentPlayedTable (
        $columnId INTEGER PRIMARY KEY,
        $columnLocation TEXT NOT NULL,
        $columnTitle TEXT NOT NULL,
        $columnDurationMs REAL,
        $columnArtist TEXT,
        $columnAlbum TEXT,
        $columnAlbumArtist TEXT,
        $columnTrackNumber INTEGER,
        $columnTrackTotal INTEGER,
        $columnDiscNumber INTEGER,
        $columnDiscTotal INTEGER,
        $columnYear INTEGER,
        $columnGenre TEXT,
        $columnPicture TEXT,
        $columnFileSize INTEGER,
        $columnIsPlaying INTEGER,
        $columnFolder TEXT NOT NULL,
        lastPlayed TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    await db.execute('''
      CREATE TABLE $playlistsTable (
        playlistId INTEGER PRIMARY KEY,
        playlistName TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $playlistSongsTable (
        playlistId INTEGER,
        songId INTEGER,
        FOREIGN KEY (playlistId) REFERENCES $playlistsTable (playlistId),
        FOREIGN KEY (songId) REFERENCES $table ($columnId)
      )
    ''');
  }

  // Insert a song into the database
  // @override
  // Future<int> insertSong(AudioSong song) async {
  //   Database db = await instance.database;
  //   //return await db.insert(table, AudioSong.toMap());
  //   return 0;
  // }

  // Get all songs from the database
  @override
  Future<List<AudioSong>> getAllSongs() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return AudioSong.fromMap(maps[i]);
    });
  }

  // Get songs by folder
  @override
  Future<List<AudioSong>> getSongsByFolder(String folderName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db
        .query(table, where: '$columnFolder = ?', whereArgs: [folderName]);
    return List.generate(maps.length, (i) {
      return AudioSong.fromMap(maps[i]);
    });
  }

  // Get songs by genre
  @override
  Future<List<AudioSong>> getSongsByGenre(String genreName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db
        .query(table, where: '$columnGenre = ?', whereArgs: [genreName]);
    return List.generate(maps.length, (i) {
      return AudioSong(
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
  @override
  Future<List<AudioSong>> getSongsByAlbum(String albumName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db
        .query(table, where: '$columnAlbum = ?', whereArgs: [albumName]);
    return List.generate(maps.length, (i) {
      return AudioSong(
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
  @override
  Future<List<AudioSong>> getSongsByArtist(String artistName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db
        .query(table, where: '$columnArtist = ?', whereArgs: [artistName]);
    return List.generate(maps.length, (i) {
      return AudioSong(
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

  // Get all distinct artists from the database
  @override
  Future<List<String>> getAllArtists() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT DISTINCT $columnArtist FROM $table;
    ''');
    return List.generate(maps.length, (i) {
      return maps[i][columnArtist] as String;
    });
  }

  // Get all distinct folders from the database
  @override
  Future<List<String>> getAllFolders() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT DISTINCT $columnFolder FROM $table;
    ''');
    return List.generate(maps.length, (i) {
      return maps[i][columnFolder] as String;
    });
  }

  // Get all distinct albums from the database
  @override
  Future<List<String>> getAllAlbums() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT DISTINCT $columnAlbum FROM $table;
    ''');
    return List.generate(maps.length, (i) {
      return maps[i][columnAlbum] as String;
    });
  }

  // Get all distinct genres from the database
  @override
  Future<List<String>> getAllGenres() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
SELECT DISTINCT $columnGenre FROM $table;
''');
    return List.generate(maps.length, (i) {
      return maps[i][columnGenre] as String;
    });
  }

// Add a song to the favorites
  // @override
  // Future<int> addSongToFavorites(Song song) async {
  //   // Database db = await instance.database;
  //   // return await db.insert(favoriteTable, AudioSong.toMap());
  // }

// Get all favorite songs
  @override
  Future<List<AudioSong>> getFavoriteSongs() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(favoriteTable);
    return List.generate(maps.length, (i) {
      return AudioSong.fromMap(maps[i]);
    });
  }

// Add a song to the recently played
  // @override
  // Future<int> addSongToRecentlyPlayed(AudioSong song) async {
  //   return 0;
  //   // Database db = await instance.database;
  //   // return await db.insert(recentPlayedTable, AudioSong.toMap());
  // }

// Get all recently played songs
  @override
  Future<List<AudioSong>> getRecentlyPlayedSongs() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps =
        await db.query(recentPlayedTable, orderBy: "lastPlayed DESC");
    return List.generate(maps.length, (i) {
      return AudioSong.fromMap(maps[i]);
    });
  }

// Create a new playlist
  @override
  Future<int> createPlaylist(String playlistName) async {
    Database db = await instance.database;
    return await db.insert(playlistsTable, {'playlistName': playlistName});
  }

// Add a song to a playlist
  @override
  Future<int> addSongToPlaylist(int playlistId, int songId) async {
    Database db = await instance.database;
    return await db.insert(
        playlistSongsTable, {'playlistId': playlistId, 'songId': songId});
  }

// Get all songs in a playlist
  @override
  Future<List<AudioSong>> getSongsInPlaylist(int playlistId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
SELECT * FROM $table WHERE $columnId IN (
SELECT songId FROM $playlistSongsTable WHERE playlistId = ?
)
''', [playlistId]);
    return List.generate(maps.length, (i) {
      return AudioSong.fromMap(maps[i]);
    });
  }

  @override
  Future<List<String>> getAllPlayList() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT DISTINCT "playlistName" FROM $playlistsTable;
    ''');
    return List.generate(maps.length, (i) {
      return maps[i]["playlistName"] as String;
    });
  }
}

///Get the database state using this provider
final databaseProvider = Provider<SongDatabaseHelper>((ref) {
  return SongDatabaseHelper.instance;
});
