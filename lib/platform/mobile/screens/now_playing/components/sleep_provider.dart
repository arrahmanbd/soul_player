import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/nowplaying_providers.dart';

class SleepNotifier extends StateNotifier<int> {
  final Ref ref;
  SleepNotifier(this.ref) : super(0);

  Future<void> setSleep(int time) async {
    state = time;
    if (time != 0) {
      await Future.delayed(Duration(minutes: time), () {
        print('Sleep after $time enabled');
        ref.read(nowPlayingProvider.notifier).pause();
      });
    } else {
      ref.read(nowPlayingProvider.notifier).resume();
      print('time <0');
    }
  }
}

final sleepProvider = StateNotifierProvider<SleepNotifier, int>((ref) {
  return SleepNotifier(ref);
});
