import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/font_scaler.dart';
import 'package:tutility/model/subject.dart';
import 'package:tutility/provider/hide_internship.dart';
import 'package:tutility/provider/hide_research.dart';
import 'package:tutility/widget/timetable_during_lot_tile.dart';
import 'package:tutility/widget/timetable_empty_tile.dart';
import 'package:tutility/widget/timetable_period.dart';
import 'package:tutility/widget/timetable_subject_tile.dart';
import 'package:tutility/widget/timetable_weekday.dart';

class TimetableView extends ConsumerWidget {
  final List<List<Subject?>> timetable;

  const TimetableView({
    super.key,
    required this.timetable,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideResearch = ref.watch(hideResearchNotifierProvider);
    final hideInternship = ref.watch(hideInternshipNotifierProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: maxTimetableWidth,
      ),
      child: Table(
        columnWidths: const {0: IntrinsicColumnWidth()},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              const SizedBox.shrink(),
              for (int i = 0; i < 5; i++) TimetableWeekday(weekday: i + 1),
            ],
          ),
          ...timetable.mapIndexed(
            (i, row) => TableRow(
              children: [
                TimetablePeriod(period: i + 1),
                ...row.map((subject) => (subject == null) ||
                        (hideResearch && subject.name.contains('卒業研究')) ||
                        (hideInternship && subject.name.contains('実務訓練'))
                    ? const TimetableEmptyTile()
                    : (subject.id == 'during_lot')
                        ? const TimetableDuringLotTile()
                        : TimetableSubjectTile(subject: subject)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
