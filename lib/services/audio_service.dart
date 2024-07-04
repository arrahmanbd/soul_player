// audio_service.dart

import 'package:audioplayers/audioplayers.dart'; 

class AudioService {
  final AudioPlayer _audioPlayer;

  AudioService(this._audioPlayer);

  Future<void> play(String songFile) async {
    await _audioPlayer.play(DeviceFileSource(songFile));
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

}
