import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientProgressBar extends StatelessWidget {
  ///it can be anything between 0 to 100
  final int percent;
  final LinearGradient gradient;
  final Color backgroundColor;

  const GradientProgressBar(
      {required this.percent,
      required this.gradient,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: percent,
          fit: FlexFit.tight,
          child: Container(
            decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.all(Radius.circular(5.h))),
            child: SizedBox(height: 10.h),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 100 - percent,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: percent == 0
                  ? BorderRadius.all(Radius.circular(5.h))
                  : BorderRadius.only(
                      bottomRight: Radius.circular(5.h),
                      topRight: Radius.circular(5.h)),
            ),
            child: SizedBox(height: 10.h),
          ),
        ),
      ],
    );
  }
}
