import 'package:flutter/material.dart';

import '../constants.dart';
import '../font_scaler.dart';

@immutable
class TimetableWeekdayTile extends StatelessWidget {
  const TimetableWeekdayTile({Key? key, required this.weekday})
      : super(key: key);

  final int weekday;

  @override
  Widget build(BuildContext context) {
    int weekdayNow = DateTime.now().weekday;

    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.scale(context)),
        padding: EdgeInsets.symmetric(
          horizontal: 16.scale(context),
          vertical: 2.scale(context),
        ),
        decoration: weekdayNow == weekday
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(50),
              )
            : null,
        child: Text(
          weekdays[weekday],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.scale(context),
          ),
        ),
      ),
    );
  }
}
