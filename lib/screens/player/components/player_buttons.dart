// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class MediaButtons extends StatelessWidget {
  final IconData icon;
  final VoidCallback action;
  const MediaButtons({
    super.key,
    required this.icon,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       
      ),
      padding: const EdgeInsets.all(8),
      child: IconButton(
        icon:  Icon(icon),
        onPressed: action
      ),
    ).asGlass(clipBorderRadius:const BorderRadius.all(Radius.circular(100)));
  }
}
