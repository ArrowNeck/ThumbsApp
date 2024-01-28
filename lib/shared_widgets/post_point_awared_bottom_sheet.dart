import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/enums/badge_type.dart';

class PostPointAwaredBottomSheet extends StatefulWidget {
  const PostPointAwaredBottomSheet({super.key});

  @override
  State<PostPointAwaredBottomSheet> createState() =>
      _PostPointAwaredBottomSheetState();
}

class _PostPointAwaredBottomSheetState
    extends State<PostPointAwaredBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      constraints: BoxConstraints(maxHeight: 850.h),
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
            padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
            child: Container(
              height: 80.h,
              width: 160.w,
              padding: EdgeInsets.symmetric(horizontal: 7.5.w),
              decoration: BoxDecoration(
                  color: const Color(0xFF990060),
                  borderRadius: BorderRadius.circular(40.h)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 65.h,
                    width: 65.h,
                    decoration: const BoxDecoration(
                        color: Color(0xFFFFEBEE), shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "500P",
                          style: TextStyle(
                              fontSize: 18.fs,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Epic",
                          style: TextStyle(
                              fontSize: 14.fs,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFF794AA)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            shrinkWrap: true,
            children: [
              _label("Points Awarded by:"),
              _awardedByTile(),
              _awardedByTile(),
              _awardedByTile(),
              _awardedByTile(),
              Divider(
                color: const Color(0xFFDFE2E6),
                thickness: 1.h,
                height: 40.h,
              ),
              _label("Points Awarded to:"),
              _awardedToTile(),
              _awardedToTile(),
              _awardedToTile(),
              _awardedToTile(),
            ],
          ))
        ],
      )),
    );
  }

  _awardedByTile() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 45.h,
            width: 45.h,
            decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(25.h)),
            child: Image.asset(
              "assets/images/JA.png",
              width: 45.h,
              height: 45.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.topLeft,
                child: Text(
                  "Jacob Atkinson",
                  style: TextStyle(
                      fontSize: 14.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF15294B)),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.topLeft,
                child: Text(
                  "Team Member - 345768 Harrisburg",
                  style: TextStyle(
                      fontSize: 11.fs,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF505F79)),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.topLeft,
                child: Text(
                  "13 mins ago",
                  style: TextStyle(
                      fontSize: 11.fs,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF505F79)),
                ),
              ),
            ],
          )),
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 30.h,
            width: 80.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(15.h)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  BadgeType.legend.icon(),
                  width: 20.h,
                  height: 20.h,
                  colorFilter: const ColorFilter.mode(
                      Color(0xFF990060), BlendMode.srcIn),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${BadgeType.legend.point()}P",
                      style: TextStyle(
                          fontSize: 14.fs,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF15294B)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _awardedToTile() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 45.h,
            width: 45.h,
            decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(25.h)),
            child: Image.asset(
              "assets/images/JA.png",
              width: 45.h,
              height: 45.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.topLeft,
                child: Text(
                  "Jacob Atkinson",
                  style: TextStyle(
                      fontSize: 14.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF15294B)),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.topLeft,
                child: Text(
                  "Team Member - 345768 Harrisburg",
                  style: TextStyle(
                      fontSize: 11.fs,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF505F79)),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  _label(String name) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 14.fs,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF80005D)),
      ),
    );
  }
}
