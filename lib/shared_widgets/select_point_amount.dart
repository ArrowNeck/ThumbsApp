import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/enums/badge_type.dart';

class SelectPonitAmount extends StatefulWidget {
  final BadgeType? currentBadge;
  const SelectPonitAmount({super.key, this.currentBadge});

  @override
  State<SelectPonitAmount> createState() => _SelectPonitAmountState();
}

class _SelectPonitAmountState extends State<SelectPonitAmount> {
  List<BadgeType> badges = [
    BadgeType.kudos,
    BadgeType.rockstar,
    BadgeType.epic,
    BadgeType.legend
  ];
  BadgeType? badge;
  int availablePonits = 780;
  @override
  void initState() {
    badge = widget.currentBadge;
    super.initState();
  }

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
              onTap: () => Navigator.pop(context, badge),
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
            padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select Point Amount",
                  style: TextStyle(
                      fontSize: 18.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF15294B)),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context, badge),
                  child: Container(
                    width: 30.h,
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.h),
                        color: const Color(0xFFF5F6F7)),
                    child: Icon(Icons.close_rounded,
                        color: const Color(0xFF505F79), size: 25.h),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 40.h,
            width: 400.w,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
                color: const Color(0xFFF5F6F7),
                borderRadius: BorderRadius.circular(10.h)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Available Points for the day",
                  style: TextStyle(
                      fontSize: 13.fs,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF15294B)),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                  child: Text(
                    availablePonits.toString(),
                    style: TextStyle(
                        fontSize: 15.fs,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFB3005E)),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              child: GridView.count(
            padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 10.h),
            crossAxisCount: 2,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.w,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1.9,
            children: [
              ...badges.map(
                (item) => GestureDetector(
                  onTap: () {
                    if (availablePonits >= item.point()) {
                      setState(() {
                        badge = item;
                      });
                    }
                  },
                  child: Container(
                    width: 190.w,
                    height: 100.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                    decoration: BoxDecoration(
                        color: (availablePonits < item.point())
                            ? const Color(0xFFDFE2E6)
                            : badge == item
                                ? const Color(0xFFFFEBEE) //
                                : Colors.white,
                        border: Border.all(
                            color: (badge == item)
                                ? const Color(0xFFB3005E)
                                : const Color(0xFFDFE2E6)),
                        borderRadius: BorderRadius.circular(10.h)),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          item.icon(),
                          width: 30.h,
                          height: 30.h,
                          colorFilter: ColorFilter.mode(
                              (badge == item)
                                  ? const Color(0xFFB3005E)
                                  : const Color(0xFF7A8699),
                              BlendMode.srcIn),
                        ),
                        const Spacer(),
                        Text(
                          "${item.point()}P",
                          style: TextStyle(
                              fontSize: 20.fs,
                              fontWeight: FontWeight.w700,
                              color: (availablePonits < item.point())
                                  ? const Color(0xFF7A8699)
                                  : const Color(0xFF15294B)),
                        ),
                        Text(
                          item.name(),
                          style: TextStyle(
                              fontSize: 15.fs,
                              fontWeight: FontWeight.w700,
                              color: (availablePonits < item.point())
                                  ? const Color(0xFF7A8699)
                                  : const Color(0xFF505F79)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      )),
    );
  }
}
