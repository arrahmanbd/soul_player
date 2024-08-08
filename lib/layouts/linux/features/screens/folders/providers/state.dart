// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soul_player/database/drift/data/database.dart';
import 'package:soul_player/layouts/linux/models/song_model.dart';

class FolderBrowser {
  bool isBrowsing;
  bool loading;
  String? folder;
  List<String> directory;
  String? totalItem;
  List<AudioSong> songs;
  FolderBrowser({
    required this.isBrowsing,
    required this.loading,
    this.folder,
    this.directory = const [],
    this.totalItem,
    this.songs = const [],
  });

  FolderBrowser copyWith({
    bool? isBrowsing,
    bool? loading,
    String? folder,
    List<String>? directory,
    String? totalItem,
    List<AudioSong>? songs,
  }) {
    return FolderBrowser(
      isBrowsing: isBrowsing ?? this.isBrowsing,
      loading: loading ?? this.loading,
      folder: folder ?? this.folder,
      directory: directory ?? this.directory,
      totalItem: totalItem ?? this.totalItem,
      songs: songs ?? this.songs,
    );
  }
}
