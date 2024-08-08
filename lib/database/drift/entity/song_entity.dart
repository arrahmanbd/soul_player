import 'package:drift/drift.dart';

class Songs extends Table {
  // Auto-incrementing integer column as the primary key
  IntColumn get id => integer().autoIncrement()();
  
  // Text column for the location, cannot be null
  TextColumn get location => text().named('location').customConstraint('NOT NULL')();
  
  // Text column for the title, cannot be null
  TextColumn get title => text().named('title').customConstraint('NOT NULL')();
  
  // Real column for the duration in milliseconds
  RealColumn get durationMs => real().named('durationMs')();
  
  // Text column for the artist
  TextColumn get artist => text().named('artist')();
  
  // Text column for the album
  TextColumn get album => text().named('album')();
  
  // Text column for the album artist
  TextColumn get albumArtist => text().named('albumArtist')();
  
  // Integer column for the track number
  IntColumn get trackNumber => integer().named('trackNumber')();
  
  // Integer column for the total number of tracks
  IntColumn get trackTotal => integer().named('trackTotal')();
  
  // Integer column for the disc number
  IntColumn get discNumber => integer().named('discNumber')();
  
  // Integer column for the total number of discs
  IntColumn get discTotal => integer().named('discTotal')();
  
  // Integer column for the year
  IntColumn get year => integer().named('year')();
  
  // Text column for the genre
  TextColumn get genre => text().named('genre')();
  
  // Text column for the picture (e.g., album art)
  TextColumn get picture => text().named('picture')();
  
  // Integer column for the file size
  IntColumn get fileSize => integer().named('fileSize')();
  
  // Integer column to indicate if the song is playing
  IntColumn get isPlaying => integer().named('isPlaying')();
  
  // Text column for the folder, cannot be null
  TextColumn get folder => text().named('folder').customConstraint('NOT NULL')();
}
