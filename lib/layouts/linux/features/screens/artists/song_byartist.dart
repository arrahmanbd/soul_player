import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

import 'providers/artist_provider.dart';

class ArtistSongs extends ConsumerWidget {
  const ArtistSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(artistProvider);
    if (songs.songs.isEmpty) {
      ElevatedButton(
        child: const Text('rEfresh'),
        onPressed: () {
          ref.read(artistProvider.notifier).setBrowsing(false);
        },
      );
    }
    if (songs.loading) const YaruLinearProgressIndicator();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            YaruBackButton(
              onPressed: () {
                ref.read(artistProvider.notifier).getAllArtists();
              },
            ),
            const Icon(YaruIcons.folder_open),
            TextButton(onPressed: () {}, child: Text(songs.artist.toString()))
          ],
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 12/8,
                crossAxisCount: 4, mainAxisSpacing: 20, crossAxisSpacing: 20),
            itemCount: songs.songs.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemBuilder: (BuildContext context, int index) {
              final file = songs.songs[index];
              return SizedBox(
                height: MediaQuery.sizeOf(context).height*.65,
              
                child: Card(
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image:  DecorationImage(
                              fit: BoxFit.cover,
                                image: file.picture!=null? MemoryImage(
                                    songs.songs[index].picture!.data): AssetImage('assets/images/thumb.jpg')),
                            color: YaruColors.blue.withOpacity(.35),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: const Icon(
                            YaruIcons.music_note,
                            color: Color.fromARGB(255, 237, 244, 248),
                            size: 32,
                          )),
                      
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(file.title.length < 20
                                  ? file.title
                                  : file.title.substring(0,20 )),
                             // Text(file.genre.toString()),
                              Text(songs.artist.toString()),
                             // Text(file.discTotal.toString()),
                              Text(file.year.toString())
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
