import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String errorTitle;
  final String errorContent;

  const ErrorAlertDialog(
      {super.key, required this.errorTitle, required this.errorContent});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
      title: Text(
        errorTitle,
        style: const TextStyle(
          color: Color(0xFF369DD8),
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        errorContent,
        style: const TextStyle(color: Colors.black87),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'OK',
            style: TextStyle(
              color: Color(0xFF369DD8),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}