import 'package:flutter/material.dart';

@immutable
class TimetableTileNull extends StatelessWidget {
  const TimetableTileNull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.75,
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
