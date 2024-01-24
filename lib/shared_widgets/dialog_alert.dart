import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';

class DialogAlert extends StatelessWidget {
  final String title;
  final String description;
  const DialogAlert(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.h),
          width: 350.w,
          height: 200.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.h)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.fs,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF272724)),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  description,
                  style: TextStyle(
                      fontSize: 15.fs,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF747474)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 15.fs,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF3D3D3C)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontSize: 15.fs,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB3005E)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
