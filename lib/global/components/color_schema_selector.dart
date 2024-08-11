import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/providers/color_schema_provider.dart';

class ColorSchemeSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScheme = ref.watch(colorSchemeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildColorButton(context, ref, colorScheme1, currentScheme),
        _buildColorButton(context, ref, colorScheme2, currentScheme),
        _buildColorButton(context, ref, colorScheme3, currentScheme),
        _buildColorButton(context, ref, colorScheme4, currentScheme),
      ],
    );
  }

  Widget _buildColorButton(BuildContext context, WidgetRef ref, ColorScheme scheme, ColorScheme currentScheme) {
    final isSelected = scheme.primary == currentScheme.primary;

    return GestureDetector(
      onTap: () {
        ref.read(colorSchemeProvider.notifier).changeColorScheme(scheme);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: scheme.primary,
          border: Border.all(color: isSelected ? Colors.black : Colors.transparent, width: 2),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
