import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/custom_extentions.dart';
import 'package:thumbs_app/models/employee_model.dart';

class SelectEmployeeBottomSheet extends StatefulWidget {
  final List<EmployeeModel> currentList;
  const SelectEmployeeBottomSheet({super.key, required this.currentList});

  @override
  State<SelectEmployeeBottomSheet> createState() =>
      _SelectEmployeeBottomSheetState();
}

class _SelectEmployeeBottomSheetState extends State<SelectEmployeeBottomSheet> {
  List<EmployeeModel> employees = [
    EmployeeModel(
        id: 1,
        name: "Annette Black",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/AB.png"),
    EmployeeModel(
        id: 2,
        name: "Savannah Nguyen",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/SN.png"),
    EmployeeModel(
        id: 3,
        name: "Bessie Cooper",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/BC.png"),
    EmployeeModel(
        id: 4,
        name: "Annette Black",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/AB.png"),
    EmployeeModel(
        id: 5,
        name: "Savannah Nguyen",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/SN.png"),
    EmployeeModel(
        id: 6,
        name: "Bessie Cooper",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/BC.png"),
    EmployeeModel(
        id: 7,
        name: "Annette Black",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/AB.png"),
    EmployeeModel(
        id: 8,
        name: "Savannah Nguyen",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/SN.png"),
    EmployeeModel(
        id: 9,
        name: "Bessie Cooper",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/BC.png"),
    EmployeeModel(
        id: 10,
        name: "Annette Black",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/AB.png"),
    EmployeeModel(
        id: 11,
        name: "Savannah Nguyen",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/SN.png"),
    EmployeeModel(
        id: 12,
        name: "Bessie Cooper",
        des: "Team Member - 345768 Harrisburg",
        image: "assets/images/BC.png"),
  ];
  List<EmployeeModel> selectedEmployees = [];

  @override
  void initState() {
    for (EmployeeModel e in widget.currentList) {
      selectedEmployees
          .add(employees.where((element) => e.id == element.id).first);
    }
    setState(() {});
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
                  "Select Employees (${selectedEmployees.length})",
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
                      hintText: "Search employee by name or emp id...",
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
                  itemCount: employees.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedEmployees.contains(employees[index])) {
                              selectedEmployees.remove(employees[index]);
                            } else {
                              selectedEmployees.add(employees[index]);
                            }
                          });
                        },
                        child: Container(
                          height: 55.h,
                          width: 430.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color:
                                  selectedEmployees.contains(employees[index])
                                      ? const Color(0xFFFFEBEE)
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(4.h),
                              border: Border.all(
                                  color: selectedEmployees
                                          .contains(employees[index])
                                      ? const Color(0xFFF794AA)
                                      : Colors.transparent)),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 40.h,
                                width: 40.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.h),
                                  child: Image.asset(employees[index].image,
                                      height: 40.h,
                                      width: 40.h,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employees[index].name,
                                    style: TextStyle(
                                        fontSize: 14.fs,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF15294B)),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    employees[index].des,
                                    style: TextStyle(
                                        fontSize: 12.fs,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF505F79)),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
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
                Navigator.pop(context, selectedEmployees);
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
                  "Give Thumb",
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
