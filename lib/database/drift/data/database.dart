import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:soul_player/database/drift/entity/recently_played.dart';
import '../entity/favourite_songs.dart';
import '../entity/song_entity.dart'; 

part 'database.g.dart'; // Required for code generation

// Function to lazily open the database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Get the application's documents directory
    final dbFolder = await getApplicationDocumentsDirectory();
    // Define the path for the SQLite database file
    final file = File(path.join(dbFolder.path, 'songs.sqlite'));
    // Return a connection to the database
    return NativeDatabase.createInBackground(file);
  });
}

// Drift database class
@DriftDatabase(tables: [Songs, FavoriteSongs, LastPlayedSongs])
class AppDatabase extends _$AppDatabase {
  // Constructor that opens the connection to the database
  AppDatabase() : super(_openConnection());

  // Set the schema version to 1 (you can increment this when you need to make schema changes)
  @override
  int get schemaVersion => 1;

  // Add your custom queries and methods here to interact with the database
}

//creating provider for database
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});