import 'dart:math';
import 'package:flutter/widgets.dart';

import './constants.dart';

extension FontScaler on num {
  double scale(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return this *
        min(min(screenWidth, maxTimetableWidth) / baseScreenWidth,
            maxFontScale);
  }
}
