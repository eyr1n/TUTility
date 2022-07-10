import 'package:flutter/material.dart';
import '../utils/tile_data.dart';
import './timetable_tile.dart';
import './timetable_tile_null.dart';

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
              ...List.generate(5, (i) => TimetableWeekdayTile(weekday: i + 1)),
            ],
          ),
          ...tiles.asMap().entries.map(
                (entry) => TableRow(
                  children: [
                    Text('${(entry.key + 1)}'),
                    ...entry.value.map(
                      (item) => Container(
                        margin: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 0.75,
                          child: item != null
                              ? TimetableTile(
                                  tileData: item,
                                )
                              : const TimetableTileNull(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

class TimetableWeekdayTile extends StatelessWidget {
  TimetableWeekdayTile({Key? key, required this.weekday}) : super(key: key);

  final int weekday;
  final List<String> weekdays = ['日', '月', '火', '水', '木', '金', '土'];

  @override
  Widget build(BuildContext context) {
    int weekday_now = DateTime.now().weekday;
    if (weekday_now == weekday) return Center(child: Text("今日"));
    return Center(child: Text(weekdays[weekday]));
  }
}
