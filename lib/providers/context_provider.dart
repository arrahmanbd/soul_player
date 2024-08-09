import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildContextNotifier extends StateNotifier<BuildContext?> {
  BuildContextNotifier() : super(null);

  void update(BuildContext context) {
    state = context;
  }

  BuildContext? get currentContext => state;
}

final buildContextProvider = StateNotifierProvider<BuildContextNotifier, BuildContext?>((ref) {
  return BuildContextNotifier();
});
