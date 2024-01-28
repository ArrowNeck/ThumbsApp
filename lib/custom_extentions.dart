import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/app_colors.dart';
import 'package:thumbs_app/enums/badge_type.dart';
import 'package:thumbs_app/enums/rank_type.dart';

extension Ex on num {
  double get fs => (WidgetsBinding.instance.platformDispatcher.views.first
                  .physicalSize.shortestSide /
              WidgetsBinding
                  .instance.platformDispatcher.views.first.devicePixelRatio) <
          600
      ? (h)
      : h * 1.15;
}

extension BadgeName on BadgeType {
  String name() {
    switch (this) {
      case BadgeType.kudos:
        return "Kudos";
      case BadgeType.rockstar:
        return "Rockstar";
      case BadgeType.epic:
        return "Epic";
      case BadgeType.legend:
        return "Legend";
      default:
        return "Kudos";
    }
  }
}

extension BadgePoints on BadgeType {
  int point() {
    switch (this) {
      case BadgeType.kudos:
        return 100;
      case BadgeType.rockstar:
        return 200;
      case BadgeType.epic:
        return 500;
      case BadgeType.legend:
        return 1000;
      default:
        return 100;
    }
  }
}

extension BadgeIcon on BadgeType {
  String icon() {
    switch (this) {
      case BadgeType.kudos:
        return "assets/icons/hand_metal.svg";
      case BadgeType.rockstar:
        return "assets/icons/hand_metal.svg";
      case BadgeType.epic:
        return "assets/icons/trophy.svg";
      case BadgeType.legend:
        return "assets/icons/rocket.svg";
      default:
        return "assets/icons/hand_metal.svg";
    }
  }
}

extension BadgeLogo on BadgeType {
  String logo() {
    switch (this) {
      case BadgeType.kudos:
        return "assets/icons/kudos_logo.svg";
      case BadgeType.rockstar:
        return "assets/icons/rockstar_logo.svg";
      case BadgeType.epic:
        return "assets/icons/epic_logo.svg";
      case BadgeType.legend:
        return "assets/icons/legend_logo.svg";
      default:
        return "assets/icons/kudos_logo.svg";
    }
  }
}

extension BadgeGradients on BadgeType {
  LinearGradient gradient() {
    switch (this) {
      case BadgeType.kudos:
        return const LinearGradient(
            colors: [Color(0xFF3FAE36), Color(0xFF2C7A26)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter);
      case BadgeType.rockstar:
        return const LinearGradient(
            colors: [Color(0xFFF9472F), Color(0xFFAE3221)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter);
      case BadgeType.epic:
        return const LinearGradient(
            colors: [Color(0xFFFEC219), Color(0xFF8A712A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter);
      case BadgeType.legend:
        return const LinearGradient(
            colors: [Color(0xFF7A8699), Color(0xFF15294B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter);
      default:
        return const LinearGradient(
            colors: [Color(0xFF3FAE36), Color(0xFF2C7A26)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter);
    }
  }
}

extension RankName on RankType {
  String name() {
    switch (this) {
      case RankType.bronze:
        return "Bronze";
      case RankType.silver:
        return "Silver";
      case RankType.gold:
        return "Gold";
      case RankType.platinum:
        return "Platinum";
      default:
        return "Bronze";
    }
  }
}

extension NextRankName on RankType {
  String nextRank() {
    switch (this) {
      case RankType.bronze:
        return "Silver";
      case RankType.silver:
        return "Gold";
      case RankType.gold:
        return "Platinum";
      case RankType.platinum:
        return "Platinum";
      default:
        return "Bronze";
    }
  }
}

extension RankColor on RankType {
  Color color() {
    switch (this) {
      case RankType.bronze:
        return AppColors.bronze;
      case RankType.silver:
        return AppColors.silver;
      case RankType.gold:
        return AppColors.gold;
      case RankType.platinum:
        return AppColors.platinum;
      default:
        return AppColors.bronze;
    }
  }
}

extension RankNameColor on RankType {
  Color rankNameColor() {
    switch (this) {
      case RankType.bronze:
        return const Color(0xFFB07147);
      case RankType.silver:
        return const Color(0xFF5E5E5E);
      case RankType.gold:
        return const Color(0xFF947506);
      case RankType.platinum:
        return const Color(0xFF4F6188);
      default:
        return const Color(0xFFB07147);
    }
  }
}

extension RankIcon on RankType {
  String icon() {
    switch (this) {
      case RankType.bronze:
        return "assets/icons/rank_bronze.svg";
      case RankType.silver:
        return "assets/icons/rank_silver.svg";
      case RankType.gold:
        return "assets/icons/rank_gold.svg";
      case RankType.platinum:
        return "assets/icons/rank_platinum.svg";
      default:
        return "assets/icons/rank_bronze.svg";
    }
  }
}

extension RankBackground on RankType {
  String bg() {
    switch (this) {
      case RankType.bronze:
        return "assets/icons/rank_card_bg_bronze.svg";
      case RankType.silver:
        return "assets/icons/rank_card_bg_silver.svg";
      case RankType.gold:
        return "assets/icons/rank_card_bg_gold.svg";
      case RankType.platinum:
        return "assets/icons/rank_card_bg_platinum.svg";
      default:
        return "assets/icons/rank_card_bg_bronze.svg";
    }
  }
}
