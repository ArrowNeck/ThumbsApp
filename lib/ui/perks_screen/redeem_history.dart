import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/shared_widgets/common_widget.dart';

class RedeemHistory extends StatefulWidget {
  const RedeemHistory({super.key});

  @override
  State<RedeemHistory> createState() => _RedeemHistoryState();
}

class _RedeemHistoryState extends State<RedeemHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonWidgets.commonAppBar(title: "Redeem History", context: context),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildTile("Apple iTunes", 1),
          _buildTile("Best Buy", 6),
          _buildTile("DoorDash", 3),
        ],
      )),
    );
  }

  _buildTile(String title, int no) {
    return Container(
      height: 70.h,
      width: 430.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      // color: Colors.blue,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.h),
            child: Image.asset(
              "assets/images/gift/Image$no.png",
              height: 50.h,
              width: 50.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.fs,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF15294B)),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "April 01, 2023 at 02:22 PM",
                    style: TextStyle(
                        fontSize: 12.fs,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7A8699)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Text(
                  "\$25",
                  style: TextStyle(
                      fontSize: 18.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF3FAE36)),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Text(
                  "-1500P",
                  style: TextStyle(
                      fontSize: 12.fs,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFB3005E)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
