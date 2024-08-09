// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/linux/features/library_scan/controller/lib_scanner.dart';
import 'package:path/path.dart' as path;

class UniLinkNotifier extends StateNotifier<String> {
  final Ref ref;
  UniLinkNotifier(this.ref) : super('');
  void getUniLink(List<String>? args) {
    String initialArgs = args?.isEmpty ?? true ? '' : args!.first;
    state = initialArgs;
    if (args != null) {
      String dir = path.basename(path.dirname(initialArgs));
      //ref.read(scanProvider.notifier).pickSongs(dir);
    }
  }
}

final unilinkProvider = StateNotifierProvider<UniLinkNotifier, String>((ref) {
  return UniLinkNotifier(ref);
});
