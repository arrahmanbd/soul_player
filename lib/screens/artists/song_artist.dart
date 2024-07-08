import 'package:broken_soul/providers/artist_provider/artist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtistWidget extends ConsumerWidget {
  const ArtistWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(artistProvider);

    if (artists.isNotEmpty) {
      return Wrap(
        spacing: 8.0, // Adjust spacing as needed
        children: [
          ...artists.map((artist) => Chip(label: Text(artist))),
        ],
      );
    }

    return Container(
      child: Column(
        children: [
          Text('NO ARtist Founds'),
          IconButton(
            icon: const Icon(Icons.art_track),
            onPressed: () {
              ref.read(artistProvider.notifier).getAllArtist();
            },
          ),
        ],
      ),
    ); // or any fallback widget if artists is empty
  }
}
