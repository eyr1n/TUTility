import 'package:flutter/material.dart';
import 'package:tutility/widget/timetable_base_tile.dart';

@immutable
class TimetableEmptyTile extends StatelessWidget {
  const TimetableEmptyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return TimetableBaseTile(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
    );
  }
}
