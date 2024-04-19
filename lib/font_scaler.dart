import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tutility/constants.dart';

extension FontScaler on num {
  double scale(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return this *
        min(min(screenWidth, maxTimetableWidth) / baseScreenWidth,
            maxFontScale);
  }
}
