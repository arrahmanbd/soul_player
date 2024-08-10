import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:soul_player/platform/mobile/screens/library/providers/library_provider.dart';

class PermissionNotifier extends StateNotifier<bool> {
  final OnAudioQuery _audioQuery;
  final Ref ref;

  PermissionNotifier(
    this._audioQuery,
    this.ref,
  ) : super(false) {
    // Automatically check permission when the notifier is created
    _checkAndScan();
  }

  Future<void> _checkAndScan() async {
    await check();
    // if (state) {
    //   autoScan();
    // }
  }

  Future<void> check({bool retry = false}) async {
    bool hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );
    state = hasPermission;
  }

  void autoScan() {
    ref.read(libraryProvider.notifier).scanAll();
  }
}

final permissionProvider =
    StateNotifierProvider<PermissionNotifier, bool>((ref) {
  final OnAudioQuery audioQuery = OnAudioQuery();
  return PermissionNotifier(audioQuery, ref);
});
