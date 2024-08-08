  // Static method to return a dummy Song instance
import 'database.dart';

Song dummySong() {
    return const Song(
      id: 0, // Assuming id is nullable or auto-incremented
      location: '/music/dummy_song.mp3',
      title: 'Dummy Song',
      durationMs: 180000.0, // 3 minutes in milliseconds
      artist: 'Dummy Artist',
      album: 'Dummy Album',
      albumArtist: 'Dummy Album Artist',
      trackNumber: 1,
      trackTotal: 10,
      discNumber: 1,
      discTotal: 1,
      year: 2024,
      genre: 'Dummy Genre',
      picture: '', // Assuming an empty string for no picture
      fileSize: 4000000, // Assuming a file size in bytes
      isPlaying: 0, // Not playing
      folder: '/music/',
    );
  }