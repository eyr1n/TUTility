import 'package:flutter/material.dart';

import '../font_scaler.dart';

@immutable
class TimetablePeriodTile extends StatelessWidget {
  const TimetablePeriodTile({Key? key, required this.period}) : super(key: key);

  final int period;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.scale(context)),
      child: Text(
        '${(period)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13.scale(context),
        ),
      ),
    );
  }
}
