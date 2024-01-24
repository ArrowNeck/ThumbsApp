import 'package:flutter/painting.dart';

class SelectPointAmountModel {
  int id;
  String name;
  int value;
  String icon;
  LinearGradient colors;
  SelectPointAmountModel(
      {required this.id,
      required this.name,
      required this.value,
      required this.icon,
      required this.colors});
}
