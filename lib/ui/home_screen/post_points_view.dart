import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/enums/badge_type.dart';
import 'package:thumbs_app/shared_widgets/post_point_awared_bottom_sheet.dart';

class PostPointsView extends StatelessWidget {
  const PostPointsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isDismissible: true,
            isScrollControlled: true,
            context: context,
            builder: (context) => const PostPointAwaredBottomSheet());
      },
      child: Container(
        // height: 125.h,
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        padding: EdgeInsets.fromLTRB(10.w, 12.5.h, 10.w, 12.5.h),
        decoration: BoxDecoration(
            color: const Color(0xFFFAFBFB),
            border: Border.all(width: 2.w, color: const Color(0xFFF5F6F7)),
            borderRadius: BorderRadius.circular(8.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 35.h,
                      width: 120.w,
                      padding: EdgeInsets.all(2.5.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFDFE2E6),
                          borderRadius: BorderRadius.circular(20.w)),
                      child: Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(15.h)),
                            child: Image.asset(
                              "assets/images/PM.png",
                              width: 30.h,
                              height: 30.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            "assets/icons/p_star.svg",
                            width: 20.h,
                            height: 20.h,
                          ),
                          const Spacer(),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerRight,
                            child: Text(
                              "100P",
                              style: TextStyle(
                                  fontSize: 14.fs,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF15294B)),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  BadgeType.kudos.logo(),
                  width: 100.h,
                  height: 100.h,
                  fit: BoxFit.fill,
                  alignment: Alignment.centerRight,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
