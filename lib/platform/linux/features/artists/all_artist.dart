import 'package:soul_player/platform/linux/features/artists/controller/artist_state.dart';
import 'package:soul_player/platform/linux/features/artists/song_byartist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

import 'controller/artist_provider.dart';

class AllArtists extends ConsumerWidget {
  const AllArtists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistState = ref.watch(artistProvider);
    if (ViewMode.songs==artistState.mode) {
      return const ArtistSongs();
    }
    if (artistState.artist.isNotEmpty) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, mainAxisSpacing: 20, crossAxisSpacing: 20),
            
        itemCount: artistState.artist.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              ref
                  .read(artistProvider.notifier)
                  .getSongByArtists(artistState.artist[index]);
            },
            child: SizedBox(
              height: 120,
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: YaruColors.blue.withOpacity(.35),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: const Icon(
                          YaruIcons.folder_filled,
                          color: Color.fromARGB(255, 237, 244, 248),
                          size: 32,
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(artistState.artist[index]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const YaruCircularProgressIndicator(),
        const Text('Collection is Empty'),
        const SizedBox(height: 50.0),
        ElevatedButton(
            onPressed: () {
              // Trigger getAllSongs to start scanning songs
              //final songScanner = ref.read(scanProvider.notifier);
              ref.read(artistProvider.notifier).getAllArtist();
            },
            child: const Text('Empty, Scan Now')),
      ],
    );
  }
}
