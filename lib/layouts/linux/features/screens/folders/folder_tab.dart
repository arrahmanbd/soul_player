import 'package:soul_player/layouts/linux/features/screens/folders/folder_browse.dart';
import 'package:soul_player/layouts/linux/features/screens/folders/providers/folder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

class FolderTab extends ConsumerWidget {
  const FolderTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderState = ref.watch(folderProvider);
    if (folderState.isBrowsing) {
      return const FolderView();
    }
    if (folderState.directory.isNotEmpty) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemCount: folderState.directory.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 120,
            child: GestureDetector(
              onTap: () {
                ref
                    .read(folderProvider.notifier)
                    .getSongByFolders(folderState.directory[index].toString());
              },
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: YaruColors.blue.withOpacity(.35),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        padding: const EdgeInsets.all(34),
                        child: const Icon(
                          YaruIcons.folder_filled,
                          color: Color.fromARGB(255, 237, 244, 248),
                          size: 32,
                        )),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(folderState.directory[index]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
    //Get instantant
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const YaruCircularProgressIndicator(),
        const Text('Collection is Empty'),
        const SizedBox(height: 50.0),
        ElevatedButton(
          onPressed: () async {
            // Trigger getAllSongs to start scanning songs
            // final songScanner = ref.read(scanProvider.notifier);
            await ref.read(folderProvider.notifier).getAllFolders();
          },
          child: const Text('Refresh'),
        ),
      ],
    );
  }
}
/// SongList on the folder
/// Songlist by folder
