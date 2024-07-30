import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:soul_player/layouts/mobile/components/album_art.dart';
import 'package:soul_player/layouts/mobile/screens/now_playing/providers/nowplaying_providers.dart';

import '../../../../../core/constants/colors.dart';

class SongTile extends ConsumerWidget {
  final List<SongModel> media;
  const SongTile({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(nowPlayingProvider);
    return ListView.builder(
      itemCount: media.length,
      itemBuilder: (BuildContext context, int index) {
        final md = MediaQuery.sizeOf(context);
        final s = media[index];
        final String time =
            Duration(milliseconds: s.duration ?? 000000).toString();
        return Container(
          color: watch.currentSongIndex == index
              ? Colors.red.withOpacity(.25)
              : deepDark,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16 / 2, vertical: 16 / 2),
            onTap: () {
              ref.read(nowPlayingProvider.notifier).playSong(index, media);
            },
            leading: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                width: md.width * .25,
                height: 120,
                child: ArtworkWidget(id: s.id)),
            title: Text(
              s.title,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.artist ?? "No Artist",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 131, 131, 131),
                  ),
                ),
                Text(
                  time.toString().substring(0, time.toString().length - 7),
                  style: const TextStyle(color: wh),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
