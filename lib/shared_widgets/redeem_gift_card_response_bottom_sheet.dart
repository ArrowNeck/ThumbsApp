import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/models/gift_card_item.dart';
import 'package:thumbs_app/ui/perks_screen/redeem_history.dart';

class RedeemGiftCardResponseBottomSheet extends StatefulWidget {
  final GiftCard giftCard;
  final int count;
  const RedeemGiftCardResponseBottomSheet(
      {super.key, required this.giftCard, required this.count});

  @override
  State<RedeemGiftCardResponseBottomSheet> createState() =>
      _RedeemGiftCardResponseBottomSheetState();
}

class _RedeemGiftCardResponseBottomSheetState
    extends State<RedeemGiftCardResponseBottomSheet> {
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
          SizedBox(
            height: 10.h,
          ),
          SvgPicture.asset(
            "assets/icons/success.svg",
            width: 80.h,
            height: 80.h,
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            "Gift card Redeemed!",
            style: TextStyle(
                fontSize: 14.fs,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF15294B)),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              "You have successfully redeemed \$${widget.giftCard.price * widget.count} ${widget.giftCard.name} gift cards. One of our managers will hand over the gift card to you within 2 days.",
              style: TextStyle(
                  fontSize: 12.fs,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7A8699),
                  height: 1.4.h),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              "You can see your redeemed gifts by touching below button.",
              style: TextStyle(
                  fontSize: 12.fs,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7A8699)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RedeemHistory()));
            },
            child: Container(
              height: 50.h,
              width: 400.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFDFE2E6)),
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: Text(
                "View Your Redeem History",
                style: TextStyle(
                    fontSize: 15.fs,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFB3005E)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      )),
    );
  }
}
