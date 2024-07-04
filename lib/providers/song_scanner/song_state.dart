// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:broken_soul/models/song_model.dart';

class SongScanState {
  bool isloading;
  List<SongModel> songs;
  SongScanState({
    required this.isloading,
    required this.songs,
  });

  SongScanState copyWith({
    bool? isloading,
    List<SongModel>? songs,
  }) {
    return SongScanState(
      isloading: isloading ?? this.isloading,
      songs: songs ?? this.songs,
    );
  }
}
