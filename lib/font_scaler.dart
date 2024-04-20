import 'dart:math';

import 'package:flutter/material.dart';

const double baseScreenWidth = 360;
const double maxTimetableWidth = 580;
const double maxFontScale = 1.5;

extension FontScaler on num {
  double scale(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return this *
        min(min(screenWidth, maxTimetableWidth) / baseScreenWidth,
            maxFontScale);
  }
}
