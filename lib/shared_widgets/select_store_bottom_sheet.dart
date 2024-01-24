import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/models/post_privacy_model.dart';
import 'package:thumbs_app/models/store_model.dart';

class SelectStoreBottomSheet extends StatefulWidget {
  final PostPrivacyModel model;
  const SelectStoreBottomSheet({super.key, required this.model});

  @override
  State<SelectStoreBottomSheet> createState() => _SelectStoreBottomSheetState();
}

class _SelectStoreBottomSheetState extends State<SelectStoreBottomSheet> {
  List<StoreModel> stores = [
    StoreModel(id: 1, name: "Toledo", description: "345768", isSelect: false),
    StoreModel(id: 2, name: "Austin", description: "345768", isSelect: false),
    StoreModel(
        id: 3, name: "Harrisburg", description: "Orange", isSelect: false),
    StoreModel(
        id: 4, name: "Naperville", description: "345768", isSelect: false),
  ];
  late PostPrivacyModel privacyModel;
  @override
  void initState() {
    privacyModel = widget.model;
    for (int storeId in widget.model.stores) {
      stores.where((element) => element.id == storeId).first.isSelect = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      constraints: BoxConstraints(maxHeight: 850.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.h),
            topRight: Radius.circular(10.h),
          )),
      child: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
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
                  "Select Stores (${stores.where((e) => e.isSelect).length})",
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
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Container(
                width: 400.w,
                height: 40.h,
                padding: EdgeInsets.fromLTRB(0, 5.h, 12, 5.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.h),
                    border: Border.all(color: const Color(0xFFDFE2E6))),
                child: TextField(
                  style: TextStyle(
                      color: const Color(0xFF15294B),
                      fontSize: 14.fs,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none),
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: const Color(0xFF344054),
                        size: 20.h,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      fillColor: Colors.transparent,
                      hintText: "Search store",
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
              )),
          Expanded(
              child: ListView.builder(
                  itemCount: stores.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            stores[index].isSelect = !stores[index].isSelect;
                          });
                        },
                        child: Container(
                          height: 55.h,
                          width: 430.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: stores[index].isSelect
                                  ? const Color(0xFFFFEBEE)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(4.h),
                              border: Border.all(
                                  color: stores[index].isSelect
                                      ? const Color(0xFFF794AA)
                                      : Colors.white)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stores[index].name,
                                style: TextStyle(
                                    fontSize: 14.fs,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF15294B)),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                stores[index].description,
                                style: TextStyle(
                                    fontSize: 12.fs,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF505F79)),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            color: const Color(0xFFDFE2E6),
            thickness: 1.h,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 5.h),
            child: GestureDetector(
              onTap: () {
                List<StoreModel> temp =
                    stores.where((element) => element.isSelect).toList();
                if (temp.isNotEmpty) {
                  privacyModel.stores.clear();
                  for (final element in temp) {
                    privacyModel.stores.add(element.id);
                  }
                  if (temp.length == 1) {
                    privacyModel.description =
                        "${temp.first.description} - ${temp.first.name}";
                  } else {
                    privacyModel.description =
                        "${temp.first.description} - ${temp.first.name} & ${temp.length - 1}+ others";
                  }
                  Navigator.pop(context, privacyModel);
                }
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
                  "Select Stores",
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
}
