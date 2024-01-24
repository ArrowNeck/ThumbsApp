import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/app_colors.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/ui/base_navibar/base_navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const BaseNavbar()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/thumbs_app_logo.png",
            height: 140.h,
            width: 140.h,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 430.w,
            height: 5.h,
          ),
          Text(
            "ThumbsApp",
            style: TextStyle(
                fontFamily: "Rowdies",
                fontSize: 32.fs,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
