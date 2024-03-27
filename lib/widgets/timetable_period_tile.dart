import 'package:flutter/material.dart';

import '../font_scaler.dart';

@immutable
class TimetablePeriodTile extends StatelessWidget {
  const TimetablePeriodTile({super.key, required this.period});

  final int period;

  @override
  Widget build(BuildContext context) {
    String begin = "", end = "";
    switch (period) {
      case 1:
        begin = "8:50";
        end = "10:20";
        break;
      case 2:
        begin = "10:30";
        end = "12:00";
        break;
      case 3:
        begin = "13:00";
        end = "14:30";
        break;
      case 4:
        begin = "14:40";
        end = "16:10";
        break;
      case 5:
        begin = "16:20";
        end = "17:50";
        break;
      case 6:
        begin = "18:00";
        end = "19:30";
        break;
    }

    return Container(
      margin: EdgeInsets.all(2.scale(context)),
      child: Column(
        //margin: EdgeInsets.all(4.scale(context)),
        children: [
          Text(
            begin,
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 10.scale(context),
            ),
          ),
          Container(
            margin: EdgeInsets.all(2.scale(context)),
            child: Text(
              '${(period)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.scale(context),
              ),
            ),
          ),
          Text(
            end,
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 10.scale(context),
            ),
          ),
        ],
      ),
    );
  }
}
