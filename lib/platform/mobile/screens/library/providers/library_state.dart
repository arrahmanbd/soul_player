// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'folder_model.dart';

class LibraryState extends Equatable {
  final bool isLoading;
  final List<SongModel> songs;
  final List<ArtistModel> artists;
  final List<AlbumModel> albums;
  final List<GenreModel> genre;
  final List<PlaylistModel> playlist;
  final List<FolderModel> folders;
  final String errorMsg;
  const LibraryState({
    this.isLoading = true,
    this.songs = const [],
    this.artists = const [],
    this.albums = const [],
    this.genre = const [],
    this.playlist = const [],
    this.folders = const[],
    this.errorMsg = '',
  });

  //constractor

  LibraryState copyWith({
    bool? isLoading,
    List<SongModel>? songs,
    List<ArtistModel>? artists,
    List<AlbumModel>? albums,
    List<GenreModel>? genre,
    List<PlaylistModel>? playlist,
    List<FolderModel>? folders,
    String? errorMsg,
  }) {
    return LibraryState(
      isLoading: isLoading ?? this.isLoading,
      songs: songs ?? this.songs,
      artists: artists ?? this.artists,
      albums: albums ?? this.albums,
      genre: genre ?? this.genre,
      playlist: playlist ?? this.playlist,
      folders: folders ?? this.folders,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [isLoading, songs, artists, playlist, genre, albums,folders];
}
