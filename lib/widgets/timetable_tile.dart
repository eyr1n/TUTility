import 'package:flutter/material.dart';

import '../utils/palette.dart';
import '../utils/tile_data.dart';
import './timetable_tile_dialog.dart';

class TimetableTile extends StatelessWidget {
  const TimetableTile({Key? key, required this.tileData}) : super(key: key);

  final TileData tileData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: palette[tileData.id.hashCode % palette.length][100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              tileData.name,
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                height: 1.2,
              ),
            ),
          ),
          if (tileData.room.isNotEmpty)
            Container(
              width: double.infinity,
              height: 22,
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: palette[tileData.id.hashCode % palette.length][200],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(4),
                ),
              ),
              child: Text(
                tileData.room,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => TimetableTileDialog(
            tileData: tileData,
          ),
        );
      },
    );
  }
}
