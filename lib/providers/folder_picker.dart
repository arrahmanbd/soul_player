import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FolderPicker extends StateNotifier<String?> {
  FolderPicker() : super(null);

  Future<void> pickDestination() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    print(selectedDirectory);
    state = selectedDirectory ?? '';
  }
}

//Destination  folder provider
final folderPickerProvider = StateNotifierProvider<FolderPicker, String?>((ref) {
  return FolderPicker();
});
