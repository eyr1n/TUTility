import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutility/constants.dart';
import 'package:tutility/font_scaler.dart';

import 'get_timetable_page.dart';
import '../providers/timetable.dart';
import '../providers/timetable_visibility.dart';

import '../font_scaler.dart';
import '../widgets/timetable_tile.dart';
import '../widgets/timetable_weekday_tile.dart';

class TimetablePage extends ConsumerWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timetable? timetable = ref.watch(timetableProvider);
    TimetableVisibility? visibility = ref.watch(timetableVisibilityProvider);

    var appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              child: SvgPicture.asset('assets/icon_appbar.svg'),
              width: appBarHeight - 16,
              height: appBarHeight - 16,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
            const Text('TUTility')
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: '時間割の取得',
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GetTimetablePage(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),
      body: timetable != null && visibility != null
          ? SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                    maxWidth: maxTimetableWidth,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(8),
                        child: Text(
                          '取得日: ${DateFormat('y年M月d日').format(timetable.lastUpdated)}',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 11.scale(context)),
                        ),
                      ),
                      Table(
                        columnWidths: const {
                          0: IntrinsicColumnWidth(),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: <TableRow>[
                          TableRow(
                            children: [
                              const SizedBox.shrink(),
                              for (int i = 1; i < 6; i++)
                                TimetableWeekdayTile(i),
                            ],
                          ),
                          for (int row = 0; row < 6; row++)
                            TableRow(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(4),
                                  child: Text(
                                    '${(row + 1)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.scale(context)),
                                  ),
                                ),
                                for (int col = 0; col < 5; col++)
                                  TimetableTile(
                                    row: row,
                                    col: col,
                                  ),
                              ],
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          : Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.all(8),
                constraints: const BoxConstraints(
                  maxWidth: 640,
                ),
                child: const Center(
                  child: Text(
                      "右上のボタンかaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaら時間割を取得できます",
                      textAlign: TextAlign.center),
                ),
              ),
            ),
    );
  }
}
