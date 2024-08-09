import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soul_player/core/errors/app_error.dart';

class ErrorHandler {
  final BuildContext? context;

  ErrorHandler(this.context);

  void handleError(AppError error) {
    // Log the error (can be expanded to send to a server, etc.)
    if (kDebugMode) {
      print(error.toString());
    }
    // Show user-friendly message in the UI
    showUserFriendlyMessage(context!,error);
  }

  void showUserFriendlyMessage(BuildContext context, AppError error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Error: ${error.message}'),
      backgroundColor: Colors.red,
    ),
  );
}

}
