import 'package:flutter/material.dart';
import 'package:recharge_app/util/color.dart';

class AppText {
  // Main title
  static TextStyle mainTitle(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      double? height}) {
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? AppColors.dark,
      fontSize: fontSize ?? 20,
      height: height ?? height,
    );
  }
}
