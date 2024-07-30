import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';

List<String> skinNames = [
  'default',
  'dynamicLight',
  'chocolate',
  'dynamicDark',
  'diamondRain',
  'lemonSunshine',
  'sunRise',
  'sunSet',
  'sunflower',
];

Map<String, Color> skinColors = {
  'default': Colors.brown,
  'dynamicLight': Colors.lightBlue,
  'chocolate': Colors.brown,
  'dynamicDark': Colors.black,
  'diamondRain': Colors.cyan,
  'lemonSunshine': Colors.yellow,
  'sunRise': Colors.orange,
  'sunSet': Colors.red,
  'sunflower': Colors.amber,
};

class SkinModel {
  final Color primaryColor;
  final String? selectedSkin;

  SkinModel({
    required this.primaryColor,
    this.selectedSkin,
  });

  SkinModel copyWith({
    Color? primaryColor,
    String? selectedSkin,
  }) {
    return SkinModel(
      primaryColor: primaryColor ?? this.primaryColor,
      selectedSkin: selectedSkin ?? this.selectedSkin,
    );
  }
}

class SkinNotifier extends StateNotifier<SkinModel> {
  SkinNotifier() : super(SkinModel(primaryColor: skinColors['dynamicLight']!));

  void changeSkin(String skin) {
    state = state.copyWith(primaryColor: skinColors[skin], selectedSkin: skin);
  }

  Future<void> autoSkin(ImageProvider skin) async {
    Color? generated;
    final PaletteGenerator pg = await PaletteGenerator.fromImageProvider(skin,maximumColorCount: 1);
    if (pg.colors.isNotEmpty) {
      generated = pg.colors.first;

      state =
          state.copyWith(primaryColor: generated, selectedSkin: skinNames[0]);
    }
    state = state.copyWith(primaryColor: generated, selectedSkin: skinNames[0]);
  }
}

final skinProvider = StateNotifierProvider<SkinNotifier, SkinModel>((ref) {
  return SkinNotifier();
});
