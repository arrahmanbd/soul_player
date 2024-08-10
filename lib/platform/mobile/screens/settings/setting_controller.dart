// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingState {
  final bool particleEffect;
  final bool randomColor;
  final bool classicMediacontroller;
  final bool lightIndicator;
  SettingState({
    required this.particleEffect,
    required this.randomColor,
    required this.classicMediacontroller,
    required this.lightIndicator,
  });

  SettingState copyWith({
    bool? particleEffect,
    bool? randomColor,
    bool? classicMediacontroller,
    bool? lightIndicator,
  }) {
    return SettingState(
      particleEffect: particleEffect ?? this.particleEffect,
      randomColor: randomColor ?? this.randomColor,
      classicMediacontroller: classicMediacontroller ?? this.classicMediacontroller,
      lightIndicator: lightIndicator ?? this.lightIndicator,
    );
  }
}

class SettingNotifier extends StateNotifier<SettingState> {
  SettingNotifier(super.state);
//effect
  void enableEffects() {
    state = state.copyWith(particleEffect: !state.particleEffect);
  }
//effect with random color
  void enableRandomColor() {
    state = state.copyWith(randomColor: !state.randomColor);
  }
//classic menu
  void enableClassicMenu() {
    state =
        state.copyWith(classicMediacontroller: !state.classicMediacontroller);
  }
  //music light
  void enableLightIndicator() {
    state =
        state.copyWith(lightIndicator: !state.lightIndicator);
  }
}

final settingsProvider =
    StateNotifierProvider<SettingNotifier, SettingState>((ref) {
  final state = SettingState(
      particleEffect: false, randomColor: true, classicMediacontroller: false, lightIndicator: true);
  return SettingNotifier(state);
});
