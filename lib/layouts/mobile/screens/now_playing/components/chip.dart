// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:soul_player/core/constants/colors.dart';


class CustomChips extends StatelessWidget {
  final String text;
  final bool selected;
  final bool mark;
  final void Function(bool) onSelect;
  const CustomChips({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelect,
    this.mark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16 / 4),
      child: ChoiceChip(
        label: Text(text),
        showCheckmark: false,
        selected: selected,
        onSelected: onSelect,
        checkmarkColor: primary,
        selectedColor: primary.withOpacity(.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: BorderSide(
              width: 1,
              color:
                  selected ? primary : Theme.of(context).dividerColor),
        ),
        labelStyle: TextStyle(
          color: selected
              ? primary
              : Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}