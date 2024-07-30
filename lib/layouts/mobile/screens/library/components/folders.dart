import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/mobile/screens/library/providers/library_provider.dart';
import 'package:yaru/widgets.dart';

import '../providers/library_state.dart';

class Folders extends ConsumerWidget {
  const Folders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = ref.watch(libraryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Folders'),
      ),
      body: _buildBody(context, ref, media),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, LibraryState media) {
    if (media.isLoading) {
      return const Center(child: YaruCircularProgressIndicator());
    }

    if (media.folders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('No Folders found'),
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
      itemCount: media.folders.length,
      itemBuilder: (BuildContext context, int index) {
        final s = media.folders[index];
        return ListTile(
          onTap: () {
            print(s.folderPath);
          },
          leading: const Icon(Icons.folder),
          title: Text(
            s.folderPath,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          subtitle: Text(
            s.numberOfSongs.toString(),
            style: const TextStyle(
              color: Color.fromARGB(255, 131, 131, 131),
            ),
          ),
        );
      },
    );
  }
}
