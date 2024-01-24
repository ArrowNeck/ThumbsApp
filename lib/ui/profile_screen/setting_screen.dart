import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/shared_widgets/common_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.commonAppBar(title: "Settings", context: context),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
        child: Column(
          children: [
            _buildHeaderTile("Notification Settings", "assets/icons/cog.svg"),
            SizedBox(
              height: 12.h,
            ),
            Container(
              width: 400.w,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F7),
                  borderRadius: BorderRadius.circular(8.h)),
              child: Column(children: [
                _buildTile("Points receive by someone"),
                Divider(
                  color: const Color(0xFFDFE2E6),
                  thickness: 1.h,
                ),
                _buildTile("Someone tag you in a post"),
                Divider(
                  color: const Color(0xFFDFE2E6),
                  thickness: 1.h,
                ),
                _buildTile("Someone tag you in a comment"),
                Divider(
                  color: const Color(0xFFDFE2E6),
                  thickness: 1.h,
                ),
                _buildTile("Someone like your post"),
                Divider(
                  color: const Color(0xFFDFE2E6),
                  thickness: 1.h,
                ),
                _buildTile("Someone comment on your post"),
              ]),
            ),
            SizedBox(
              height: 40.h,
            ),
            _buildHeaderTile(
                "Security Settings", "assets/icons/lock_keyhole.svg"),
            SizedBox(
              height: 12.h,
            ),
            Container(
              width: 400.w,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F7),
                  borderRadius: BorderRadius.circular(8.h)),
              child: Column(children: [
                _buildTile("Change Password", onTap: () {}),
                Divider(
                  color: const Color(0xFFDFE2E6),
                  thickness: 1.h,
                ),
                _buildTile("Use biometrics to sign in"),
              ]),
            ),
          ],
        ),
      )),
    );
  }

  _buildTile(String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 35.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            onTap == null
                ? Transform.scale(
                    scale: .6,
                    alignment: Alignment.centerRight,
                    child: CupertinoSwitch(
                        value: true, onChanged: (bool? value) {}),
                  )
                : Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: const Color(0xFF7A8699),
                    size: 15.h,
                  ),
          ],
        ),
      ),
    );
  }

  _buildHeaderTile(String title, String icon) {
    return Row(
      children: [
        Container(
          height: 35.h,
          width: 35.h,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFFFFEBEE)),
          child: SvgPicture.asset(
            icon,
            width: 20.h,
            height: 20.h,
            colorFilter:
                const ColorFilter.mode(Color(0xFFB3005E), BlendMode.srcIn),
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
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF000000)),
            ),
          ),
        ),
      ],
    );
  }
}
