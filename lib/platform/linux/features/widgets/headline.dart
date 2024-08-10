// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:soul_player/core/styles/theme_text.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({
    Key? key,
    required this.title,
    required this.action,
    this.enableAction=true,
  }) : super(key: key);
  final String title;
  final VoidCallback action;
  final bool enableAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: Typo.headlineSmall,),
        TextButton(onPressed: action, child: Text('View'))
      ],
    );
  }
}
