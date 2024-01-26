import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/shared_widgets/common_widget.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonWidgets.commonAppBar(title: "Notifications", context: context),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBtn("Mark All as Read"),
                _buildBtn("Clear All"),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return _buildNotificationTile(
                  index > 1, index / 2 == 0, index == 3);
            },
          ))
        ],
      )),
    );
  }

  _buildNotificationTile(bool isRead, bool isAction, bool isLevelReach) {
    return Container(
      // height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      color: isRead ? Colors.transparent : const Color(0xFFFFEBEE),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Container(
              height: 40.h,
              width: 40.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFEBEDF0)),
              child: !isLevelReach
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20.h),
                      child: Image.asset(
                        "assets/images/PM.png",
                        width: 40.h,
                        height: 40.h,
                        fit: BoxFit.fill,
                      ),
                    )
                  : SvgPicture.asset("assets/icons/trophy.svg",
                      width: 20.h, height: 20.h, fit: BoxFit.fill),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lex Murphy tagged you in a new post with 2 others",
                style: TextStyle(
                    fontSize: 14.fs,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF15294B)),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(
                  "Today at 9:42 AM",
                  style: TextStyle(
                      fontSize: 12.fs,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF7A8699)),
                  textAlign: TextAlign.left,
                ),
              ),
              if (isAction)
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Container(
                        height: 35.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB3005E),
                          borderRadius: BorderRadius.circular(6.h),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                          child: Text(
                            "Approve",
                            style: TextStyle(
                                fontSize: 14.fs,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFFFFFF)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        height: 35.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          border: Border.all(
                            color: const Color(0xFFDDDEE1),
                          ),
                          borderRadius: BorderRadius.circular(6.h),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                          child: Text(
                            "Decline",
                            style: TextStyle(
                                fontSize: 14.fs,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF3C4257)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: SizedBox(
                height: 40.h,
                width: 40.h,
                child: Icon(
                  Icons.more_horiz_rounded,
                  color: const Color(0xFF15294B),
                  size: 25.h,
                )),
          ),
        ],
      ),
    );
  }

  _buildBtn(String title) {
    return Container(
      height: 40.h,
      width: 195.w,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDFE2E6)),
          borderRadius: BorderRadius.circular(8.h)),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14.fs,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFB3005E)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
