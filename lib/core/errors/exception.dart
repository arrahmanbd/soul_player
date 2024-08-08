class RepositoryError {
  final String message;
  final Exception? exception;

  RepositoryError(this.message, {this.exception});

  @override
  String toString() {
    return message;
  }
}
