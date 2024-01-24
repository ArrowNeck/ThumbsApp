import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/models/post_privacy_model.dart';
import 'package:thumbs_app/shared_widgets/select_store_bottom_sheet.dart';

class PostPrivacy extends StatefulWidget {
  final PostPrivacyModel currentPrivacy;
  const PostPrivacy({super.key, required this.currentPrivacy});

  @override
  State<PostPrivacy> createState() => _PostPrivacyState();
}

class _PostPrivacyState extends State<PostPrivacy> {
  List<PostPrivacyModel> privacyList = [
    PostPrivacyModel(
      title: "Public",
      subtitle: "Whole organisation can see the post",
      id: 1,
      description: "Public",
    ),
    PostPrivacyModel(
        title: "Private",
        subtitle: "Only tagged people can see the post",
        id: 2,
        description: "Private"),
    PostPrivacyModel(
        title: "Store Wise",
        subtitle: "Only selected stores can see the post",
        id: 3,
        description: "Only selected stores can see the post"),
  ];
  late PostPrivacyModel selectedPrivacy;
  @override
  void initState() {
    selectedPrivacy = widget.currentPrivacy;
    if (widget.currentPrivacy.id == 3) {
      privacyList[2] = selectedPrivacy;
    }
    super.initState();
  }

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
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Post Privacy",
                  style: TextStyle(
                      fontSize: 18.fs,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF15294B)),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 30.h,
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.h),
                        color: const Color(0xFFF5F6F7)),
                    child: Icon(Icons.close_rounded,
                        color: const Color(0xFF505F79), size: 25.h),
                  ),
                )
              ],
            ),
          ),
          ...privacyList.map((privacy) => _buildTile(privacy)),
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 5.h),
            child: GestureDetector(
              onTap: () {
                // showModalBottomSheet(
                //     backgroundColor: Colors.transparent,
                //     isDismissible: true,
                //     isScrollControlled: true,
                //     context: context,
                //     builder: (context) => );
                Navigator.pop(context, selectedPrivacy);
              },
              child: Container(
                height: 45.h,
                width: 400.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFB3005E),
                  borderRadius: BorderRadius.circular(8.h),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                      fontSize: 16.fs,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  _buildTile(PostPrivacyModel privacyModel) {
    return ListTile(
      onTap: () {
        if (privacyModel.id != 3) {
          setState(() {
            selectedPrivacy = privacyModel;
          });
        } else {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isDismissible: true,
              isScrollControlled: true,
              context: context,
              builder: (context) => SelectStoreBottomSheet(
                    model: privacyModel,
                  )).then((value) {
            if (value != null) {
              setState(() {
                selectedPrivacy = value;
              });
            }
          });
        }
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          privacyModel.title,
          style: TextStyle(
              fontSize: 18.fs,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF15294B)),
        ),
      ),
      subtitle: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          privacyModel.id == 3
              ? privacyModel.description
              : privacyModel.subtitle,
          style: TextStyle(
              fontSize: 12.fs,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF505F79)),
        ),
      ),
      leading: SizedBox(
        height: 50.h,
        width: 50.h,
        child: Checkbox(
            shape: const CircleBorder(),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return states.contains(MaterialState.selected)
                  ? const Color(0xFFFFEBEE)
                  : Colors.white;
            }),
            side: BorderSide(
              color: privacyModel.id == selectedPrivacy.id
                  ? const Color(0xFFB3005E)
                  : const Color(0xFFDFE2E6),
            ),
            checkColor: const Color(0xFFB3005E),
            visualDensity: VisualDensity.compact,
            value: privacyModel.id == selectedPrivacy.id,
            onChanged: (bool? value) {
              if (privacyModel.id != 3) {
                setState(() {
                  selectedPrivacy = privacyModel;
                });
              } else {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isDismissible: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => SelectStoreBottomSheet(
                          model: privacyModel,
                        )).then((value) {
                  if (value != null) {
                    setState(() {
                      selectedPrivacy = value;
                    });
                  }
                });
              }
            }),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: const Color(0xFF7A8699),
        size: 15.h,
      ),
    );
  }
}
