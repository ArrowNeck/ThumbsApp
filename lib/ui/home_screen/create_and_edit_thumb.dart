import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/enums/badge_type.dart';
import 'package:thumbs_app/main.dart';
import 'package:thumbs_app/models/employee_model.dart';
import 'package:thumbs_app/models/post_privacy_model.dart';
import 'package:thumbs_app/models/tag_model.dart';
import 'package:thumbs_app/shared_widgets/post_privacy.dart';
import 'package:thumbs_app/shared_widgets/select_employee_bottom_sheet.dart';
import 'package:thumbs_app/shared_widgets/select_point_amount.dart';
import 'package:thumbs_app/utils/max_char_input_formater.dart';
import 'package:thumbs_app/utils/toast_message.dart';

class CreateAndEditThumb extends StatefulWidget {
  const CreateAndEditThumb({super.key});

  @override
  State<CreateAndEditThumb> createState() => _CreateAndEditThumbState();
}

class _CreateAndEditThumbState extends State<CreateAndEditThumb> {
  List<TagModel> tags = [
    TagModel(id: 1, name: "Birthday"),
    TagModel(id: 2, name: "Creative"),
    TagModel(id: 3, name: "Generous"),
    TagModel(id: 4, name: "Helpful"),
    TagModel(id: 5, name: "Honest"),
    TagModel(id: 6, name: "Inspirational"),
    TagModel(id: 7, name: "Kind"),
    TagModel(id: 8, name: "Positive"),
    TagModel(id: 9, name: "Proactive"),
    TagModel(id: 10, name: "Productive"),
    TagModel(id: 11, name: "Professional"),
    TagModel(id: 12, name: "Reliable"),
    TagModel(id: 13, name: "Resourceful"),
    TagModel(id: 14, name: "Responsible"),
    TagModel(id: 15, name: "Skilful"),
    TagModel(id: 16, name: "Staff"),
    TagModel(id: 17, name: "Strategic"),
    TagModel(id: 18, name: "Team Work"),
    TagModel(id: 19, name: "Thoughtful"),
    TagModel(id: 20, name: "Work Anniversary")
  ];
  List<int> selectedTags = [];
  int count = 0;
  int maxCharLength = 300;
  late TextEditingController textEditingController;

  PostPrivacyModel postPrivacyModel = PostPrivacyModel(
      id: 1,
      title: "Public",
      subtitle: "Whole organisation can see the post",
      description: "Public");

  BadgeType badge = BadgeType.kudos;

  List<EmployeeModel> employees = [];

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void chageCount(int value) {
    setState(() {
      count = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: Container(
                width: 30.h,
                height: 30.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.h),
                    color: const Color(0xFFF5F6F7)),
                child: Icon(Icons.close_rounded,
                    color: const Color(0xFF505F79), size: 25.h),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Give Thumb",
            style: TextStyle(
                fontSize: 15.fs,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF15294B)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                // onTap: () => Navigator.pop(context),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.h),
                      color: const Color(0xFFFFEBEE)),
                  child: Text(
                    "Post",
                    style: TextStyle(
                        fontSize: 14.fs,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFB3005E)),
                  ),
                ),
              ),
            )
          ],
          toolbarHeight: 60.h,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: Divider(
              color: const Color(0xFFDFE2E6),
              thickness: 1.h,
            ),
          )),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
            child: SizedBox(
              height: 65.h,
              child: Row(
                children: [
                  Container(
                    height: 65.h,
                    width: 65.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.5.h),
                    ),
                    child: Image.asset(
                      "assets/images/profile.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jerold Ramsbottom",
                        style: TextStyle(
                            fontSize: 14.fs,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF15294B)),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isDismissible: true,
                              context: context,
                              builder: (context) => PostPrivacy(
                                    currentPrivacy: postPrivacyModel,
                                  )).then((value) {
                            if (value != null) {
                              setState(() {
                                postPrivacyModel = value;
                              });
                              rootScaffoldMessengerKey.currentState
                                  ?.showSnackBar(toast(
                                      type: ToastType.success,
                                      message:
                                          "Post privacy changed to ${postPrivacyModel.title.toLowerCase()}"));
                            }
                          });
                        },
                        child: Container(
                          height: 40.h,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
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
                                  postPrivacyModel.description,
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
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 0),
            child: Container(
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
              // height: 230.h,
              width: 400.w,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF5F6F7), width: 2.w),
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    style: TextStyle(
                        color: const Color(0xFF15294B),
                        fontSize: 15.fs,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none),
                    maxLines: 7,
                    inputFormatters: [
                      MaxCharTextInputFormater(
                          maxChars: maxCharLength, currentLength: chageCount)
                    ],
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        fillColor: Colors.transparent,
                        // filled: true,

                        hintText: "Say what's on your mind...",
                        hintStyle: TextStyle(
                            color: const Color(0xFF7A8699),
                            fontSize: 15.fs,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "$count/$maxCharLength",
                      style: TextStyle(
                          fontSize: 12.fs,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF7A8699)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 0),
            child: Container(
              height: 120.h,
              width: 400.w,
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF5F6F7), width: 2.w),
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Points Awarded",
                              style: TextStyle(
                                  fontSize: 15.fs,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF15294B)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerRight,
                            child: RichText(
                              text: TextSpan(
                                  text: "Points Available: ",
                                  style: TextStyle(
                                      fontSize: 12.fs,
                                      color: const Color(0xFF505F79),
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                      text: "780",
                                      style: TextStyle(
                                          fontSize: 14.fs,
                                          color: const Color(0xFF15294B),
                                          fontWeight: FontWeight.w700),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    // height: 45.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 45.h,
                          width: 45.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.5.h),
                              gradient: badge.gradient()),
                          child: SvgPicture.asset(
                            badge.icon(),
                            width: 22.5.h,
                            height: 22.5.h,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
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
                                "${badge.point()}P",
                                style: TextStyle(
                                    fontSize: 18.fs,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF15294B)),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                badge.name(),
                                style: TextStyle(
                                    fontSize: 14.fs,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF505F79)),
                              ),
                            ),
                          ],
                        )),
                        SizedBox(
                          width: 8.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isDismissible: true,
                                context: context,
                                builder: (context) => SelectPonitAmount(
                                      currentBadge: badge,
                                    )).then((value) {
                              if (value != null) {
                                setState(() {
                                  badge = value;
                                });
                              }
                            });
                          },
                          child: Text(
                            "Change ",
                            style: TextStyle(
                                fontSize: 14.fs,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFB3005E)),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded,
                            color: const Color(0xFFB3005E), size: 15.h)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 0),
            child: Container(
              height: 130.h,
              width: 400.w,
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF5F6F7), width: 2.w),
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select Points Receiver",
                              style: TextStyle(
                                  fontSize: 15.fs,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF15294B)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isDismissible: true,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => SelectEmployeeBottomSheet(
                                      currentList: employees,
                                    )).then((value) {
                              if (value != null) {
                                setState(() {
                                  employees = value;
                                });
                              }
                            });
                          },
                          child: Text(
                            "Add ",
                            style: TextStyle(
                                fontSize: 14.fs,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFB3005E)),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded,
                            color: const Color(0xFFB3005E), size: 15.h)
                      ],
                    ),
                  ),
                  employees.isEmpty
                      ? _buildNoEmployeeView()
                      : _buildEmployeeView()
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 0),
            child: Container(
              height: 130.h,
              width: 400.w,
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF5F6F7), width: 2.w),
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Add Media",
                              style: TextStyle(
                                  fontSize: 15.fs,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF15294B)),
                            ),
                          ),
                        ),
                        Text(
                          "Add ",
                          style: TextStyle(
                              fontSize: 14.fs,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFB3005E)),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded,
                            color: const Color(0xFFB3005E), size: 15.h)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                          child: Text(
                            "No media files have been added",
                            style: TextStyle(
                                fontSize: 15.fs,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF505F79)),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                          child: Text(
                            "You may add images/videos here",
                            style: TextStyle(
                                fontSize: 12.fs,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF7A8699)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
            child: Container(
              // height: 130.h,
              width: 400.w,
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF5F6F7), width: 2.w),
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add Tags",
                        style: TextStyle(
                            fontSize: 15.fs,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF15294B)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Flexible(
                      child: Wrap(
                    spacing: 8.w,
                    runSpacing: 8.w,
                    children: tags
                        .map((e) => GestureDetector(
                              onTap: () {
                                if (selectedTags.contains(e.id)) {
                                  selectedTags.remove(e.id);
                                } else {
                                  selectedTags.add(e.id);
                                }
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 5.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selectedTags.contains(e.id)
                                            ? const Color(0xFFB3005E)
                                            : const Color(0xFFDFE2E6)),
                                    borderRadius: BorderRadius.circular(5.h),
                                    color: selectedTags.contains(e.id)
                                        ? const Color(0xFFFFEBEE)
                                        : const Color(0xFFFFFFFF)),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                  child: Text(
                                    e.name,
                                    style: TextStyle(
                                      fontSize: 12.fs,
                                      fontWeight: FontWeight.w400,
                                      color: selectedTags.contains(e.id)
                                          ? const Color(0xFFB3005E)
                                          : const Color(0xFF505F79),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ))
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  _buildNoEmployeeView() {
    return SizedBox(
      height: 55.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Text(
              "No employee has been selected",
              style: TextStyle(
                  fontSize: 15.fs,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF505F79)),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Text(
              "Select one or more employees that needs to be awarded",
              style: TextStyle(
                  fontSize: 12.fs,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7A8699)),
            ),
          ),
        ],
      ),
    );
  }

  _buildEmployeeView() {
    return SizedBox(
      height: 50.h,
      child: Row(
        children: [
          if (employees.length == 1) _employeeProPic(employees[0].image),
          if (employees.length > 1)
            SizedBox(
              height: 40.h,
              width: 55.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 15.h,
                    child: _employeeProPic(employees[1].image),
                  ),
                  _employeeProPic(employees[0].image),
                ],
              ),
            ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  employees[0].name,
                  style: TextStyle(
                      fontSize: 14.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF15294B)),
                ),
              ),
              if (employees.length == 1)
                Text(
                  employees[0].des,
                  style: TextStyle(
                      fontSize: 12.fs,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF505F79)),
                  textAlign: TextAlign.left,
                ),
              if (employees.length > 1)
                RichText(
                  text: TextSpan(
                      text: "and ",
                      style: TextStyle(
                          fontSize: 12.fs,
                          color: const Color(0xFF505F79),
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: "${employees.length - 1} Other",
                          style: TextStyle(
                              fontSize: 12.fs,
                              decoration: TextDecoration.underline,
                              color: const Color(0xFF15294B),
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                ),
            ],
          )
        ],
      ),
    );
  }

  _employeeProPic(String image) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.white)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.h),
        child: Image.asset(image, height: 40.h, width: 40.h, fit: BoxFit.fill),
      ),
    );
  }
}
