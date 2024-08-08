// import 'package:drift/drift.dart';
// import 'package:soul_player/database/drift/data/database.dart';

// class SongCompanion extends UpdateCompanion<Song> {
//   final Value<String> location;
//   final Value<String> title;
//   final Value<double> durationMs;
//   final Value<String> artist;
//   final Value<String> album;
//   final Value<String?> albumArtist;
//   final Value<int?> trackNumber;
//   final Value<int?> trackTotal;
//   final Value<int?> discNumber;
//   final Value<int?> discTotal;
//   final Value<int?> year;
//   final Value<String?> genre;
//   final Value<String?> picture;
//   final Value<int?> fileSize;
//   final Value<int> isPlaying;
//   final Value<String> folder;

//   const SongCompanion({
//     this.location = const Value.absent(),
//     this.title = const Value.absent(),
//     this.durationMs = const Value.absent(),
//     this.artist = const Value.absent(),
//     this.album = const Value.absent(),
//     this.albumArtist = const Value.absent(),
//     this.trackNumber = const Value.absent(),
//     this.trackTotal = const Value.absent(),
//     this.discNumber = const Value.absent(),
//     this.discTotal = const Value.absent(),
//     this.year = const Value.absent(),
//     this.genre = const Value.absent(),
//     this.picture = const Value.absent(),
//     this.fileSize = const Value.absent(),
//     this.isPlaying = const Value.absent(),
//     this.folder = const Value.absent(),
//   });

//   SongCompanion.insert({
//     required String location,
//     required String title,
//     required double durationMs,
//     required String artist,
//     required String album,
//     String? albumArtist,
//     int? trackNumber,
//     int? trackTotal,
//     int? discNumber,
//     int? discTotal,
//     int? year,
//     String? genre,
//     String? picture,
//     int? fileSize,
//     required int isPlaying,
//     required String folder,
//   })  : location = Value(location),
//         title = Value(title),
//         durationMs = Value(durationMs),
//         artist = Value(artist),
//         album = Value(album),
//         albumArtist = Value(albumArtist),
//         trackNumber = Value(trackNumber),
//         trackTotal = Value(trackTotal),
//         discNumber = Value(discNumber),
//         discTotal = Value(discTotal),
//         year = Value(year),
//         genre = Value(genre),
//         picture = Value(picture),
//         fileSize = Value(fileSize),
//         isPlaying = Value(isPlaying),
//         folder = Value(folder);

//   @override
//   Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
//     // TODO: implement toColumns
//     throw UnimplementedError();
//   }
// }
