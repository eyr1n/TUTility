import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/providers/timetable.dart';
import 'package:tutility/router/app_router.dart';
import 'package:tutility/widgets/timetable.dart';

@RoutePage()
@immutable
class TimetablePage extends ConsumerWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timetable = ref.watch(timetableProvider);

    final halfTimetable = timetable?.firstOrSecond == 0
        ? timetable?.firstHalf
        : timetable?.secondHalf;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: timetable != null
            ? SegmentedButton<int>(
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
                  ref.watch(timetableProvider.notifier).set(
                      timetable.copyWith(firstOrSecond: newSelection.first));
                },
              )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: '時間割の取得',
            onPressed: () {
              AutoRouter.of(context).push(GetTimetableRoute());
            },
          ),
        ],
      ),
      body: halfTimetable != null
          ? SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: TimetableWidget(timetable: halfTimetable),
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
