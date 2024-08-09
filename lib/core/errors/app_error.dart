class AppError {
  final String message;
  final StackTrace? stackTrace;

  AppError({required this.message, this.stackTrace});

  @override
  String toString() {
    return 'Error: $message\nStackTrace: ${stackTrace?.toString() ?? 'No stack trace available'}';
  }
}

