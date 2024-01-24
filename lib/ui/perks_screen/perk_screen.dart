import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/models/gift_card_item.dart';
import 'package:thumbs_app/shared_widgets/redeem_gift_card_bottom_sheet.dart';
import 'package:thumbs_app/ui/perks_screen/redeem_history.dart';

class PerksScreen extends StatefulWidget {
  const PerksScreen({super.key});

  @override
  State<PerksScreen> createState() => _PerksScreenState();
}

class _PerksScreenState extends State<PerksScreen> {
  late PageController _pageController;
  List<String> perkTab = ["Gift Cards", "Pay & Leave Perks"];
  List<GiftCard> giftCardItems = [];
  int selectedTab = 0;
  int pointsBalance = 2800;

  @override
  initState() {
    _pageController = PageController(initialPage: 0);

    giftCardItems = [
      GiftCard(
          name: "iTunes",
          price: 25,
          pValue: 1800,
          imagePath: "assets/images/gift/Image1.png"),
      GiftCard(
          name: "Wallmart",
          price: 50,
          pValue: 1800,
          imagePath: "assets/images/gift/Image2.png"),
      GiftCard(
          name: "Door Dash",
          price: 25,
          pValue: 1800,
          imagePath: "assets/images/gift/Image3.png"),
      GiftCard(
          name: "Uber Eats",
          price: 25,
          pValue: 1800,
          imagePath: "assets/images/gift/Image4.png"),
      GiftCard(
          name: "The Home Depot",
          price: 25,
          pValue: 1800,
          imagePath: "assets/images/gift/Image5.png"),
      GiftCard(
          name: "Best Buy",
          price: 25,
          pValue: 1800,
          imagePath: "assets/images/gift/Image6.png"),
      GiftCard(
          name: "Ikea",
          price: 25,
          pValue: 1800,
          imagePath: "assets/images/gift/Image7.png"),
      GiftCard(
          name: "Playstation",
          price: 25,
          pValue: 1800,
          imagePath: "assets/images/gift/Image8.png"),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEDF0),
      body: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Container(
            color: Colors.white,
            width: 430.w,
            height: 40.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Points Balance",
                      style: TextStyle(
                          fontSize: 14.fs,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF80005D)),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      pointsBalance.toString(),
                      style: TextStyle(
                          fontSize: 15.fs,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF80005D)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            width: 430.w,
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Perks",
                    style: TextStyle(
                        fontSize: 18.fs,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RedeemHistory()));
                  },
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.h)),
                    child: SvgPicture.asset(
                      "assets/icons/history.svg",
                      width: 20.h,
                      height: 20.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            width: 430.w,
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: perkTab.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(index);
                    setState(() {
                      selectedTab = index;
                    });
                  },
                  child: Container(
                    height: 40.h,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                        color: selectedTab == index
                            ? const Color(0xFFB3005E)
                            : Colors.white,
                        border: Border.all(
                            width: 1.w,
                            color: selectedTab == index
                                ? const Color(0xFFB3005E)
                                : const Color(0xFFDFE2E6)),
                        borderRadius: BorderRadius.circular(20.h)),
                    child: Text(
                      perkTab[index],
                      style: TextStyle(
                          fontSize: 14.fs,
                          fontWeight: FontWeight.w400,
                          color: selectedTab == index
                              ? Colors.white
                              : const Color(0xFF7A8699)),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(
            color: const Color(0xFFDFE2E6),
            thickness: 2.h,
          ),
          Expanded(
              child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [_buildGiftCard(), _buildPayAndLeavePerks()],
          )),
        ],
      ),
    );
  }

  _buildGiftCard() {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: giftCardItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.w),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isDismissible: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => RedeemGiftCardBottomSheet(
                          giftCard: giftCardItems[index],
                          pointsBalance: pointsBalance,
                        ));
              },
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.h),
                          child: Image.asset(
                            giftCardItems[index].imagePath,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      SizedBox(
                        width: 174.w,
                        height: 65.h,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        // alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFFEBEE),
                                            borderRadius:
                                                BorderRadius.circular(15.h)),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${giftCardItems[index].pValue}P",
                                            style: TextStyle(
                                                fontSize: 15.fs,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xFFB3005E)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        giftCardItems[index].name,
                                        style: TextStyle(
                                            fontSize: 15.fs,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF505F79)),
                                      ),
                                    )
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "\$${giftCardItems[index].price}",
                                      style: TextStyle(
                                          fontSize: 20.fs,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF15294B)),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          );
        });
  }

  _buildPayAndLeavePerks() {
    return Column(children: [
      SizedBox(
        height: 20.h,
      ),
      SvgPicture.asset(
        "assets/icons/noperks.svg",
        width: 80.h,
        height: 80.h,
      ),
      SizedBox(
        height: 15.h,
      ),
      Text(
        "No Perks Found",
        style: TextStyle(
            fontSize: 14.fs,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF505F79)),
      ),
      SizedBox(
        height: 3.h,
      ),
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Text(
          "We couldn't find any Pay & Leave perks at the moment.",
          style: TextStyle(
              fontSize: 12.fs,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF7A8699)),
        ),
      ),
    ]);
  }
}
