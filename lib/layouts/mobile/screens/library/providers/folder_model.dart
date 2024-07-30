// ignore_for_file: public_member_api_docs, sort_constructors_first
class FolderModel {
  final String folder;
  final String folderPath;
  final int numberOfSongs;
  final bool isScanning;

  FolderModel({
    required this.folder,
    required this.folderPath,
    required this.numberOfSongs,
    required this.isScanning,
  });


  FolderModel copyWith({
    String? folder,
    String? folderPath,
    int? numberOfSongs,
    bool? isScanning,
  }) {
    return FolderModel(
      folder: folder ?? this.folder,
      folderPath: folderPath ?? this.folderPath,
      numberOfSongs: numberOfSongs ?? this.numberOfSongs,
      isScanning: isScanning ?? this.isScanning,
    );
  }
}
