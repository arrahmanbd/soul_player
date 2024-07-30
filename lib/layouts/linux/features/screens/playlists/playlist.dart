import 'package:soul_player/layouts/linux/features/screens/playlists/providers/playlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

class PlayLists extends ConsumerWidget {
  const PlayLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlist = ref.watch(playlistProvider);

    final playlistEC = TextEditingController();
    if (playlist.isLoading) {
      const YaruLinearProgressIndicator();
    }
    if (playlist.playList!.isNotEmpty) {
      return Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: playlist.playList!.length,
              itemBuilder: (BuildContext context, int index) {
                return YaruTile(
                  leading: const Icon(
                    YaruIcons.playlist,
                    size: 32,
                    color: YaruColors.blue,
                  ),
                  title: Text(playlist.playList![index]),
                );
              },
            ),
          ),
          SizedBox(
              width: 320, child: _playListBuilder(playlistEC, ref, context))
        ],
      );
    }
    return _playListBuilder(playlistEC, ref, context);
  }

  Widget _playListBuilder(
      TextEditingController playlistEC, WidgetRef ref, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: YaruColors.inkstone.withOpacity(.15),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          const Text('Create your PLayList'),
          const SizedBox(height: 10.0),
          SizedBox(
            width: 250,
            height: 56,
            child: TextFormField(
              controller: playlistEC,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(height: 10.0),
          YaruIconButton(
              onPressed: () {
                ref
                    .read(playlistProvider.notifier)
                    .createPlayList(playlistEC.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Playlist ${playlistEC.text} created')));
              },
              icon: const Icon(YaruIcons.plus))
        ],
      ),
    );
  }
}
