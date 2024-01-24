import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// extension Ex on double {
//   double toRound(int n) => double.parse(toStringAsFixed(n));
// }

extension Ex on num {
  double get fs => (WidgetsBinding.instance.platformDispatcher.views.first
                  .physicalSize.shortestSide /
              WidgetsBinding
                  .instance.platformDispatcher.views.first.devicePixelRatio) <
          600
      ? (double.parse(toString()).h)
      : (double.parse(toString()).h * 1.15);
}
