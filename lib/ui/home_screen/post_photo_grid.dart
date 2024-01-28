import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';

class PostPhotoGrid extends StatefulWidget {
  final List photos;
  const PostPhotoGrid({super.key, required this.photos});

  @override
  State<PostPhotoGrid> createState() => _PostPhotoGridState();
}

class _PostPhotoGridState extends State<PostPhotoGrid> {
  @override
  Widget build(BuildContext context) {
    switch (widget.photos.length) {
      case 0:
        return const SizedBox();
      case 1:
        return _singleView();
      case 2:
        return _doubleView();
      case 3:
        return _tripleView();
      case 4:
        return _fourView();
      case 5:
        return _fiveOrMoreView();
      default:
        return _fiveOrMoreView(isMoreThanFive: true);
    }
  }

  _singleView() {
    return SizedBox(
      height: 278.h,
      width: 430.w,
      child: Image.asset(
        "assets/images/post_image.png",
        height: 278.h,
        width: 430.w,
        fit: BoxFit.cover,
      ),
    );
  }

  _doubleView() {
    return SizedBox(
      height: 278.h,
      width: 430.w,
      child: Row(
        children: [
          Image.asset(
            "assets/images/post_image.png",
            height: 278.h,
            width: 211.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 8.w,
          ),
          Image.asset(
            "assets/images/post_image.png",
            height: 278.h,
            width: 211.w,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  _tripleView() {
    return SizedBox(
      height: 278.h,
      width: 430.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 211.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8.w,
              ),
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 211.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            width: 8.h,
          ),
          Image.asset(
            "assets/images/post_image.png",
            height: 135.h,
            width: 430.w,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  _fourView() {
    return SizedBox(
      height: 278.h,
      width: 430.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 211.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8.w,
              ),
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 211.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            width: 8.h,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 211.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8.w,
              ),
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 211.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _fiveOrMoreView({bool isMoreThanFive = false}) {
    return SizedBox(
      height: 278.h,
      width: 430.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 211.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8.w,
              ),
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 211.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            width: 8.h,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 138.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8.w,
              ),
              Image.asset(
                "assets/images/post_image.png",
                height: 135.h,
                width: 138.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8.w,
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/images/post_image.png",
                    height: 135.h,
                    width: 138.w,
                    fit: BoxFit.cover,
                  ),
                  if (isMoreThanFive)
                    Container(
                      height: 135.h,
                      width: 138.w,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      color: Colors.black.withOpacity(.26),
                      child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${widget.photos.length - 5}+",
                          style: TextStyle(
                              fontSize: 16.fs,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
