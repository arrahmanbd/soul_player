
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioPlayerProvider = Provider<AudioPlayer>((ref) => AudioPlayer());
// State providers to track audio player states
final isPlayingProvider = StateProvider<bool>((ref) => false);
final volumeProvider = StateProvider<double>((ref) => 1.0);
final positionProvider = StateProvider<Duration>((ref) => Duration.zero);

