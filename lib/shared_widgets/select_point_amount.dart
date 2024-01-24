import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/models/select_point_amount_model.dart';

class SelectPonitAmount extends StatefulWidget {
  final int? currentSelectionId;
  const SelectPonitAmount({super.key, this.currentSelectionId});

  @override
  State<SelectPonitAmount> createState() => _SelectPonitAmountState();
}

class _SelectPonitAmountState extends State<SelectPonitAmount> {
  List<SelectPointAmountModel> pointAmounts = [];
  late int selectedId;
  int availablePonits = 780;
  @override
  void initState() {
    selectedId = widget.currentSelectionId ?? 0;
    pointAmounts = [
      SelectPointAmountModel(
          id: 1,
          name: "Kudos",
          value: 100,
          icon: "assets/icons/party_popper.svg",
          colors: const LinearGradient(
              colors: [Color(0xFF3FAE36), Color(0xFF2C7A26)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      SelectPointAmountModel(
          id: 2,
          name: "Rockstar",
          value: 200,
          icon: "assets/icons/hand_metal.svg",
          colors: const LinearGradient(
              colors: [Color(0xFFF9472F), Color(0xFFAE3221)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      SelectPointAmountModel(
          id: 3,
          name: "Epic",
          value: 500,
          icon: "assets/icons/trophy.svg",
          colors: const LinearGradient(
              colors: [Color(0xFFFEC219), Color(0xFF8A712A)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      SelectPointAmountModel(
          id: 4,
          name: "Legend",
          value: 1000,
          icon: "assets/icons/rocket.svg",
          colors: const LinearGradient(
              colors: [Color(0xFF7A8699), Color(0xFF15294B)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    ];
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
              onTap: () => Navigator.pop(context, pointAmounts[--selectedId]),
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
                  onTap: () =>
                      Navigator.pop(context, pointAmounts[--selectedId]),
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
              ...pointAmounts.map(
                (point) => GestureDetector(
                  onTap: () {
                    if (availablePonits >= point.value) {
                      setState(() {
                        selectedId = point.id;
                      });
                    }
                  },
                  child: Container(
                    width: 190.w,
                    height: 100.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                    decoration: BoxDecoration(
                        color: (availablePonits < point.value)
                            ? const Color(0xFFDFE2E6)
                            : selectedId == point.id
                                ? const Color(0xFFFFEBEE) //
                                : Colors.white,
                        border: Border.all(
                            color: (selectedId == point.id)
                                ? const Color(0xFFB3005E)
                                : const Color(0xFFDFE2E6)),
                        borderRadius: BorderRadius.circular(10.h)),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          point.icon,
                          width: 30.h,
                          height: 30.h,
                          colorFilter: ColorFilter.mode(
                              (selectedId == point.id)
                                  ? const Color(0xFFB3005E)
                                  : const Color(0xFF7A8699),
                              BlendMode.srcIn),
                        ),
                        const Spacer(),
                        Text(
                          "${point.value}P",
                          style: TextStyle(
                              fontSize: 20.fs,
                              fontWeight: FontWeight.w700,
                              color: (availablePonits < point.value)
                                  ? const Color(0xFF7A8699)
                                  : const Color(0xFF15294B)),
                        ),
                        Text(
                          point.name,
                          style: TextStyle(
                              fontSize: 15.fs,
                              fontWeight: FontWeight.w700,
                              color: (availablePonits < point.value)
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
