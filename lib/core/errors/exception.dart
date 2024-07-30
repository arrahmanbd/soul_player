class Report implements Exception {
  final String message;
  final StackTrace stackTrace;

  Report({
    required this.message,
    this.stackTrace = StackTrace.empty,
  }) {
    devLog();
  }
  void devLog() {
    if (message.isNotEmpty) {
      print(message);
    }
  }

  @override
  String toString() {
    return 'AppException{message: $message, statusCode: $stackTrace';
  }
}
