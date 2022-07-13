import 'package:flutter/material.dart';

import '../../utils/tile_data.dart';
import '../../utils/font_scaler.dart';
import 'tile.dart';
import 'tile_null.dart';
import 'weekday.dart';

class Timetable extends StatelessWidget {
  Timetable({Key? key, required this.tiles}) : super(key: key);

  final List<List<TileData?>> tiles;

  final date = DateTime.now().weekday;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: IntrinsicColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: [
            const Center(),
            ...List.generate(5, (i) => TimetableWeekdayTile(i + 1)),
          ],
        ),
        ...tiles.asMap().entries.map(
              (entry) => TableRow(
                children: [
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Text(
                      '${(entry.key + 1)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.scale(context)),
                    ),
                  ),
                  ...entry.value.map((item) => item != null
                      ? TimetableTile(item)
                      : const TimetableTileNull()),
                ],
              ),
            ),
      ],
    );
  }
}
