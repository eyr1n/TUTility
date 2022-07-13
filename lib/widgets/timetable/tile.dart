import 'package:flutter/material.dart';

import '../../utils/palette.dart';
import '../../utils/tile_data.dart';
import './tile_dialog.dart';
import '../../utils/font_scaler.dart';

@immutable
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
                border: Border.all(
                  color: palette[tileData.id.hashCode % palette.length][200]!,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                tileData.name,
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
            if (tileData.room.isNotEmpty)
              Container(
                width: double.infinity,
                height: 22.scale(context),
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
                  style: TextStyle(
                    fontSize: 11.scale(context),
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
          builder: (context) => TimetableTileOnTapDialog(
            tileData: tileData,
          ),
        );
      },
    );
  }
}
