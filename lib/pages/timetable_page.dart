import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/constants.dart';
import 'package:tutility/providers/timetable.dart';
import 'package:tutility/router/app_router.dart';
import 'package:tutility/scope_functions.dart';
import 'package:tutility/widgets/empty_tile.dart';
import 'package:tutility/widgets/timetable_period_tile.dart';
import 'package:tutility/widgets/timetable_tile.dart';
import 'package:tutility/widgets/timetable_weekday_tile.dart';

@RoutePage()
@immutable
class TimetablePage extends ConsumerWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timetable = ref.watch(timetableProvider);

    final halfTimetable = timetable
        ?.let((p0) => p0.firstOrSecond == 0 ? p0.firstHalf : p0.secondHalf);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: timetable?.let(
          (timetable) => SegmentedButton<int>(
            multiSelectionEnabled: false,
            emptySelectionAllowed: false,
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                value: 0,
                label: Text('${timetable.period == 0 ? "前期" : "後期"}1'),
              ),
              ButtonSegment(
                value: 1,
                label: Text('${timetable.period == 0 ? "前期" : "後期"}2'),
              ),
            ],
            selected: {timetable.firstOrSecond},
            onSelectionChanged: (newSelection) {
              ref
                  .watch(timetableProvider.notifier)
                  .set(timetable.copyWith(firstOrSecond: newSelection.first));
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: '時間割の取得',
            onPressed: () {
              context.router.push(GetTimetableRoute());
            },
          ),
        ],
      ),
      body: halfTimetable != null
          ? SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(
                        maxWidth: maxTimetableWidth,
                      ),
                      child: Table(
                        columnWidths: const {
                          0: IntrinsicColumnWidth(),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
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
                                  halfTimetable[row][col]?.let((subject) =>
                                          TimetableTile(subject: subject)) ??
                                      const EmptyTile(),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
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
