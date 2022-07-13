import 'dart:math';

import 'package:flutter/widgets.dart';

extension FontScaler on num {
  double scale(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return this * min(screenWidth, 640.0) / 360.0;
  }
}
