import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  void showUserFriendlyMessage(String message, {Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
