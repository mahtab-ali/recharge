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

  // Primary Heading

  static TextStyle headingOne({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 25,
      fontFamily: 'Poppins',
    );
  }

// Secondary Heading

  static TextStyle headingTwo({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 16,
      fontFamily: 'Poppins',
    );
  }

// Body

  static TextStyle body({Color? color}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontFamily: 'Poppins',
    );
  }
}
