import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/shared_widgets/common_widget.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          _buildLabel("Your Points & Level"),
          _buildLabel("Points Level Details"),
          _buildLabel("How it Works"),
          for (int i = 0; i < howItWorks.length; i++) _buildHowItWorksTile(i),
        ],
      )),
    );
  }

  _buildHowItWorksTile(int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, top: index == 0 ? 12.h : 0),
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
    return Text(
      label,
      style: TextStyle(
          fontSize: 14.fs,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF000000)),
    );
  }
}
