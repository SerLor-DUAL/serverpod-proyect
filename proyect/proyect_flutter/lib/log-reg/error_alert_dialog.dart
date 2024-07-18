import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String errorTitle;
  final String errorContent;

  const ErrorAlertDialog({super.key, required this.errorTitle, required this.errorContent});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(errorTitle),
        content: Text(errorContent),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'))
          ]
        );
  }
}
