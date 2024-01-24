import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/ui/home_screen/create_and_edit_post.dart';
import 'package:thumbs_app/ui/home_screen/create_and_edit_thumb.dart';

class CreatePostBottomSheet extends StatefulWidget {
  const CreatePostBottomSheet({super.key});

  @override
  State<CreatePostBottomSheet> createState() => _CreatePostBottomSheetState();
}

class _CreatePostBottomSheetState extends State<CreatePostBottomSheet> {
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
          _buildTile(
            "Give Thumb",
            Icons.thumb_up_outlined,
            () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const CreateAndEditThumb()));
            },
          ),
          _buildTile(
            "Create Post",
            Icons.add,
            () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CreateAndEditPost()));
            },
          ),
        ],
      )),
    );
  }

  _buildTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      horizontalTitleGap: 8.w,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18.fs,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF15294B)),
      ),
      leading: Container(
        width: 30.h,
        height: 30.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.h),
            color: const Color(0xFFF5F6F7)),
        child: Icon(icon, color: const Color(0xFF505F79), size: 20.h),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: const Color(0xFF7A8699),
        size: 15.h,
      ),
    );
  }
}
