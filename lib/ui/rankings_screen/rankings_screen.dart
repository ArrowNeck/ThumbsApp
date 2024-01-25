import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/enums/badge_type.dart';
import 'package:thumbs_app/shared_widgets/ranking_filter_bottom_sheet.dart';

class RankingsScreen extends StatefulWidget {
  const RankingsScreen({super.key});

  @override
  State<RankingsScreen> createState() => _RankingsScreenState();
}

class _RankingsScreenState extends State<RankingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFE2E6),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
            child: SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Text(
                      "Rankings",
                      style: TextStyle(
                          fontSize: 22.fs,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF15294B)),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isDismissible: true,
                          context: context,
                          builder: (context) => const RankingFilter());
                    },
                    child: Container(
                      height: 40.h,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFDFE2E6)),
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "All Store",
                              style: TextStyle(
                                  fontSize: 14.fs,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFB3005E)),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded,
                              color: const Color(0xFFB3005E), size: 20.h)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSmallHeaderLayout(
                    2, "James\nTallman", "118,230P", BadgeType.platinum),
                _buildFirstRankLayout(),
                _buildSmallHeaderLayout(
                    3, "Rochelle\nFreeman", "90,220P", BadgeType.gold),
              ],
            ),
          ),
          _buildBottomRankingsView()
        ],
      )),
    );
  }

  _buildFirstRankLayout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildRankLabel(1),
            Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: SvgPicture.asset(
                "assets/icons/trophy.svg",
                width: 30.h,
                height: 30.h,
                colorFilter:
                    ColorFilter.mode(Colors.amber[600]!, BlendMode.srcIn),
                fit: BoxFit.fill,
              ),
            ),
            _buildHeaderImageFrameLayout(
                imageFrameSize: 110.h,
                badgeFrameSize: 35.h,
                badgeType: BadgeType.platinum,
                isFirst: true),
            _buildHeaderPersonName("Cameroon\nJacob"),
            _buildHeaderPointsView("128,000P")
          ]),
    );
  }

  _buildHeaderImageFrameLayout(
      {required double imageFrameSize,
      required double badgeFrameSize,
      required BadgeType badgeType,
      bool isFirst = false}) {
    return Stack(
      children: [
        Container(
          height: imageFrameSize,
          width: imageFrameSize,
          decoration: BoxDecoration(
            color: Colors.white70,
            shape: BoxShape.circle,
            border: Border.all(
                color: isFirst ? const Color(0xFFFFCD19) : Colors.white,
                width: 4.h),
            boxShadow: [
              BoxShadow(
                color: (isFirst
                        ? const Color(0xFFFFCD19)
                        : const Color(0xFF444444))
                    .withOpacity(0.36),
                spreadRadius: 0,
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(imageFrameSize - 4.h),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: badgeFrameSize,
            width: badgeFrameSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: badgeType.color(), width: 2.h),
            ),
            child: SvgPicture.asset(
              "assets/icons/${badgeType.icon()}",
              width: badgeFrameSize - 12.h,
              height: badgeFrameSize - 12.h,
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }

  _buildSmallHeaderLayout(
      int rank, String name, String points, BadgeType badgeType) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildRankLabel(rank),
          _buildHeaderImageFrameLayout(
              imageFrameSize: 75.h, badgeFrameSize: 30.h, badgeType: badgeType),
          _buildHeaderPersonName(name),
          _buildHeaderPointsView(points)
        ]);
  }

  _buildRankLabel(int rank) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        rank.toString(),
        style: TextStyle(
            fontSize: 20.fs,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF15294B)),
      ),
    );
  }

  _buildHeaderPointsView(String points) {
    return Container(
      height: 25.h,
      width: 70.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.5.h)),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Text(
          points,
          style: TextStyle(
              fontSize: 12.fs,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFB3005E)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _buildHeaderPersonName(String name) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
              fontSize: 12.fs,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF15294B)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _buildBottomRankingsView() => Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 22.5.h),
                padding: EdgeInsets.only(top: 32.5.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.h),
                      topRight: Radius.circular(15.h),
                    )),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  itemCount: 7,
                  itemBuilder: (ctx, index) {
                    return _buildRankingTile(index + 4);
                  },
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 45.h,
                  width: 250.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFAFBFB),
                      border: Border.all(
                        color: const Color(0xFFDFE2E6),
                      ),
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your Ranking",
                            style: TextStyle(
                                fontSize: 12.fs,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF505F79)),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerRight,
                          child: Text(
                            "#98",
                            style: TextStyle(
                                fontSize: 15.fs,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF15294B)),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 25.h,
                          width: 60.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 0.h),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFEBEE),
                              borderRadius: BorderRadius.circular(12.5.h)),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                            child: Text(
                              "2,800P",
                              style: TextStyle(
                                  fontSize: 12.fs,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFB3005E)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  _buildRankingTile(int rank) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      padding: EdgeInsets.symmetric(vertical: 5.h),
      height: 55.h,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Text(
              "$rank.",
              style: TextStyle(
                  fontSize: 20.fs,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF15294B)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            height: 40.h,
            width: 40.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.h),
              child: Image.asset(
                "assets/images/KW.png",
                width: 40.h,
                height: 40.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bessie Cooper",
                    style: TextStyle(
                        fontSize: 14.fs,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF15294B)),
                    textAlign: TextAlign.left,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Team Member - 345768 Harrisburg",
                    style: TextStyle(
                        fontSize: 12.fs,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF505F79)),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 25.h,
            width: 60.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
            decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(12.5.h)),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                "90,220P",
                style: TextStyle(
                    fontSize: 12.fs,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFB3005E)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
