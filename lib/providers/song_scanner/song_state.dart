// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:broken_soul/models/song_model.dart';

class SongScanState {
  bool isloading;
  List<SongModel> songs;
  String errorMsg;
  SongScanState({
    required this.isloading,
    required this.songs,
     this.errorMsg ='',
  });

  SongScanState copyWith({
    bool? isloading,
    List<SongModel>? songs,
    String? errorMsg,
  }) {
    return SongScanState(
      isloading: isloading ?? this.isloading,
      songs: songs ?? this.songs,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
