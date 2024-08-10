import 'package:drift/drift.dart';

class FavoriteSongs extends Table {
  // Auto-incrementing integer column as the primary key
  IntColumn get id => integer().autoIncrement()();

  // Integer column to reference the song ID
  IntColumn get songId => integer().customConstraint('REFERENCES songs(id)')();

  // DateTime column to store when the song was marked as favorite
  DateTimeColumn get markedAsFavoriteAt => dateTime().named('markedAsFavoriteAt')();
}
