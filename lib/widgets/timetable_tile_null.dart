import 'package:flutter/material.dart';

class TimetableTileNull extends StatelessWidget {
  const TimetableTileNull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
