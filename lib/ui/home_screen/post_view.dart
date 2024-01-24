import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/shared_widgets/post_with_permission_bottom_sheet.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      color: Colors.white,
      width: 430.w,
      child: Column(children: [
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 70.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 60.h,
                    width: 60.h,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(30.h)),
                    child: Image.asset(
                      "assets/images/KW.png",
                      width: 60.h,
                      height: 60.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Flexible(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Kriston Watshon",
                          style: TextStyle(
                              fontSize: 15.fs,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF15294B)),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Store Manager - 345768 Harrisburg",
                          style: TextStyle(
                              fontSize: 12.fs,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF505F79)),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "13 mins ago",
                          style: TextStyle(
                              fontSize: 12.fs,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF505F79)),
                        ),
                      )
                    ],
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isDismissible: true,
                        context: context,
                        builder: (context) =>
                            const PostWithPermissionBottomSheet());
                  },
                  child: Align(
                    // color: Colors.blue,
                    alignment: Alignment.topRight,
                    // padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Icon(Icons.more_horiz_rounded,
                        size: 30.h, color: const Color(0xFF505F79)),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildPostTextBody(
            "Great job jump in to help with Penn state charter when you arrived. Appreciated your support 👍"),
        _buildHashTagText(),
        _buildImageContent(),
        Container(
          // height: 125.h,
          margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          padding: EdgeInsets.fromLTRB(10.w, 12.5.h, 10.w, 12.5.h),
          decoration: BoxDecoration(
              color: const Color(0xFFFAFBFB),
              border: Border.all(width: 2.w, color: const Color(0xFFF5F6F7)),
              borderRadius: BorderRadius.circular(8.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 45.h,
                            width: 45.h,
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(25.h)),
                            child: Image.asset(
                              "assets/images/JA.png",
                              width: 45.h,
                              height: 45.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Jacob Atkinson",
                                  style: TextStyle(
                                      fontSize: 14.fs,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF15294B)),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Team Member - 345768 Harrisburg",
                                  style: TextStyle(
                                      fontSize: 11.fs,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF505F79)),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 35.h,
                        width: 120.w,
                        padding: EdgeInsets.all(2.5.h),
                        decoration: BoxDecoration(
                            color: const Color(0xFFDFE2E6),
                            borderRadius: BorderRadius.circular(20.w)),
                        child: Row(
                          children: [
                            Container(
                              height: 30.h,
                              width: 30.h,
                              decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15.h)),
                              child: Image.asset(
                                "assets/images/PM.png",
                                width: 30.h,
                                height: 30.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              "assets/icons/p_star.svg",
                              width: 20.h,
                              height: 20.h,
                            ),
                            const Spacer(),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerRight,
                              child: Text(
                                "100P",
                                style: TextStyle(
                                    fontSize: 14.fs,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF15294B)),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    "assets/icons/points_badge_100.svg",
                    width: 100.h,
                    height: 100.h,
                    fit: BoxFit.fill,
                    alignment: Alignment.centerRight,
                  ),
                ),
              )
            ],
          ),
        ),
        _buildLikeCommentRow(),
        _buildLikeCommentFuncRow()
      ]),
    );
  }

  Container _buildLikeCommentFuncRow() {
    return Container(
      height: 40.h,
      width: 430.w,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/heart.svg",
                width: 20.h,
                height: 20.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "Like",
                style: TextStyle(
                    fontSize: 15.fs,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF505F79)),
              ),
            ],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/comment_icon.svg",
                width: 20.h,
                height: 20.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "Comment",
                style: TextStyle(
                    fontSize: 15.fs,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF505F79)),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Container _buildLikeCommentRow() {
    return Container(
      // height: 20.h,
      width: 430.w,
      margin: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
      child: Row(
        children: [
          Text(
            "4 Likes",
            style: TextStyle(
                fontSize: 15.fs,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF990060)),
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            "10 Comments",
            style: TextStyle(
                fontSize: 15.fs,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF990060)),
          ),
        ],
      ),
    );
  }

  _buildPostTextBody(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          child: SelectableText.rich(
            TextSpan(
                children: extractText(text),
                style: TextStyle(
                  fontSize: 14.fs,
                  color: const Color(0xFF15294B),
                )),
          )),
    );
  }

  List<TextSpan> extractText(String rawString) {
    List<TextSpan> textSpan = [];

    final urlRegExp = RegExp(
        r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");

    getLink(String linkString) {
      textSpan.add(
        TextSpan(
          text: linkString,
          style: TextStyle(color: Colors.blue, fontSize: 14.fs),
          // recognizer: TapGestureRecognizer()
          //   ..onTap = () {
          //     UtilCommon.launchAnUrl(linkString);
          //   },
        ),
      );
      return linkString;
    }

    getNormalText(String normalText) {
      textSpan.add(
        TextSpan(
          text: normalText,
          style: TextStyle(color: const Color(0xFF15294B), fontSize: 14.fs),
        ),
      );
      return normalText;
    }

    rawString.splitMapJoin(
      urlRegExp,
      onMatch: (m) => getLink("${m.group(0)}"),
      onNonMatch: (n) => getNormalText(n.substring(0)),
    );

    return textSpan;
  }

  _buildImageContent() {
    return SizedBox(
      height: 275.h,
      width: 430.w,
      child: Image.asset(
        "assets/images/post_image.png",
        fit: BoxFit.cover,
      ),
    );
  }

  _buildHashTagText() {
    List<String> hashTags = [
      "reliable",
      "resourceful",
      "workAnniversary",
      "teamWork",
      "workPlace",
      "thankYou"
    ];
    String singleLine = "";
    for (var element in hashTags) {
      singleLine = "$singleLine#$element  ";
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Text(
          singleLine,
          style: TextStyle(
              color: const Color(0xFFB3005E),
              fontSize: 15.fs,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
