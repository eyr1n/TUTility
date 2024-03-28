import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutility/pages/in_app_browser.dart';

import '../constants.dart';
import '../providers/timetable.dart';
import '../providers/timetable_visibility.dart';
import '../widgets/timetable_tile.dart';
import '../widgets/timetable_period_tile.dart';
import '../widgets/timetable_weekday_tile.dart';
import './get_timetable_page.dart';

@immutable
class TimetablePage extends ConsumerWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timetable? timetable = ref.watch(timetableProvider);
    TimetableVisibility? visibility = ref.watch(timetableVisibilityProvider);

    final double appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
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
              child: SvgPicture.asset('assets/icon_appbar.svg'),
            ),
            const Text('TUTility')
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: '時間割の取得',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InAppBrowser(
                      uri: Uri.parse('https://kyomu.office.tut.ac.jp/portal/')),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),
      body: (timetable != null && visibility != null)
          ? SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                    maxWidth: maxTimetableWidth,
                  ),
                  child: Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          const SizedBox.shrink(),
                          for (int i = 1; i < 6; i++)
                            TimetableWeekdayTile(weekday: i),
                        ],
                      ),
                      for (int row = 0; row < 6; row++)
                        TableRow(
                          children: [
                            TimetablePeriodTile(period: row + 1),
                            for (int col = 0; col < 5; col++)
                              TimetableTile(row: row, col: col),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            )
          : Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: const Center(
                  child: Text(
                    '右上のボタンから時間割を取得できます',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
    );
  }
}
