import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/model/term.dart';
import 'package:tutility/provider/term.dart';
import 'package:tutility/provider/timetable.dart';
import 'package:tutility/router/app_router.dart';
import 'package:tutility/widgets/timetable.dart';

@RoutePage()
@immutable
class TimetablePage extends ConsumerWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timetable = ref.watch(timetableNotifierProvider);
    final term = ref.watch(termNotifierProvider);

    final firstOrSecond = switch (term) {
      Term.firstHalf => timetable?.firstHalf,
      Term.secondHalf => timetable?.secondHalf,
    };

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
                    label: Text('${timetable.semester.label}1'),
                  ),
                  ButtonSegment(
                    value: 1,
                    label: Text('${timetable.semester.label}2'),
                  ),
                ],
                selected: {term.index},
                onSelectionChanged: (newSelection) {
                  ref
                      .watch(termNotifierProvider.notifier)
                      .set(Term.values[newSelection.first]);
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
      body: firstOrSecond != null
          ? SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: TimetableWidget(timetable: firstOrSecond),
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
