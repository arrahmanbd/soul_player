import 'package:flutter/material.dart';
import 'package:soul_player/core/styles/theme_text.dart';

class SongCardTile extends StatelessWidget {
  const SongCardTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
      leading: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          child: Image.asset(
            'assets/images/thumb.jpg',
            width: 120,
            height: 220,
            fit: BoxFit.cover,
          )),
      title: const Text(
        'Song Name',
        style: Typo.bodyMedium,
      ),
      subtitle: const Text(
        'Artists',
        style: Typo.labelMedium,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.play_arrow),
        onPressed: () {},
      ),
    );
  }
}
