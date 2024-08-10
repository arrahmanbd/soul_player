import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/platform/mobile/screens/library/providers/library_provider.dart';
import 'package:yaru/widgets.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artist'),
      ),
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          final artists = ref.watch(libraryProvider);

          if (artists.artists.isEmpty) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                YaruCircularProgressIndicator(),
                Text('List is Empty')
              ],
            );
          }
          if (artists.artists.isNotEmpty) {
            return ListView.builder(
              itemCount: artists.artists.length,
              itemBuilder: (BuildContext context, int index) {
                final singer = artists.artists[index];
                return ListTile(
                  title: Text(singer.artist),
                  subtitle: Text(singer.numberOfTracks.toString()),
                );
              },
            );
          }
          return const YaruLinearProgressIndicator();
        },
      ),
    );
  }
}
