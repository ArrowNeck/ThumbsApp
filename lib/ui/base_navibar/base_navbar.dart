import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/app_colors.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/shared_widgets/apps_switch_bottom_sheet.dart';
import 'package:thumbs_app/shared_widgets/create_post_bottom_sheet.dart';
import 'package:thumbs_app/ui/home_screen/home_screen.dart';
import 'package:thumbs_app/ui/perks_screen/perk_screen.dart';
import 'package:thumbs_app/ui/profile_screen/profile_screen.dart';
import 'package:thumbs_app/ui/rankings_screen/rankings_screen.dart';

class BaseNavbar extends StatefulWidget {
  const BaseNavbar({super.key});

  @override
  State<BaseNavbar> createState() => _BaseNavbarState();
}

class _BaseNavbarState extends State<BaseNavbar> {
  int selectedIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
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
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70.h,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              flex: 3,
              child: RichText(
                text: TextSpan(
                    text: "Thumbs",
                    style: TextStyle(
                        fontFamily: "Rowdies",
                        fontSize: 28.fs,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text: "App",
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontSize: 28.fs,
                            color: const Color(0xFF505F79),
                            fontWeight: FontWeight.w700),
                      )
                    ]),
              ),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ProfileScreen()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.h),
                        child: Image.asset(
                          "assets/images/profile.png",
                          width: 50.h,
                          height: 50.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF5F6F7),
                              borderRadius: BorderRadius.circular(25.h)),
                          height: 50.h,
                          width: 50.h,
                          child: SvgPicture.asset(
                            "assets/icons/notification_icon.svg",
                            width: 25.h,
                            height: 25.h,
                          ),
                        ),
                        Positioned(
                          right: 5.w,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF9472F),
                                borderRadius: BorderRadius.circular(6.25.h)),
                            height: 12.5.h,
                            width: 12.5.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [HomeScreen(), PerksScreen(), RankingsScreen()],
        ),
      ),
      bottomNavigationBar: _bottomNavbar(),
    );
  }

  _bottomNavbar() {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.h),
              topRight: Radius.circular(16.h),
            )),
        child: SafeArea(
          child: Container(
            height: 85.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.h),
                  topRight: Radius.circular(16.h),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navbarItem("Home", 0),
                _navbarItem("Perks", 1),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isDismissible: true,
                        context: context,
                        builder: (context) => const CreatePostBottomSheet());
                    // Navigator.push(
                    //     context,
                    //     HeroDialogRoute(
                    //         builder: (_) => const DialogAlert(
                    //               title: "Delete Favourite List?",
                    //               description:
                    //                   "All the products in this list will be also removed.",
                    //             )));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => const RedeemHistory()));
                  },
                  child: Container(
                    width: 68.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      gradient: const LinearGradient(
                        colors: [AppColors.primaryColor, Color(0xFF80005D)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(20.h),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 35.h,
                    ),
                  ),
                ),
                _navbarItem("Rankings", 2),
                _navbarItem("Apps", 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navbarItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        if (index != 3) {
          setState(() {
            selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        } else {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isDismissible: true,
              context: context,
              builder: (context) => const AppsSwitchBottomSheet());
        }
      },
      child: Container(
        color: Colors.white,
        width: 82.5.w,
        // height: 50.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/${title.toLowerCase()}${selectedIndex == index ? "_icon_active" : "_icon_deactive"}.svg",
              width: 27.5.fs,
              height: 27.5.fs,
              fit: BoxFit.fill,
              alignment: Alignment.center,
              colorFilter: ColorFilter.mode(
                  (selectedIndex == index
                      ? AppColors.primaryColor
                      : AppColors.iconDeactive),
                  BlendMode.srcIn),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 14.fs,
                    fontWeight: FontWeight.w500,
                    color: (selectedIndex == index
                        ? AppColors.primaryColor
                        : AppColors.iconDeactive)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
