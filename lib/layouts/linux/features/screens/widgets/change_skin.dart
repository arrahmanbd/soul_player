import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/linux/providers/skins/skin_providers.dart';

class SkinSelector extends ConsumerWidget {
  const SkinSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSkin = ref.watch(skinProvider);

    return DropdownButton<String>(
      hint: const Text('Select a skin'),
      value: selectedSkin.selectedSkin,
      onChanged: (String? newValue) {
        ref.read(skinProvider.notifier).changeSkin(newValue!);
      },
      items: skinNames.map((String skin) {
        return DropdownMenuItem<String>(
          value: skin,
          child: Text(skin),
        );
      }).toList(),
    );
  }
}
