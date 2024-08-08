 // Material Banner implementation
import 'package:flutter/material.dart';

showMaterialBanner(BuildContext context) {
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
          content: const Text('Hello, I am Material Banner!'),
          contentTextStyle: const TextStyle(color: Colors.black, fontSize: 30),
          backgroundColor: Colors.yellow,
          leadingPadding: const EdgeInsets.only(right: 30),
          leading: const Icon(
            Icons.info,
            size: 32,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: const Text('Dismiss')),
            TextButton(onPressed: () {}, child: const Text('Continue')),
          ]));
    }