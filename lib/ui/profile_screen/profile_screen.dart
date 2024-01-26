import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/shared_widgets/common_widget.dart';
import 'package:thumbs_app/shared_widgets/gradient_progress_bar.dart';
import 'package:thumbs_app/ui/profile_screen/edit_profile_screen.dart';
import 'package:thumbs_app/ui/profile_screen/setting_screen.dart';
import 'package:thumbs_app/ui/profile_screen/your_points.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.commonAppBar(title: "My Profile", context: context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
              width: 430.w,
            ),
            SizedBox(
              height: 150.h,
              width: 150.h,
              child: Stack(
                children: [
                  Container(
                    height: 150.h,
                    width: 150.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF444444).withOpacity(0.36),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      border: Border.all(color: Colors.white, width: 5.h),
                    ),
                    child: Image.asset(
                      "assets/images/KW.png",
                      fit: BoxFit.fill,
                      width: 150.h,
                      height: 150.h,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const EditProfile()));
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFFB3005E),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.edit_outlined,
                            color: Colors.white, size: 30.h),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Jerold Ramsbottom",
              style: TextStyle(
                  fontSize: 18.fs,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF15294B)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Crew Member - 345768 Lipton Seat",
              style: TextStyle(
                  fontSize: 14.fs,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF505F79)),
            ),
            SizedBox(
              height: 20.h,
              width: 430.w,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.h),
                border: Border.all(color: const Color(0xFFDFE2E6)),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  "View Profile",
                  style: TextStyle(
                      fontSize: 14.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFB3005E)),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const YourPointsScreen()));
              },
              child: Container(
                width: 400.w,
                // height: 110.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(8.h)),
                child: Row(
                  children: [
                    Container(
                      width: 70.h,
                      height: 70.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFAFBFB),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.h)),
                      child: SvgPicture.asset(
                        "assets/icons/badge_silver.svg",
                        width: 40.h,
                        height: 40.h,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.transparent,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "SILVER".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 16.fs,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF505F79)),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: const Color(0xFF505F79),
                                  size: 16.h,
                                ),
                                const Spacer(),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "7401",
                                    style: TextStyle(
                                        fontSize: 25.fs,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF000000)),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Redeemable \nPoints",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 12.fs,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF6F6F6F)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            const GradientProgressBar(
                                percent: 50,
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFD13477),
                                      Color(0xFF80005D)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                backgroundColor: Colors.white),
                            SizedBox(
                              height: 8.h,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Earn 2348 points to reach Gold",
                                style: TextStyle(
                                    fontSize: 12.fs,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF7A8699)),
                              ),
                            ),
                          ]),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: 400.w,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F7),
                  borderRadius: BorderRadius.circular(8.h)),
              child: Column(children: [
                _buildTile("Settings", "assets/icons/cog.svg", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SettingScreen()));
                }),
                Divider(
                  color: const Color(0xFFDFE2E6),
                  thickness: 1.h,
                ),
                _buildTile("Points History", "assets/icons/star.svg", () {}),
                Divider(
                  color: const Color(0xFFDFE2E6),
                  thickness: 1.h,
                ),
                _buildTile("Points Availability & History",
                    "assets/icons/star.svg", () {}),
              ]),
            )
          ],
        ),
      ),
    );
  }

  _buildTile(String title, String icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          children: [
            Container(
              height: 35.h,
              width: 35.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: SvgPicture.asset(
                icon,
                width: 20.h,
                height: 20.h,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 15.fs,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF15294B)),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: const Color(0xFF7A8699),
              size: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
