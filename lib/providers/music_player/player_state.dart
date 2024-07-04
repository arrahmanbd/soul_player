// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:broken_soul/models/song_model.dart';

enum PlayerMode { playing, ause, stop }

class PlayerState {
  SongModel? song;
  PlayerMode mode;
  PlayerState({
    this.song,
    required this.mode,
  });
}
