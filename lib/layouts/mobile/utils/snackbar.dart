import 'package:flutter/material.dart';
import 'package:soul_player/core/constants/colors.dart';

void message(String message, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(message),
    //  action: SnackBarAction(
    //    label: 'undo',
    //    onPressed: () {
    //      logic code
    //    },
    //  ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

soulBottomSheet(BuildContext context, Widget children) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.0),
        topLeft: Radius.circular(30.0),
      ),
    ),
    backgroundColor: secondaryDark,
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text('Now Playing'),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: children)
              ],
            ),
          ),
        ),
      );
    },
  );
}
