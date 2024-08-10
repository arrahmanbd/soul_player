import 'package:flutter/material.dart';
import 'package:soul_player/core/styles/theme_text.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: Image.asset(
                'assets/images/thumb.jpg',
                width: 140,
                height: 72,
                fit: BoxFit.cover,
              )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Song Name',
                  style: Typo.bodyMedium,
                ),
                Text(
                  'Artists',
                  style: Typo.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
