import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/app_colors.dart';
import 'package:thumbs_app/enums/badge_type.dart';

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

extension BadgeColor on BadgeType {
  Color color() {
    switch (this) {
      case BadgeType.bronze:
        return AppColors.bronze;
      case BadgeType.silver:
        return AppColors.silver;
      case BadgeType.gold:
        return AppColors.gold;
      case BadgeType.platinum:
        return AppColors.platinum;
      default:
        return Colors.white;
    }
  }
}

extension BadgeIcon on BadgeType {
  String icon() {
    switch (this) {
      case BadgeType.bronze:
        return "badge_bronze.svg";
      case BadgeType.silver:
        return "badge_silver.svg";
      case BadgeType.gold:
        return "badge_gold.svg";
      case BadgeType.platinum:
        return "badge_platinum.svg";
      default:
        return "";
    }
  }
}
