// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:content_resolver/content_resolver.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path/path.dart' as path;

import 'package:soul_player/layouts/mobile/screens/library/providers/folder_model.dart';

class FolderNotifier extends StateNotifier<List<FolderModel>> {
  final OnAudioQuery audioQuery;
  final ContentResolver contentResolver;

  FolderNotifier(
    this.audioQuery,
    this.contentResolver,
  ) : super([]);

  Future<void> getAllFoldersWithSongCount() async {
    try {
      // Query all songs
      List<SongModel> songs = await audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );

      // Map to store folder paths and song counts
      Map<String, int> folderSongCount = {};

      // Count songs per folder and get real path for each song
      for (SongModel song in songs) {
        // Get real path for the song
        String? realPath = await getRealPathFromURI(Uri.parse(song.uri ?? ''));

        // Extract folder path from real path
        String folderPath = realPath?.replaceAll(song.title!, '') ?? '';

        // Update folder song count
        folderSongCount[folderPath] = (folderSongCount[folderPath] ?? 0) + 1;
        final String s= await getRealPathFromURI(Uri(path: song.uri)).toString();
      }

      // Convert map to list of FolderModel
      List<FolderModel> folders = folderSongCount.entries.map((entry)  {
        
        return FolderModel(
            folder: '',
            folderPath: entry.key,
            numberOfSongs: entry.value,
            isScanning: false);
      }).toList();

      // Update state with folders data
      state = [...folders];
    } catch (e) {
      state = [];
    }
  }


  Future<String?> getRealPathFromURI(Uri contentUri) async {
    // Query content resolver for real path
    final Content content = await ContentResolver.resolveContent(contentUri.toString());
    
    return content.fileName;
  }
}
