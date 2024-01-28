import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/enums/rank_type.dart';
import 'package:thumbs_app/shared_widgets/common_widget.dart';
import 'package:thumbs_app/shared_widgets/gradient_progress_bar.dart';

class YourPointsScreen extends StatefulWidget {
  const YourPointsScreen({super.key});

  @override
  State<YourPointsScreen> createState() => _YourPointsScreenState();
}

class _YourPointsScreenState extends State<YourPointsScreen> {
  List<String> howItWorks = [
    "You will get points from appraisals from managers.",
    "You can redeem gift cards or other perks once you have enough points.",
    "You can redeem above said gifts by browsing through the perks tab."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonWidgets.commonAppBar(title: "Your Points", context: context),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        children: [
          _buildLabel("Your Points & Level"),
          _buildRankingCard(RankType.bronze, 2401, 2348),
          _buildLabel("Points Level Details"),
          _buildPointLevelDetails(),
          _buildLabel("How it Works"),
          for (int i = 0; i < howItWorks.length; i++) _buildHowItWorksTile(i),
        ],
      )),
    );
  }

  _buildPointLevelDetails() {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Container(
        height: 300.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: const Color(0xFFEBEDF0),
            borderRadius: BorderRadius.circular(10.h)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPointLevelBadgeCell(RankType.bronze, 0),
                _buildPointLevelBadgeCell(RankType.silver, 10000),
                _buildPointLevelBadgeCell(RankType.gold, 20000),
                _buildPointLevelBadgeCell(RankType.platinum, 50000),
              ],
            ),
            _buildPointLevelStepper(),
            Container(
              height: 40.h,
              width: 125.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFDFE2E6),
                  ),
                  borderRadius: BorderRadius.circular(8.h)),
              child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.scaleDown,
                child: Text(
                  "Redeem Gifts",
                  style: TextStyle(
                      fontSize: 14.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFB3005E)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildPointLevelStepper() {
    return Container(
      height: 40.h,
      width: 345.w,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _stepperCircle(true),
          _stepperProgress(50),
          _stepperCircle(false),
          _stepperProgress(0),
          _stepperCircle(false),
          _stepperProgress(0),
          _stepperCircle(false),
        ],
      ),
    );
  }

  _stepperProgress(int percent) {
    return Expanded(
      child: GradientProgressBar(
          percent: percent,
          curveless: true,
          gradient: const LinearGradient(
              colors: [Color(0xFFD13477), Color(0xFF80005D)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          backgroundColor: Colors.white),
    );
  }

  _stepperCircle(bool isFill) {
    return Container(
      height: 40.h,
      width: 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
        color: isFill ? const Color(0xFFB3005E) : Colors.white,
      ),
      child: isFill
          ? Icon(
              Icons.check,
              color: Colors.white,
              size: 30.h,
            )
          : null,
    );
  }

  _buildPointLevelBadgeCell(RankType type, int pts) {
    return SizedBox(
      height: 115.h,
      width: 65.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 65.h,
            width: 65.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.h)),
            child: Container(
              height: 48.h,
              width: 36.h,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFC2C7D0),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                type.icon(),
                height: 48.h,
                width: 36.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            child: Text(
              type.name(),
              style: TextStyle(
                  fontSize: 14.fs,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF15294B)),
            ),
          ),
          FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            child: Text(
              "$pts Pts",
              style: TextStyle(
                  fontSize: 12.fs,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF505F79)),
            ),
          ),
        ],
      ),
    );
  }

  _buildRankingCard(RankType type, int points, int earnMore) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          color: Colors.amber,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: SvgPicture.asset(
                type.bg(),
                height: 140.h,
                width: 400.w,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Available Points",
                            style: TextStyle(
                                fontSize: 14.fs,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF505F79)),
                          ),
                        ),
                        FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.scaleDown,
                          child: Text(
                            points.toString(),
                            style: TextStyle(
                                fontSize: 45.fs,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF333333)),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              text: type == RankType.platinum
                                  ? "Congrats! You are on "
                                  : "Earn $earnMore points to reach ",
                              style: TextStyle(
                                  fontSize: 13.fs,
                                  color: const Color(0xFF505F79),
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text: type.nextRank().toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 13.fs,
                                      color: const Color(0xFF15294B),
                                      fontWeight: FontWeight.w700),
                                ),
                                if (type == RankType.platinum)
                                  TextSpan(
                                    text:
                                        " level! Exciting perks awaits for you",
                                    style: TextStyle(
                                        fontSize: 13.fs,
                                        color: const Color(0xFF505F79),
                                        fontWeight: FontWeight.w500),
                                  )
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.h),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          type.icon(),
                          height: 20.h,
                          width: 16.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        FittedBox(
                          alignment: Alignment.centerRight,
                          fit: BoxFit.scaleDown,
                          child: Text(
                            type.name().toUpperCase(),
                            style: TextStyle(
                                fontSize: 15.fs,
                                fontWeight: FontWeight.w700,
                                color: type.rankNameColor()),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildHowItWorksTile(int index) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${index + 1}.  ",
            style: TextStyle(
                fontSize: 15.fs,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF15294B)),
          ),
          Expanded(
            child: Text(
              howItWorks[index],
              softWrap: true,
              style: TextStyle(
                  fontSize: 15.fs,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF15294B)),
            ),
          )
        ],
      ),
    );
  }

  _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.w),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 14.fs,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF000000)),
      ),
    );
  }
}
