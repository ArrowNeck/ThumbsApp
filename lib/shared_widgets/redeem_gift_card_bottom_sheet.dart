import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/models/gift_card_item.dart';
import 'package:thumbs_app/shared_widgets/redeem_gift_card_response_bottom_sheet.dart';

class RedeemGiftCardBottomSheet extends StatefulWidget {
  final GiftCard giftCard;
  final int pointsBalance;
  const RedeemGiftCardBottomSheet(
      {super.key, required this.giftCard, required this.pointsBalance});

  @override
  State<RedeemGiftCardBottomSheet> createState() =>
      _RedeemGiftCardBottomSheetState();
}

class _RedeemGiftCardBottomSheetState extends State<RedeemGiftCardBottomSheet> {
  int count = 0;
  int currentPointsBalance = 0;

  @override
  void initState() {
    currentPointsBalance = widget.pointsBalance;
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
              onTap: () => Navigator.pop(context),
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
            padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Redeem Gift Card",
                  style: TextStyle(
                      fontSize: 18.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF15294B)),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(12.h),
            child: Image.asset(
              widget.giftCard.imagePath,
              height: 200.h,
              width: 400.w,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 8.h,
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
                  "Points Balance",
                  style: TextStyle(
                      fontSize: 13.fs,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF15294B)),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                  child: Text(
                    currentPointsBalance.toString(),
                    style: TextStyle(
                        fontSize: 15.fs,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFB3005E)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 100.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPlusMinusBottons(
                  type: 0,
                  isEnable: (count > 0),
                  onTap: () {
                    if (count > 0) {
                      setState(() {
                        count--;
                        currentPointsBalance += widget.giftCard.pValue;
                      });
                    }
                  },
                ),
                Text(
                  count.toString(),
                  style: TextStyle(
                      fontSize: 15.fs,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000)),
                ),
                _buildPlusMinusBottons(
                  type: 1,
                  isEnable: (currentPointsBalance >=
                      (widget.giftCard.pValue * (count + 1))),
                  onTap: () {
                    if (currentPointsBalance >=
                        (widget.giftCard.pValue * (count + 1))) {
                      setState(() {
                        count++;
                        currentPointsBalance -= widget.giftCard.pValue;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 10.h),
            child: GestureDetector(
              onTap: () {
                if (count > 0) {
                  Navigator.pop(context);
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isDismissible: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => RedeemGiftCardResponseBottomSheet(
                            giftCard: widget.giftCard,
                            count: count,
                          ));
                }
              },
              child: Container(
                height: 50.h,
                width: 400.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: (count > 0)
                      ? const Color(0xFFB3005E)
                      : const Color(0xFFDFE2E6),
                  borderRadius: BorderRadius.circular(8.h),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Purchase Gift Card",
                        style: TextStyle(
                            fontSize: 14.fs,
                            fontWeight: FontWeight.w700,
                            color: (count > 0)
                                ? Colors.white
                                : const Color(0xFF7A8699)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (count > 0)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "\$${count * widget.giftCard.price}",
                          style: TextStyle(
                              fontSize: 14.fs,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF90D08A)),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  _buildPlusMinusBottons(
      {required int type,
      required bool isEnable,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: 60.w,
        decoration: BoxDecoration(
            color: isEnable ? Colors.white : const Color(0xFFDFE2E6),
            borderRadius: BorderRadius.circular(8.h),
            border: Border.all(color: const Color(0xFFDFE2E6))),
        child: Icon(type == 1 ? Icons.add : Icons.remove,
            color: isEnable ? const Color(0xFFB3005E) : const Color(0xFF7A8699),
            size: 25.h),
      ),
    );
  }
}
