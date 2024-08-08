import 'exception.dart';

class Result<T> {
  final T? data;
  final RepositoryError? error;

  Result._({this.data, this.error});

  // Factory constructor for success
  factory Result.success(T data) {
    return Result._(data: data);
  }

  // Factory constructor for error
  factory Result.failure(String message, {Exception? exception}) {
    return Result._(error: RepositoryError(message, exception: exception));
  }

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}
