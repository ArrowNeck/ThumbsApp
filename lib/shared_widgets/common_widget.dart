import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';

class CommonWidgets {
  static AppBar commonAppBar(
      {required String title, required BuildContext context}) {
    return AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Center(
            child: Container(
              width: 30.h,
              height: 30.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.h),
                  color: const Color(0xFFF5F6F7)),
              child: Icon(Icons.arrow_back_rounded,
                  color: const Color(0xFF505F79), size: 25.h),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 15.fs,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF15294B)),
        ),
        toolbarHeight: 60.h,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Divider(
            color: const Color(0xFFDFE2E6),
            thickness: 1.h,
          ),
        ));
  }
}
