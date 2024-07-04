import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioPlayerProvider = Provider<AudioPlayer>((ref) => AudioPlayer());

final songsProvider = FutureProvider<List<File>>((ref) async {
  try {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    Directory downloadsDir = Directory(selectedDirectory.toString());
    var downloadsList = downloadsDir.list(recursive: true, followLinks: false);

    List<File> songs = [];
    await for (FileSystemEntity entity in downloadsList) {
      if (entity is File && entity.path.endsWith('.mp3')) {
        songs.add(entity);
      }
    }
    songs.sort((a, b) => a.path.compareTo(b.path));
    return songs;
  } catch (e) {
    if (kDebugMode) {
      print('Error scanning songs: $e');
    }
    return []; // or handle error appropriately
  }
});
