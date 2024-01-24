import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/models/post_privacy_model.dart';
import 'package:thumbs_app/shared_widgets/post_privacy.dart';
import 'package:thumbs_app/utils/max_char_input_formater.dart';

class CreateAndEditPost extends StatefulWidget {
  const CreateAndEditPost({super.key});

  @override
  State<CreateAndEditPost> createState() => _CreateAndEditPostState();
}

class _CreateAndEditPostState extends State<CreateAndEditPost> {
  int count = 0;
  int maxCharLength = 300;
  late TextEditingController textEditingController;
  PostPrivacyModel postPrivacyModel = PostPrivacyModel(
      id: 1,
      title: "Public",
      subtitle: "Whole organisation can see the post",
      description: "Public");

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
            "Create Post",
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
                              Text(
                                postPrivacyModel.description,
                                style: TextStyle(
                                    fontSize: 14.fs,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFB3005E)),
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
        ],
      )),
    );
  }
}
