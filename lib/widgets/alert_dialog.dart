import 'package:flutter/material.dart';

@immutable
class _AlertDialog extends StatelessWidget {
  final String message;

  const _AlertDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: [
        TextButton(
          child: Text(MaterialLocalizations.of(context).closeButtonLabel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

Future<T?> showAlertDialog<T>({
  required BuildContext context,
  required String message,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => _AlertDialog(message: message),
    );
