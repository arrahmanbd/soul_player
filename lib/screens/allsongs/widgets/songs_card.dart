// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:broken_soul/core/extensions/title_extract.dart';
import 'package:broken_soul/models/song_model.dart';
import 'package:broken_soul/providers/music_player/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongList extends StatefulWidget {
  final List<SongModel> songs;

  const SongList({
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
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: _buildSongImage(song),
            ),
            title: Text(song.title ?? song.location.extractTitle()),
            subtitle: Text(song.artist ?? 'Unknown Artist'),
            trailing: Consumer(
              builder: (_, WidgetRef ref, __) {
                return IconButton(
                  onPressed: () {
                    if (song.isPlaying) {
                      ref.read(playerProvider.notifier).pause();
                    } else {
                      ref.read(playerProvider.notifier).play(song);
                    }
                  },
                  icon: Icon(
                    song.isPlaying ? Icons.pause : Icons.play_arrow_outlined,
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
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => _loadMoreSongs(context),
                child: Text("Load More"),
              ),
            ),
          );
  }

  Widget _buildSongImage(SongModel song) {
    return song.picture != null && song.picture!.data.isNotEmpty
        ? Image.memory(
            song.picture!.data,
            fit: BoxFit.cover,
          )
        : const Icon(Icons.music_note);
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
