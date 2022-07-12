import 'package:flutter/material.dart';

import '../../utils/palette.dart';
import '../../utils/tile_data.dart';
import 'tile_dialog.dart';

class TimetableTile extends StatelessWidget {
  const TimetableTile(this.tileData, {Key? key}) : super(key: key);

  final TileData tileData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 0.75,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: palette[tileData.id.hashCode % palette.length][100],
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: palette[tileData.id.hashCode % palette.length][200]!,
                  width: 1,
                ),
              ),
              child: Text(
                tileData.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(
                  height: 1.2,
                  color: Colors.black87,
                ),
              ),
            ),
            if (tileData.room.isNotEmpty)
              Container(
                width: double.infinity,
                height: 22,
                margin: const EdgeInsets.all(2),
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
                    color: Colors.black87,
                  ),
                ),
              ),
          ],
        ),
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
