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

extension BadgeName on BadgeType {
  String name() {
    switch (this) {
      case BadgeType.bronze:
        return "Bronze";
      case BadgeType.silver:
        return "Silver";
      case BadgeType.gold:
        return "Gold";
      case BadgeType.platinum:
        return "Platinum";
      default:
        return "Bronze";
    }
  }
}

extension NextBadgeName on BadgeType {
  String nextBadge() {
    switch (this) {
      case BadgeType.bronze:
        return "Silver";
      case BadgeType.silver:
        return "Gold";
      case BadgeType.gold:
        return "Platinum";
      case BadgeType.platinum:
        return "Platinum";
      default:
        return "Bronze";
    }
  }
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
        return AppColors.bronze;
    }
  }
}

extension BadgeNameColor on BadgeType {
  Color naemColor() {
    switch (this) {
      case BadgeType.bronze:
        return const Color(0xFFB07147);
      case BadgeType.silver:
        return const Color(0xFF5E5E5E);
      case BadgeType.gold:
        return const Color(0xFF947506);
      case BadgeType.platinum:
        return const Color(0xFF4F6188);
      default:
        return const Color(0xFFB07147);
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
        return "badge_bronze.svg";
    }
  }
}

extension BadgeBackground on BadgeType {
  String bg() {
    switch (this) {
      case BadgeType.bronze:
        return "rank_card_bg_bronze.svg";
      case BadgeType.silver:
        return "rank_card_bg_silver.svg";
      case BadgeType.gold:
        return "rank_card_bg_gold.svg";
      case BadgeType.platinum:
        return "rank_card_bg_platinum.svg";
      default:
        return "rank_card_bg_bronze.svg";
    }
  }
}
