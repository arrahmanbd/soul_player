// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SongsTable extends Songs with TableInfo<$SongsTable, Song> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _durationMsMeta =
      const VerificationMeta('durationMs');
  @override
  late final GeneratedColumn<double> durationMs = GeneratedColumn<double>(
      'durationMs', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _albumMeta = const VerificationMeta('album');
  @override
  late final GeneratedColumn<String> album = GeneratedColumn<String>(
      'album', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _albumArtistMeta =
      const VerificationMeta('albumArtist');
  @override
  late final GeneratedColumn<String> albumArtist = GeneratedColumn<String>(
      'albumArtist', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _trackNumberMeta =
      const VerificationMeta('trackNumber');
  @override
  late final GeneratedColumn<int> trackNumber = GeneratedColumn<int>(
      'trackNumber', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _trackTotalMeta =
      const VerificationMeta('trackTotal');
  @override
  late final GeneratedColumn<int> trackTotal = GeneratedColumn<int>(
      'trackTotal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _discNumberMeta =
      const VerificationMeta('discNumber');
  @override
  late final GeneratedColumn<int> discNumber = GeneratedColumn<int>(
      'discNumber', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _discTotalMeta =
      const VerificationMeta('discTotal');
  @override
  late final GeneratedColumn<int> discTotal = GeneratedColumn<int>(
      'discTotal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String> genre = GeneratedColumn<String>(
      'genre', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pictureMeta =
      const VerificationMeta('picture');
  @override
  late final GeneratedColumn<Uint8List> picture = GeneratedColumn<Uint8List>(
      'picture', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _fileSizeMeta =
      const VerificationMeta('fileSize');
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
      'fileSize', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isPlayingMeta =
      const VerificationMeta('isPlaying');
  @override
  late final GeneratedColumn<int> isPlaying = GeneratedColumn<int>(
      'isPlaying', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<int> isFavorite = GeneratedColumn<int>(
      'isFavorite', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _folderMeta = const VerificationMeta('folder');
  @override
  late final GeneratedColumn<String> folder = GeneratedColumn<String>(
      'folder', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        location,
        title,
        durationMs,
        artist,
        album,
        albumArtist,
        trackNumber,
        trackTotal,
        discNumber,
        discTotal,
        year,
        genre,
        picture,
        fileSize,
        isPlaying,
        isFavorite,
        folder
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'songs';
  @override
  VerificationContext validateIntegrity(Insertable<Song> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('durationMs')) {
      context.handle(
          _durationMsMeta,
          durationMs.isAcceptableOrUnknown(
              data['durationMs']!, _durationMsMeta));
    } else if (isInserting) {
      context.missing(_durationMsMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('album')) {
      context.handle(
          _albumMeta, album.isAcceptableOrUnknown(data['album']!, _albumMeta));
    } else if (isInserting) {
      context.missing(_albumMeta);
    }
    if (data.containsKey('albumArtist')) {
      context.handle(
          _albumArtistMeta,
          albumArtist.isAcceptableOrUnknown(
              data['albumArtist']!, _albumArtistMeta));
    } else if (isInserting) {
      context.missing(_albumArtistMeta);
    }
    if (data.containsKey('trackNumber')) {
      context.handle(
          _trackNumberMeta,
          trackNumber.isAcceptableOrUnknown(
              data['trackNumber']!, _trackNumberMeta));
    } else if (isInserting) {
      context.missing(_trackNumberMeta);
    }
    if (data.containsKey('trackTotal')) {
      context.handle(
          _trackTotalMeta,
          trackTotal.isAcceptableOrUnknown(
              data['trackTotal']!, _trackTotalMeta));
    } else if (isInserting) {
      context.missing(_trackTotalMeta);
    }
    if (data.containsKey('discNumber')) {
      context.handle(
          _discNumberMeta,
          discNumber.isAcceptableOrUnknown(
              data['discNumber']!, _discNumberMeta));
    } else if (isInserting) {
      context.missing(_discNumberMeta);
    }
    if (data.containsKey('discTotal')) {
      context.handle(_discTotalMeta,
          discTotal.isAcceptableOrUnknown(data['discTotal']!, _discTotalMeta));
    } else if (isInserting) {
      context.missing(_discTotalMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    } else if (isInserting) {
      context.missing(_genreMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    } else if (isInserting) {
      context.missing(_pictureMeta);
    }
    if (data.containsKey('fileSize')) {
      context.handle(_fileSizeMeta,
          fileSize.isAcceptableOrUnknown(data['fileSize']!, _fileSizeMeta));
    } else if (isInserting) {
      context.missing(_fileSizeMeta);
    }
    if (data.containsKey('isPlaying')) {
      context.handle(_isPlayingMeta,
          isPlaying.isAcceptableOrUnknown(data['isPlaying']!, _isPlayingMeta));
    } else if (isInserting) {
      context.missing(_isPlayingMeta);
    }
    if (data.containsKey('isFavorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['isFavorite']!, _isFavoriteMeta));
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    if (data.containsKey('folder')) {
      context.handle(_folderMeta,
          folder.isAcceptableOrUnknown(data['folder']!, _folderMeta));
    } else if (isInserting) {
      context.missing(_folderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Song map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Song(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      durationMs: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}durationMs'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist'])!,
      album: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}album'])!,
      albumArtist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}albumArtist'])!,
      trackNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trackNumber'])!,
      trackTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trackTotal'])!,
      discNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}discNumber'])!,
      discTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}discTotal'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
      genre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre'])!,
      picture: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}picture'])!,
      fileSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fileSize'])!,
      isPlaying: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}isPlaying'])!,
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}isFavorite'])!,
      folder: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}folder'])!,
    );
  }

  @override
  $SongsTable createAlias(String alias) {
    return $SongsTable(attachedDatabase, alias);
  }
}

class Song extends DataClass implements Insertable<Song> {
  final int id;
  final String location;
  final String title;
  final double durationMs;
  final String artist;
  final String album;
  final String albumArtist;
  final int trackNumber;
  final int trackTotal;
  final int discNumber;
  final int discTotal;
  final int year;
  final String genre;
  final Uint8List picture;
  final int fileSize;
  final int isPlaying;
  final int isFavorite;
  final String folder;
  const Song(
      {required this.id,
      required this.location,
      required this.title,
      required this.durationMs,
      required this.artist,
      required this.album,
      required this.albumArtist,
      required this.trackNumber,
      required this.trackTotal,
      required this.discNumber,
      required this.discTotal,
      required this.year,
      required this.genre,
      required this.picture,
      required this.fileSize,
      required this.isPlaying,
      required this.isFavorite,
      required this.folder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location'] = Variable<String>(location);
    map['title'] = Variable<String>(title);
    map['durationMs'] = Variable<double>(durationMs);
    map['artist'] = Variable<String>(artist);
    map['album'] = Variable<String>(album);
    map['albumArtist'] = Variable<String>(albumArtist);
    map['trackNumber'] = Variable<int>(trackNumber);
    map['trackTotal'] = Variable<int>(trackTotal);
    map['discNumber'] = Variable<int>(discNumber);
    map['discTotal'] = Variable<int>(discTotal);
    map['year'] = Variable<int>(year);
    map['genre'] = Variable<String>(genre);
    map['picture'] = Variable<Uint8List>(picture);
    map['fileSize'] = Variable<int>(fileSize);
    map['isPlaying'] = Variable<int>(isPlaying);
    map['isFavorite'] = Variable<int>(isFavorite);
    map['folder'] = Variable<String>(folder);
    return map;
  }

  SongsCompanion toCompanion(bool nullToAbsent) {
    return SongsCompanion(
      id: Value(id),
      location: Value(location),
      title: Value(title),
      durationMs: Value(durationMs),
      artist: Value(artist),
      album: Value(album),
      albumArtist: Value(albumArtist),
      trackNumber: Value(trackNumber),
      trackTotal: Value(trackTotal),
      discNumber: Value(discNumber),
      discTotal: Value(discTotal),
      year: Value(year),
      genre: Value(genre),
      picture: Value(picture),
      fileSize: Value(fileSize),
      isPlaying: Value(isPlaying),
      isFavorite: Value(isFavorite),
      folder: Value(folder),
    );
  }

  factory Song.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Song(
      id: serializer.fromJson<int>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      title: serializer.fromJson<String>(json['title']),
      durationMs: serializer.fromJson<double>(json['durationMs']),
      artist: serializer.fromJson<String>(json['artist']),
      album: serializer.fromJson<String>(json['album']),
      albumArtist: serializer.fromJson<String>(json['albumArtist']),
      trackNumber: serializer.fromJson<int>(json['trackNumber']),
      trackTotal: serializer.fromJson<int>(json['trackTotal']),
      discNumber: serializer.fromJson<int>(json['discNumber']),
      discTotal: serializer.fromJson<int>(json['discTotal']),
      year: serializer.fromJson<int>(json['year']),
      genre: serializer.fromJson<String>(json['genre']),
      picture: serializer.fromJson<Uint8List>(json['picture']),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      isPlaying: serializer.fromJson<int>(json['isPlaying']),
      isFavorite: serializer.fromJson<int>(json['isFavorite']),
      folder: serializer.fromJson<String>(json['folder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location': serializer.toJson<String>(location),
      'title': serializer.toJson<String>(title),
      'durationMs': serializer.toJson<double>(durationMs),
      'artist': serializer.toJson<String>(artist),
      'album': serializer.toJson<String>(album),
      'albumArtist': serializer.toJson<String>(albumArtist),
      'trackNumber': serializer.toJson<int>(trackNumber),
      'trackTotal': serializer.toJson<int>(trackTotal),
      'discNumber': serializer.toJson<int>(discNumber),
      'discTotal': serializer.toJson<int>(discTotal),
      'year': serializer.toJson<int>(year),
      'genre': serializer.toJson<String>(genre),
      'picture': serializer.toJson<Uint8List>(picture),
      'fileSize': serializer.toJson<int>(fileSize),
      'isPlaying': serializer.toJson<int>(isPlaying),
      'isFavorite': serializer.toJson<int>(isFavorite),
      'folder': serializer.toJson<String>(folder),
    };
  }

  Song copyWith(
          {int? id,
          String? location,
          String? title,
          double? durationMs,
          String? artist,
          String? album,
          String? albumArtist,
          int? trackNumber,
          int? trackTotal,
          int? discNumber,
          int? discTotal,
          int? year,
          String? genre,
          Uint8List? picture,
          int? fileSize,
          int? isPlaying,
          int? isFavorite,
          String? folder}) =>
      Song(
        id: id ?? this.id,
        location: location ?? this.location,
        title: title ?? this.title,
        durationMs: durationMs ?? this.durationMs,
        artist: artist ?? this.artist,
        album: album ?? this.album,
        albumArtist: albumArtist ?? this.albumArtist,
        trackNumber: trackNumber ?? this.trackNumber,
        trackTotal: trackTotal ?? this.trackTotal,
        discNumber: discNumber ?? this.discNumber,
        discTotal: discTotal ?? this.discTotal,
        year: year ?? this.year,
        genre: genre ?? this.genre,
        picture: picture ?? this.picture,
        fileSize: fileSize ?? this.fileSize,
        isPlaying: isPlaying ?? this.isPlaying,
        isFavorite: isFavorite ?? this.isFavorite,
        folder: folder ?? this.folder,
      );
  Song copyWithCompanion(SongsCompanion data) {
    return Song(
      id: data.id.present ? data.id.value : this.id,
      location: data.location.present ? data.location.value : this.location,
      title: data.title.present ? data.title.value : this.title,
      durationMs:
          data.durationMs.present ? data.durationMs.value : this.durationMs,
      artist: data.artist.present ? data.artist.value : this.artist,
      album: data.album.present ? data.album.value : this.album,
      albumArtist:
          data.albumArtist.present ? data.albumArtist.value : this.albumArtist,
      trackNumber:
          data.trackNumber.present ? data.trackNumber.value : this.trackNumber,
      trackTotal:
          data.trackTotal.present ? data.trackTotal.value : this.trackTotal,
      discNumber:
          data.discNumber.present ? data.discNumber.value : this.discNumber,
      discTotal: data.discTotal.present ? data.discTotal.value : this.discTotal,
      year: data.year.present ? data.year.value : this.year,
      genre: data.genre.present ? data.genre.value : this.genre,
      picture: data.picture.present ? data.picture.value : this.picture,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      isPlaying: data.isPlaying.present ? data.isPlaying.value : this.isPlaying,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
      folder: data.folder.present ? data.folder.value : this.folder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Song(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('title: $title, ')
          ..write('durationMs: $durationMs, ')
          ..write('artist: $artist, ')
          ..write('album: $album, ')
          ..write('albumArtist: $albumArtist, ')
          ..write('trackNumber: $trackNumber, ')
          ..write('trackTotal: $trackTotal, ')
          ..write('discNumber: $discNumber, ')
          ..write('discTotal: $discTotal, ')
          ..write('year: $year, ')
          ..write('genre: $genre, ')
          ..write('picture: $picture, ')
          ..write('fileSize: $fileSize, ')
          ..write('isPlaying: $isPlaying, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('folder: $folder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      location,
      title,
      durationMs,
      artist,
      album,
      albumArtist,
      trackNumber,
      trackTotal,
      discNumber,
      discTotal,
      year,
      genre,
      $driftBlobEquality.hash(picture),
      fileSize,
      isPlaying,
      isFavorite,
      folder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Song &&
          other.id == this.id &&
          other.location == this.location &&
          other.title == this.title &&
          other.durationMs == this.durationMs &&
          other.artist == this.artist &&
          other.album == this.album &&
          other.albumArtist == this.albumArtist &&
          other.trackNumber == this.trackNumber &&
          other.trackTotal == this.trackTotal &&
          other.discNumber == this.discNumber &&
          other.discTotal == this.discTotal &&
          other.year == this.year &&
          other.genre == this.genre &&
          $driftBlobEquality.equals(other.picture, this.picture) &&
          other.fileSize == this.fileSize &&
          other.isPlaying == this.isPlaying &&
          other.isFavorite == this.isFavorite &&
          other.folder == this.folder);
}

class SongsCompanion extends UpdateCompanion<Song> {
  final Value<int> id;
  final Value<String> location;
  final Value<String> title;
  final Value<double> durationMs;
  final Value<String> artist;
  final Value<String> album;
  final Value<String> albumArtist;
  final Value<int> trackNumber;
  final Value<int> trackTotal;
  final Value<int> discNumber;
  final Value<int> discTotal;
  final Value<int> year;
  final Value<String> genre;
  final Value<Uint8List> picture;
  final Value<int> fileSize;
  final Value<int> isPlaying;
  final Value<int> isFavorite;
  final Value<String> folder;
  const SongsCompanion({
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.title = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.artist = const Value.absent(),
    this.album = const Value.absent(),
    this.albumArtist = const Value.absent(),
    this.trackNumber = const Value.absent(),
    this.trackTotal = const Value.absent(),
    this.discNumber = const Value.absent(),
    this.discTotal = const Value.absent(),
    this.year = const Value.absent(),
    this.genre = const Value.absent(),
    this.picture = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.isPlaying = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.folder = const Value.absent(),
  });
  SongsCompanion.insert({
    this.id = const Value.absent(),
    required String location,
    required String title,
    required double durationMs,
    required String artist,
    required String album,
    required String albumArtist,
    required int trackNumber,
    required int trackTotal,
    required int discNumber,
    required int discTotal,
    required int year,
    required String genre,
    required Uint8List picture,
    required int fileSize,
    required int isPlaying,
    required int isFavorite,
    required String folder,
  })  : location = Value(location),
        title = Value(title),
        durationMs = Value(durationMs),
        artist = Value(artist),
        album = Value(album),
        albumArtist = Value(albumArtist),
        trackNumber = Value(trackNumber),
        trackTotal = Value(trackTotal),
        discNumber = Value(discNumber),
        discTotal = Value(discTotal),
        year = Value(year),
        genre = Value(genre),
        picture = Value(picture),
        fileSize = Value(fileSize),
        isPlaying = Value(isPlaying),
        isFavorite = Value(isFavorite),
        folder = Value(folder);
  static Insertable<Song> custom({
    Expression<int>? id,
    Expression<String>? location,
    Expression<String>? title,
    Expression<double>? durationMs,
    Expression<String>? artist,
    Expression<String>? album,
    Expression<String>? albumArtist,
    Expression<int>? trackNumber,
    Expression<int>? trackTotal,
    Expression<int>? discNumber,
    Expression<int>? discTotal,
    Expression<int>? year,
    Expression<String>? genre,
    Expression<Uint8List>? picture,
    Expression<int>? fileSize,
    Expression<int>? isPlaying,
    Expression<int>? isFavorite,
    Expression<String>? folder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (title != null) 'title': title,
      if (durationMs != null) 'durationMs': durationMs,
      if (artist != null) 'artist': artist,
      if (album != null) 'album': album,
      if (albumArtist != null) 'albumArtist': albumArtist,
      if (trackNumber != null) 'trackNumber': trackNumber,
      if (trackTotal != null) 'trackTotal': trackTotal,
      if (discNumber != null) 'discNumber': discNumber,
      if (discTotal != null) 'discTotal': discTotal,
      if (year != null) 'year': year,
      if (genre != null) 'genre': genre,
      if (picture != null) 'picture': picture,
      if (fileSize != null) 'fileSize': fileSize,
      if (isPlaying != null) 'isPlaying': isPlaying,
      if (isFavorite != null) 'isFavorite': isFavorite,
      if (folder != null) 'folder': folder,
    });
  }

  SongsCompanion copyWith(
      {Value<int>? id,
      Value<String>? location,
      Value<String>? title,
      Value<double>? durationMs,
      Value<String>? artist,
      Value<String>? album,
      Value<String>? albumArtist,
      Value<int>? trackNumber,
      Value<int>? trackTotal,
      Value<int>? discNumber,
      Value<int>? discTotal,
      Value<int>? year,
      Value<String>? genre,
      Value<Uint8List>? picture,
      Value<int>? fileSize,
      Value<int>? isPlaying,
      Value<int>? isFavorite,
      Value<String>? folder}) {
    return SongsCompanion(
      id: id ?? this.id,
      location: location ?? this.location,
      title: title ?? this.title,
      durationMs: durationMs ?? this.durationMs,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      albumArtist: albumArtist ?? this.albumArtist,
      trackNumber: trackNumber ?? this.trackNumber,
      trackTotal: trackTotal ?? this.trackTotal,
      discNumber: discNumber ?? this.discNumber,
      discTotal: discTotal ?? this.discTotal,
      year: year ?? this.year,
      genre: genre ?? this.genre,
      picture: picture ?? this.picture,
      fileSize: fileSize ?? this.fileSize,
      isPlaying: isPlaying ?? this.isPlaying,
      isFavorite: isFavorite ?? this.isFavorite,
      folder: folder ?? this.folder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (durationMs.present) {
      map['durationMs'] = Variable<double>(durationMs.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (album.present) {
      map['album'] = Variable<String>(album.value);
    }
    if (albumArtist.present) {
      map['albumArtist'] = Variable<String>(albumArtist.value);
    }
    if (trackNumber.present) {
      map['trackNumber'] = Variable<int>(trackNumber.value);
    }
    if (trackTotal.present) {
      map['trackTotal'] = Variable<int>(trackTotal.value);
    }
    if (discNumber.present) {
      map['discNumber'] = Variable<int>(discNumber.value);
    }
    if (discTotal.present) {
      map['discTotal'] = Variable<int>(discTotal.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    if (picture.present) {
      map['picture'] = Variable<Uint8List>(picture.value);
    }
    if (fileSize.present) {
      map['fileSize'] = Variable<int>(fileSize.value);
    }
    if (isPlaying.present) {
      map['isPlaying'] = Variable<int>(isPlaying.value);
    }
    if (isFavorite.present) {
      map['isFavorite'] = Variable<int>(isFavorite.value);
    }
    if (folder.present) {
      map['folder'] = Variable<String>(folder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsCompanion(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('title: $title, ')
          ..write('durationMs: $durationMs, ')
          ..write('artist: $artist, ')
          ..write('album: $album, ')
          ..write('albumArtist: $albumArtist, ')
          ..write('trackNumber: $trackNumber, ')
          ..write('trackTotal: $trackTotal, ')
          ..write('discNumber: $discNumber, ')
          ..write('discTotal: $discTotal, ')
          ..write('year: $year, ')
          ..write('genre: $genre, ')
          ..write('picture: $picture, ')
          ..write('fileSize: $fileSize, ')
          ..write('isPlaying: $isPlaying, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('folder: $folder')
          ..write(')'))
        .toString();
  }
}

class $FavoriteSongsTable extends FavoriteSongs
    with TableInfo<$FavoriteSongsTable, FavoriteSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteSongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  @override
  late final GeneratedColumn<int> songId = GeneratedColumn<int>(
      'song_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES songs(id)');
  static const VerificationMeta _markedAsFavoriteAtMeta =
      const VerificationMeta('markedAsFavoriteAt');
  @override
  late final GeneratedColumn<DateTime> markedAsFavoriteAt =
      GeneratedColumn<DateTime>('markedAsFavoriteAt', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, songId, markedAsFavoriteAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_songs';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteSong> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('song_id')) {
      context.handle(_songIdMeta,
          songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta));
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('markedAsFavoriteAt')) {
      context.handle(
          _markedAsFavoriteAtMeta,
          markedAsFavoriteAt.isAcceptableOrUnknown(
              data['markedAsFavoriteAt']!, _markedAsFavoriteAtMeta));
    } else if (isInserting) {
      context.missing(_markedAsFavoriteAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteSong(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}song_id'])!,
      markedAsFavoriteAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}markedAsFavoriteAt'])!,
    );
  }

  @override
  $FavoriteSongsTable createAlias(String alias) {
    return $FavoriteSongsTable(attachedDatabase, alias);
  }
}

class FavoriteSong extends DataClass implements Insertable<FavoriteSong> {
  final int id;
  final int songId;
  final DateTime markedAsFavoriteAt;
  const FavoriteSong(
      {required this.id,
      required this.songId,
      required this.markedAsFavoriteAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['song_id'] = Variable<int>(songId);
    map['markedAsFavoriteAt'] = Variable<DateTime>(markedAsFavoriteAt);
    return map;
  }

  FavoriteSongsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteSongsCompanion(
      id: Value(id),
      songId: Value(songId),
      markedAsFavoriteAt: Value(markedAsFavoriteAt),
    );
  }

  factory FavoriteSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteSong(
      id: serializer.fromJson<int>(json['id']),
      songId: serializer.fromJson<int>(json['songId']),
      markedAsFavoriteAt:
          serializer.fromJson<DateTime>(json['markedAsFavoriteAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'songId': serializer.toJson<int>(songId),
      'markedAsFavoriteAt': serializer.toJson<DateTime>(markedAsFavoriteAt),
    };
  }

  FavoriteSong copyWith({int? id, int? songId, DateTime? markedAsFavoriteAt}) =>
      FavoriteSong(
        id: id ?? this.id,
        songId: songId ?? this.songId,
        markedAsFavoriteAt: markedAsFavoriteAt ?? this.markedAsFavoriteAt,
      );
  FavoriteSong copyWithCompanion(FavoriteSongsCompanion data) {
    return FavoriteSong(
      id: data.id.present ? data.id.value : this.id,
      songId: data.songId.present ? data.songId.value : this.songId,
      markedAsFavoriteAt: data.markedAsFavoriteAt.present
          ? data.markedAsFavoriteAt.value
          : this.markedAsFavoriteAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteSong(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('markedAsFavoriteAt: $markedAsFavoriteAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, songId, markedAsFavoriteAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteSong &&
          other.id == this.id &&
          other.songId == this.songId &&
          other.markedAsFavoriteAt == this.markedAsFavoriteAt);
}

class FavoriteSongsCompanion extends UpdateCompanion<FavoriteSong> {
  final Value<int> id;
  final Value<int> songId;
  final Value<DateTime> markedAsFavoriteAt;
  const FavoriteSongsCompanion({
    this.id = const Value.absent(),
    this.songId = const Value.absent(),
    this.markedAsFavoriteAt = const Value.absent(),
  });
  FavoriteSongsCompanion.insert({
    this.id = const Value.absent(),
    required int songId,
    required DateTime markedAsFavoriteAt,
  })  : songId = Value(songId),
        markedAsFavoriteAt = Value(markedAsFavoriteAt);
  static Insertable<FavoriteSong> custom({
    Expression<int>? id,
    Expression<int>? songId,
    Expression<DateTime>? markedAsFavoriteAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (songId != null) 'song_id': songId,
      if (markedAsFavoriteAt != null) 'markedAsFavoriteAt': markedAsFavoriteAt,
    });
  }

  FavoriteSongsCompanion copyWith(
      {Value<int>? id,
      Value<int>? songId,
      Value<DateTime>? markedAsFavoriteAt}) {
    return FavoriteSongsCompanion(
      id: id ?? this.id,
      songId: songId ?? this.songId,
      markedAsFavoriteAt: markedAsFavoriteAt ?? this.markedAsFavoriteAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<int>(songId.value);
    }
    if (markedAsFavoriteAt.present) {
      map['markedAsFavoriteAt'] = Variable<DateTime>(markedAsFavoriteAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteSongsCompanion(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('markedAsFavoriteAt: $markedAsFavoriteAt')
          ..write(')'))
        .toString();
  }
}

class $LastPlayedSongsTable extends LastPlayedSongs
    with TableInfo<$LastPlayedSongsTable, LastPlayedSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LastPlayedSongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  @override
  late final GeneratedColumn<int> songId = GeneratedColumn<int>(
      'song_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES songs(id)');
  static const VerificationMeta _playedAtMeta =
      const VerificationMeta('playedAt');
  @override
  late final GeneratedColumn<DateTime> playedAt = GeneratedColumn<DateTime>(
      'playedAt', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, songId, playedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'last_played_songs';
  @override
  VerificationContext validateIntegrity(Insertable<LastPlayedSong> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('song_id')) {
      context.handle(_songIdMeta,
          songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta));
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('playedAt')) {
      context.handle(_playedAtMeta,
          playedAt.isAcceptableOrUnknown(data['playedAt']!, _playedAtMeta));
    } else if (isInserting) {
      context.missing(_playedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LastPlayedSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LastPlayedSong(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}song_id'])!,
      playedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}playedAt'])!,
    );
  }

  @override
  $LastPlayedSongsTable createAlias(String alias) {
    return $LastPlayedSongsTable(attachedDatabase, alias);
  }
}

class LastPlayedSong extends DataClass implements Insertable<LastPlayedSong> {
  final int id;
  final int songId;
  final DateTime playedAt;
  const LastPlayedSong(
      {required this.id, required this.songId, required this.playedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['song_id'] = Variable<int>(songId);
    map['playedAt'] = Variable<DateTime>(playedAt);
    return map;
  }

  LastPlayedSongsCompanion toCompanion(bool nullToAbsent) {
    return LastPlayedSongsCompanion(
      id: Value(id),
      songId: Value(songId),
      playedAt: Value(playedAt),
    );
  }

  factory LastPlayedSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LastPlayedSong(
      id: serializer.fromJson<int>(json['id']),
      songId: serializer.fromJson<int>(json['songId']),
      playedAt: serializer.fromJson<DateTime>(json['playedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'songId': serializer.toJson<int>(songId),
      'playedAt': serializer.toJson<DateTime>(playedAt),
    };
  }

  LastPlayedSong copyWith({int? id, int? songId, DateTime? playedAt}) =>
      LastPlayedSong(
        id: id ?? this.id,
        songId: songId ?? this.songId,
        playedAt: playedAt ?? this.playedAt,
      );
  LastPlayedSong copyWithCompanion(LastPlayedSongsCompanion data) {
    return LastPlayedSong(
      id: data.id.present ? data.id.value : this.id,
      songId: data.songId.present ? data.songId.value : this.songId,
      playedAt: data.playedAt.present ? data.playedAt.value : this.playedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LastPlayedSong(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('playedAt: $playedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, songId, playedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LastPlayedSong &&
          other.id == this.id &&
          other.songId == this.songId &&
          other.playedAt == this.playedAt);
}

class LastPlayedSongsCompanion extends UpdateCompanion<LastPlayedSong> {
  final Value<int> id;
  final Value<int> songId;
  final Value<DateTime> playedAt;
  const LastPlayedSongsCompanion({
    this.id = const Value.absent(),
    this.songId = const Value.absent(),
    this.playedAt = const Value.absent(),
  });
  LastPlayedSongsCompanion.insert({
    this.id = const Value.absent(),
    required int songId,
    required DateTime playedAt,
  })  : songId = Value(songId),
        playedAt = Value(playedAt);
  static Insertable<LastPlayedSong> custom({
    Expression<int>? id,
    Expression<int>? songId,
    Expression<DateTime>? playedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (songId != null) 'song_id': songId,
      if (playedAt != null) 'playedAt': playedAt,
    });
  }

  LastPlayedSongsCompanion copyWith(
      {Value<int>? id, Value<int>? songId, Value<DateTime>? playedAt}) {
    return LastPlayedSongsCompanion(
      id: id ?? this.id,
      songId: songId ?? this.songId,
      playedAt: playedAt ?? this.playedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<int>(songId.value);
    }
    if (playedAt.present) {
      map['playedAt'] = Variable<DateTime>(playedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LastPlayedSongsCompanion(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('playedAt: $playedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SongsTable songs = $SongsTable(this);
  late final $FavoriteSongsTable favoriteSongs = $FavoriteSongsTable(this);
  late final $LastPlayedSongsTable lastPlayedSongs =
      $LastPlayedSongsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [songs, favoriteSongs, lastPlayedSongs];
}

typedef $$SongsTableCreateCompanionBuilder = SongsCompanion Function({
  Value<int> id,
  required String location,
  required String title,
  required double durationMs,
  required String artist,
  required String album,
  required String albumArtist,
  required int trackNumber,
  required int trackTotal,
  required int discNumber,
  required int discTotal,
  required int year,
  required String genre,
  required Uint8List picture,
  required int fileSize,
  required int isPlaying,
  required int isFavorite,
  required String folder,
});
typedef $$SongsTableUpdateCompanionBuilder = SongsCompanion Function({
  Value<int> id,
  Value<String> location,
  Value<String> title,
  Value<double> durationMs,
  Value<String> artist,
  Value<String> album,
  Value<String> albumArtist,
  Value<int> trackNumber,
  Value<int> trackTotal,
  Value<int> discNumber,
  Value<int> discTotal,
  Value<int> year,
  Value<String> genre,
  Value<Uint8List> picture,
  Value<int> fileSize,
  Value<int> isPlaying,
  Value<int> isFavorite,
  Value<String> folder,
});

class $$SongsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SongsTable,
    Song,
    $$SongsTableFilterComposer,
    $$SongsTableOrderingComposer,
    $$SongsTableCreateCompanionBuilder,
    $$SongsTableUpdateCompanionBuilder> {
  $$SongsTableTableManager(_$AppDatabase db, $SongsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SongsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SongsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> durationMs = const Value.absent(),
            Value<String> artist = const Value.absent(),
            Value<String> album = const Value.absent(),
            Value<String> albumArtist = const Value.absent(),
            Value<int> trackNumber = const Value.absent(),
            Value<int> trackTotal = const Value.absent(),
            Value<int> discNumber = const Value.absent(),
            Value<int> discTotal = const Value.absent(),
            Value<int> year = const Value.absent(),
            Value<String> genre = const Value.absent(),
            Value<Uint8List> picture = const Value.absent(),
            Value<int> fileSize = const Value.absent(),
            Value<int> isPlaying = const Value.absent(),
            Value<int> isFavorite = const Value.absent(),
            Value<String> folder = const Value.absent(),
          }) =>
              SongsCompanion(
            id: id,
            location: location,
            title: title,
            durationMs: durationMs,
            artist: artist,
            album: album,
            albumArtist: albumArtist,
            trackNumber: trackNumber,
            trackTotal: trackTotal,
            discNumber: discNumber,
            discTotal: discTotal,
            year: year,
            genre: genre,
            picture: picture,
            fileSize: fileSize,
            isPlaying: isPlaying,
            isFavorite: isFavorite,
            folder: folder,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String location,
            required String title,
            required double durationMs,
            required String artist,
            required String album,
            required String albumArtist,
            required int trackNumber,
            required int trackTotal,
            required int discNumber,
            required int discTotal,
            required int year,
            required String genre,
            required Uint8List picture,
            required int fileSize,
            required int isPlaying,
            required int isFavorite,
            required String folder,
          }) =>
              SongsCompanion.insert(
            id: id,
            location: location,
            title: title,
            durationMs: durationMs,
            artist: artist,
            album: album,
            albumArtist: albumArtist,
            trackNumber: trackNumber,
            trackTotal: trackTotal,
            discNumber: discNumber,
            discTotal: discTotal,
            year: year,
            genre: genre,
            picture: picture,
            fileSize: fileSize,
            isPlaying: isPlaying,
            isFavorite: isFavorite,
            folder: folder,
          ),
        ));
}

class $$SongsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SongsTable> {
  $$SongsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get location => $state.composableBuilder(
      column: $state.table.location,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get durationMs => $state.composableBuilder(
      column: $state.table.durationMs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get artist => $state.composableBuilder(
      column: $state.table.artist,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get album => $state.composableBuilder(
      column: $state.table.album,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get albumArtist => $state.composableBuilder(
      column: $state.table.albumArtist,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get trackNumber => $state.composableBuilder(
      column: $state.table.trackNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get trackTotal => $state.composableBuilder(
      column: $state.table.trackTotal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get discNumber => $state.composableBuilder(
      column: $state.table.discNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get discTotal => $state.composableBuilder(
      column: $state.table.discTotal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get year => $state.composableBuilder(
      column: $state.table.year,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get genre => $state.composableBuilder(
      column: $state.table.genre,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get picture => $state.composableBuilder(
      column: $state.table.picture,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fileSize => $state.composableBuilder(
      column: $state.table.fileSize,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get isPlaying => $state.composableBuilder(
      column: $state.table.isPlaying,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get isFavorite => $state.composableBuilder(
      column: $state.table.isFavorite,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get folder => $state.composableBuilder(
      column: $state.table.folder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SongsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SongsTable> {
  $$SongsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get location => $state.composableBuilder(
      column: $state.table.location,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get durationMs => $state.composableBuilder(
      column: $state.table.durationMs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get artist => $state.composableBuilder(
      column: $state.table.artist,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get album => $state.composableBuilder(
      column: $state.table.album,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get albumArtist => $state.composableBuilder(
      column: $state.table.albumArtist,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get trackNumber => $state.composableBuilder(
      column: $state.table.trackNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get trackTotal => $state.composableBuilder(
      column: $state.table.trackTotal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get discNumber => $state.composableBuilder(
      column: $state.table.discNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get discTotal => $state.composableBuilder(
      column: $state.table.discTotal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get year => $state.composableBuilder(
      column: $state.table.year,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get genre => $state.composableBuilder(
      column: $state.table.genre,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get picture => $state.composableBuilder(
      column: $state.table.picture,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fileSize => $state.composableBuilder(
      column: $state.table.fileSize,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get isPlaying => $state.composableBuilder(
      column: $state.table.isPlaying,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get isFavorite => $state.composableBuilder(
      column: $state.table.isFavorite,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get folder => $state.composableBuilder(
      column: $state.table.folder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FavoriteSongsTableCreateCompanionBuilder = FavoriteSongsCompanion
    Function({
  Value<int> id,
  required int songId,
  required DateTime markedAsFavoriteAt,
});
typedef $$FavoriteSongsTableUpdateCompanionBuilder = FavoriteSongsCompanion
    Function({
  Value<int> id,
  Value<int> songId,
  Value<DateTime> markedAsFavoriteAt,
});

class $$FavoriteSongsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteSongsTable,
    FavoriteSong,
    $$FavoriteSongsTableFilterComposer,
    $$FavoriteSongsTableOrderingComposer,
    $$FavoriteSongsTableCreateCompanionBuilder,
    $$FavoriteSongsTableUpdateCompanionBuilder> {
  $$FavoriteSongsTableTableManager(_$AppDatabase db, $FavoriteSongsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FavoriteSongsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FavoriteSongsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> songId = const Value.absent(),
            Value<DateTime> markedAsFavoriteAt = const Value.absent(),
          }) =>
              FavoriteSongsCompanion(
            id: id,
            songId: songId,
            markedAsFavoriteAt: markedAsFavoriteAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int songId,
            required DateTime markedAsFavoriteAt,
          }) =>
              FavoriteSongsCompanion.insert(
            id: id,
            songId: songId,
            markedAsFavoriteAt: markedAsFavoriteAt,
          ),
        ));
}

class $$FavoriteSongsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FavoriteSongsTable> {
  $$FavoriteSongsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get songId => $state.composableBuilder(
      column: $state.table.songId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get markedAsFavoriteAt => $state.composableBuilder(
      column: $state.table.markedAsFavoriteAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FavoriteSongsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FavoriteSongsTable> {
  $$FavoriteSongsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get songId => $state.composableBuilder(
      column: $state.table.songId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get markedAsFavoriteAt => $state.composableBuilder(
      column: $state.table.markedAsFavoriteAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$LastPlayedSongsTableCreateCompanionBuilder = LastPlayedSongsCompanion
    Function({
  Value<int> id,
  required int songId,
  required DateTime playedAt,
});
typedef $$LastPlayedSongsTableUpdateCompanionBuilder = LastPlayedSongsCompanion
    Function({
  Value<int> id,
  Value<int> songId,
  Value<DateTime> playedAt,
});

class $$LastPlayedSongsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LastPlayedSongsTable,
    LastPlayedSong,
    $$LastPlayedSongsTableFilterComposer,
    $$LastPlayedSongsTableOrderingComposer,
    $$LastPlayedSongsTableCreateCompanionBuilder,
    $$LastPlayedSongsTableUpdateCompanionBuilder> {
  $$LastPlayedSongsTableTableManager(
      _$AppDatabase db, $LastPlayedSongsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LastPlayedSongsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LastPlayedSongsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> songId = const Value.absent(),
            Value<DateTime> playedAt = const Value.absent(),
          }) =>
              LastPlayedSongsCompanion(
            id: id,
            songId: songId,
            playedAt: playedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int songId,
            required DateTime playedAt,
          }) =>
              LastPlayedSongsCompanion.insert(
            id: id,
            songId: songId,
            playedAt: playedAt,
          ),
        ));
}

class $$LastPlayedSongsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $LastPlayedSongsTable> {
  $$LastPlayedSongsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get songId => $state.composableBuilder(
      column: $state.table.songId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get playedAt => $state.composableBuilder(
      column: $state.table.playedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$LastPlayedSongsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $LastPlayedSongsTable> {
  $$LastPlayedSongsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get songId => $state.composableBuilder(
      column: $state.table.songId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get playedAt => $state.composableBuilder(
      column: $state.table.playedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SongsTableTableManager get songs =>
      $$SongsTableTableManager(_db, _db.songs);
  $$FavoriteSongsTableTableManager get favoriteSongs =>
      $$FavoriteSongsTableTableManager(_db, _db.favoriteSongs);
  $$LastPlayedSongsTableTableManager get lastPlayedSongs =>
      $$LastPlayedSongsTableTableManager(_db, _db.lastPlayedSongs);
}
