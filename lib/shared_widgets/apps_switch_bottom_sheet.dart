import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';

class AppsSwitchBottomSheet extends StatefulWidget {
  const AppsSwitchBottomSheet({super.key});

  @override
  State<AppsSwitchBottomSheet> createState() => _AppsSwitchBottomSheetState();
}

class _AppsSwitchBottomSheetState extends State<AppsSwitchBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.h),
            topRight: Radius.circular(10.h),
          )),
      child: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 7.5.h, bottom: 5.h),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 36.h,
                height: 5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5.h),
                    color: const Color(0xFF7F7F7F)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("ThumbsChat", const Color(0xFF9747FF),
                    const Color(0xFF7017E3), "thumbs_chat"),
                _buildButton("WorkPortal", const Color(0xFF0D82C5),
                    const Color(0xFF024D78), "workportal"),
              ],
            ),
          )
        ],
      )),
    );
  }

  _buildButton(
      String title, Color backgroundColor, Color shadowColor, String iconName) {
    return Column(
      children: [
        Container(
          height: 100.h,
          width: 100.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                spreadRadius: 0,
                blurRadius: 0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: SvgPicture.asset(
            "assets/icons/$iconName.svg",
            width: 70.h,
            height: 70.h,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18.fs,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF505F79)),
          ),
        ),
      ],
    );
  }
}
