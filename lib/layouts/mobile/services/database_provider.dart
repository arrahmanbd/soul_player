

import 'package:on_audio_query/on_audio_query.dart';

abstract class LibraryRoom {
  // Insert a song into the database

  // Get all songs from the database
  Future<List<SongModel>> getAllSongs();
}


