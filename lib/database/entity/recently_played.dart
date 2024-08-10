import 'package:drift/drift.dart';

class LastPlayedSongs extends Table {
  // Auto-incrementing integer column as the primary key
  IntColumn get id => integer().autoIncrement()();

  // Integer column to reference the song ID
  IntColumn get songId => integer().customConstraint('REFERENCES songs(id)')();

  // DateTime column to store when the song was last played
  DateTimeColumn get playedAt => dateTime().named('playedAt')();
}
