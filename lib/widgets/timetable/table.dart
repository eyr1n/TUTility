import 'package:flutter/material.dart';
import '../../utils/tile_data.dart';
import 'tile.dart';
import 'tile_null.dart';

class Timetable extends StatelessWidget {
  Timetable({Key? key, required this.tiles}) : super(key: key);

  final List<List<TileData?>> tiles;

  final date = DateTime.now().weekday;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Table(
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
                      margin: EdgeInsets.all(4),
                      child: Text(
                        '${(entry.key + 1)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...entry.value.map((item) => item != null
                        ? TimetableTile(item)
                        : const TimetableTileNull()),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

@immutable
class TimetableWeekdayTile extends StatelessWidget {
  const TimetableWeekdayTile(this.weekday, {Key? key}) : super(key: key);

  final int weekday;
  static const List<String> weekdays = ['日', '月', '火', '水', '木', '金', '土'];

  @override
  Widget build(BuildContext context) {
    int weekdayNow = DateTime.now().weekday;

    return Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          decoration: weekdayNow == weekday
              ? BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(50),
                )
              : null,
          child: Text(
            weekdays[weekday],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }
}
