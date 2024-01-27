import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/models/comment_model.dart';

class CommentsBottomSheet extends StatefulWidget {
  const CommentsBottomSheet({super.key});

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  List<CommentModel> comments = [
    CommentModel(
        name: "Jordan Silva",
        message: "Happy work anniversary!!! 🎉",
        pic: "AB.png"),
    CommentModel(
        name: "Jamie Anderson",
        message: "Happy work anniversary Deepak Anderson",
        pic: "SN.png"),
    CommentModel(
        name: "Bessie Cooper",
        message:
            "It is very much joyful to work with you all these years Deepak Anderson.   Happy Work Anniversary!!!",
        pic: "BC.png"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: 430.w,
          constraints: BoxConstraints(
              maxHeight: 850.h - MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.h),
                topRight: Radius.circular(10.h),
              )),
          child: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
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
              _contents(comments),
              Divider(
                color: const Color(0xFFDFE2E6),
                thickness: 1.h,
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.w, 12.h, 15.w, 0),
                child: SizedBox(
                  height: 100.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            color: const Color(0xFFF5F6F7),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 5.h),
                                    child: TextField(
                                      style: TextStyle(
                                          color: const Color(0xFF15294B),
                                          fontSize: 14.fs,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none),
                                      maxLines: 1,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          fillColor: Colors.transparent,
                                          hintText: "Add comment here...",
                                          hintStyle: TextStyle(
                                              color: const Color(0xFF7A8699),
                                              fontSize: 14.fs,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w400),
                                          border: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none),
                                    ),
                                  ),
                                )),
                                Divider(
                                  color: const Color(0xFFDFE2E6),
                                  thickness: 1.h,
                                  height: 1.h,
                                ),
                                Expanded(
                                    child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                    children: [
                                      _inputBtn("image"),
                                      _inputBtn("video"),
                                      _inputBtn("mic"),
                                      _inputBtn("file"),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                        _sendBtn()
                      ]),
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ]),
          )),
    );
  }

  _contents(List comments) {
    if (comments.isNotEmpty) {
      return Expanded(
          child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return _commentTile(comments[index]);
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
      ));
    } else {
      return Expanded(
          child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          SvgPicture.asset(
            "assets/icons/no_comments.svg",
            width: 90.h,
            height: 90.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "No comments Yet.",
            style: TextStyle(
                fontSize: 14.fs,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF505F79)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Be the first one to comment on this",
            style: TextStyle(
                fontSize: 12.fs,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7A8699)),
            textAlign: TextAlign.center,
          ),
        ],
      ));
    }
  }

  _commentTile(CommentModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.5.h),
          child: Image.asset(
            "assets/images/${model.pic}",
            width: 25.h,
            height: 25.h,
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          constraints: BoxConstraints(maxWidth: 365.w),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: const Color(0xFFF5F6F7),
              borderRadius: BorderRadius.circular(8.h)),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                      fontSize: 14.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF15294B)),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  model.message,
                  style: TextStyle(
                      fontSize: 14.fs,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF505F79)),
                  textAlign: TextAlign.left,
                  softWrap: true,
                  maxLines: null,
                ),
              ]),
        )
      ],
    );
  }

  _sendBtn() {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Container(
        height: 45.h,
        width: 45.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xFFB3005E),
            borderRadius: BorderRadius.circular(4.h)),
        child: SvgPicture.asset(
          "assets/icons/send.svg",
          width: 25.h,
          height: 25.h,
        ),
      ),
    );
  }

  _inputBtn(String icon) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        height: 40.h,
        width: 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xFFDFE2E6),
            borderRadius: BorderRadius.circular(4.h)),
        child: SvgPicture.asset(
          "assets/icons/$icon.svg",
          width: 25.h,
          height: 25.h,
        ),
      ),
    );
  }
}
