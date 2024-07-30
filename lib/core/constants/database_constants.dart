  // Beginning with [.] simply hide it on file manager
  const databaseName = "soul_player.db";
  const databaseVersion = 1;
  //All song table
  const table = 'music';
  const columnId = '_id';
  const columnLocation = 'location';
  const columnTitle = 'title';
  const columnDurationMs = 'durationMs';
  const columnArtist = 'artist';
  const columnAlbum = 'album';
  const columnAlbumArtist = 'albumArtist';
  const columnTrackNumber = 'trackNumber';
  const columnTrackTotal = 'trackTotal';
  const columnDiscNumber = 'discNumber';
  const columnDiscTotal = 'discTotal';
  const columnYear = 'year';
  const columnGenre = 'genre';
  const columnPicture = 'picture';
  const columnFileSize = 'fileSize';
  const columnIsPlaying = 'isPlaying';
  const columnFolder = 'folder';

  // Additional tables
  const favoriteTable = 'favorite';
  const recentPlayedTable = 'recent_played';
  const playlistsTable = 'playlists';
  const playlistSongsTable = 'playlist_songs';