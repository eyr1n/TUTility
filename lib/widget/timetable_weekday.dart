import 'package:flutter/material.dart';
import 'package:tutility/font_scaler.dart';

const List<String> _weekdays = ['日', '月', '火', '水', '木', '金', '土'];

@immutable
class TimetableWeekday extends StatelessWidget {
  final int weekday;

  const TimetableWeekday({
    super.key,
    required this.weekday,
  });

  @override
  Widget build(BuildContext context) {
    final isToday = DateTime.now().weekday == weekday;

    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.scale(context)),
        padding: EdgeInsets.symmetric(
          horizontal: 16.scale(context),
          vertical: 2.scale(context),
        ),
        decoration: isToday
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(50),
              )
            : null,
        child: Text(
          _weekdays[weekday],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.scale(context),
          ),
        ),
      ),
    );
  }
}
