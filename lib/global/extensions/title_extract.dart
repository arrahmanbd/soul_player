extension TitleExtractor on String {
  String extractTitle() {
    // Extract the file name from the path
    String fileName = this.split('/').last;

    // Split the file name at the first underscore
    List<String> parts = fileName.split(' _ ');

    // Get the title part
    String title = parts[0];

    // Remove any trailing file extension (if exists)
    title = title.replaceAll(RegExp(r'\.\w+$'), '');

    return title;
  }
}