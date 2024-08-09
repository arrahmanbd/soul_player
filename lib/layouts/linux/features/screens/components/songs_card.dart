// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soul_player/database/drift/data/database.dart';
import 'package:soul_player/layouts/linux/providers/player/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/linux/features/library_scan/controller/lib_scanner.dart';
import 'package:soul_player/utils/base64_image.dart';
import 'package:yaru/yaru.dart';

class SongList extends StatefulWidget {
  final List<Song> songs;

  const SongList({
    super.key,
    required this.songs,
  });

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  bool _isLoadingMore = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (!_isLoadingMore &&
            scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          _loadMoreSongs(context);
          return true;
        }
        return false;
      },
      child: ListView.builder(
        itemCount: widget.songs.length + 1, // +1 for Load More button
        itemBuilder: (BuildContext context, int index) {
          if (index == widget.songs.length) {
            // This is the last item (Load More button)
            return _buildLoadMoreButton();
          }
          final song = widget.songs[index];
          return YaruTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: SizedBox(
                width: 120,
                height: 120,
                child: buildSongImage(song.picture),
              ),
            ),
            title: Text(song.title),
            subtitle: Text(song.artist ?? 'Unknown Artist'),
            trailing: Consumer(
              builder: (_, WidgetRef ref, __) {
                return IconButton(
                  onPressed: () {
                    if (song.isPlaying == 0) {
                      ref.read(linuxPlayerProvider.notifier).pause();
                    } else {
                      ref.read(linuxPlayerProvider.notifier).play(song);
                    }
                  },
                  icon: Icon(
                    song.isPlaying == 0
                        ? Icons.pause
                        : Icons.play_arrow_outlined,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadMoreButton() {
    return _isLoadingMore
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  return ElevatedButton(
                      onPressed: () async {
                        // Trigger getAllSongs to start scanning songs
                        final songScanner =
                            ref.read(libraryScanerProvider.notifier);
                        await songScanner.getAllSongs();
                      },
                      child: const Text('Scan Library'));
                },
              ),
            ),
          );
  }

  Future<void> _loadMoreSongs(BuildContext context) async {
    // setState(() {
    //   _isLoadingMore = true;
    // });
    // try {
    //   await context.read(scanProvider.notifier).getAllSongs();
    // } finally {
    //   setState(() {
    //     _isLoadingMore = false;
    //   });
    // }
  }
}
