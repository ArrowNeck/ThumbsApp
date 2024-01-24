import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/shared_widgets/common_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonWidgets.commonAppBar(title: "Edit Profile", context: context),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
              width: 150.h,
              child: Container(
                height: 150.h,
                width: 150.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF444444).withOpacity(0.36),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 5.h),
                ),
                child: Image.asset(
                  "assets/images/KW.png",
                  fit: BoxFit.fill,
                  width: 150.h,
                  height: 150.h,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
              width: 400.w,
            ),
            _buildLabel(label: "First Name"),
            _buildInputField(hint: "Jerold"),
            _buildLabel(label: "Last Name"),
            _buildInputField(hint: "Ramsbottom"),
            _buildLabel(label: "Email Address"),
            _buildInputField(hint: "jerold.r@gmail.com"),
            _buildLabel(label: "Phone Number"),
            _buildInputField(hint: "123-384-3485"),
            _buildLabel(label: "Date of Birth"),
            _buildInputField(hint: "31/09/1990"),
          ],
        ),
      )),
    );
  }

  _buildInputField({required String hint}) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, bottom: 20.h),
      child: Container(
        height: 45.h,
        width: 400.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: const Color(0xFFDFE2E6),
            border: Border.all(color: const Color(0xFFEAECF0)),
            borderRadius: BorderRadius.circular(8.h)),
        child: TextField(
          style: TextStyle(
              color: const Color(0xFF15294B),
              fontSize: 15.fs,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none),
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              fillColor: Colors.transparent,
              hintText: hint,
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
      ),
    );
  }

  Align _buildLabel({required String label}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
            fontSize: 14.fs,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF344054)),
      ),
    );
  }
}
