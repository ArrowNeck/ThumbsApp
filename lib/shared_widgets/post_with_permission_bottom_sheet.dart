import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';

class PostWithPermissionBottomSheet extends StatefulWidget {
  const PostWithPermissionBottomSheet({super.key});

  @override
  State<PostWithPermissionBottomSheet> createState() =>
      _PostWithPermissionBottomSheetState();
}

class _PostWithPermissionBottomSheetState
    extends State<PostWithPermissionBottomSheet> {
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
          _buildTile("Give Thumb", Icons.thumb_up_outlined),
          _buildTile("Edit Post", Icons.edit_document),
          _buildTile("Remove Post", Icons.delete_outline_rounded,
              isDelete: true),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: const Divider(
              color: Color(0xFFDFE2E6),
              thickness: 1,
            ),
          ),
          _buildTile("Report Post", Icons.error_outline_rounded),
          _buildTile("Hide Post", Icons.visibility_off_outlined),
        ],
      )),
    );
  }

  _buildTile(String title, IconData icon, {bool isDelete = false}) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        horizontalTitleGap: 8.w,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18.fs,
              fontWeight: FontWeight.w500,
              color:
                  isDelete ? const Color(0xFFF9472F) : const Color(0xFF15294B)),
        ),
        leading: Container(
          width: 30.h,
          height: 30.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.h),
              color:
                  isDelete ? const Color(0xFFFEEDEA) : const Color(0xFFF5F6F7)),
          child: Icon(icon,
              color:
                  isDelete ? const Color(0xFFF9472F) : const Color(0xFF505F79),
              size: 20.h),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: const Color(0xFF7A8699),
          size: 15.h,
        ),
      ),
    );
  }
}
