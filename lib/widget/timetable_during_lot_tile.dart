import 'package:flutter/material.dart';
import 'package:tutility/font_scaler.dart';
import 'package:tutility/widget/timetable_base_tile.dart';

@immutable
class TimetableDuringLotTile extends StatelessWidget {
  const TimetableDuringLotTile({super.key});

  @override
  Widget build(BuildContext context) {
    return TimetableBaseTile(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Text(
          '抽選中',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: TextStyle(
            height: 1.2,
            color: Colors.black87,
            fontSize: 12.scale(context),
          ),
        ),
      ),
    );
  }
}
