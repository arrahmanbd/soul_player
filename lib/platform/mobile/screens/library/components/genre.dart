import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/platform/mobile/components/album_art.dart';
import 'package:soul_player/platform/mobile/screens/library/providers/library_provider.dart';
import 'package:yaru/widgets.dart';

import '../providers/library_state.dart';

class Genre extends ConsumerWidget {
  const Genre({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = ref.watch(libraryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Genre'),
      ),
      body: _buildBody(context, ref, media),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, LibraryState media) {
    if (media.isLoading) {
      return const Center(child: YaruCircularProgressIndicator());
    }

    if (media.genre.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('No genre found'),
            const SizedBox(height: 8),
            ElevatedButton(
              child: const Text('Refresh'),
              onPressed: () {
                ref.read(libraryProvider.notifier).getAllSongs();
              },
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: media.genre.length,
      itemBuilder: (BuildContext context, int index) {
        final s = media.genre[index];
        return ListTile(
          leading: ArtworkWidget(id: s.id),
          title: Text(
            s.genre,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          subtitle: Text(
            s.numOfSongs.toString(),
            style: const TextStyle(
              color: Color.fromARGB(255, 131, 131, 131),
            ),
          ),
        );
      },
    );
  }
}
