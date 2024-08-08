// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soul_player/database/drift/data/database.dart';

class SongScanState {
  bool isloading;
  List<Song> songs;
  String errorMsg;
  SongScanState({
    required this.isloading,
    required this.songs,
    this.errorMsg = '',
  });

  SongScanState copyWith({
    bool? isloading,
    List<Song>? songs,
    String? errorMsg,
  }) {
    return SongScanState(
      isloading: isloading ?? this.isloading,
      songs: songs ?? this.songs,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
