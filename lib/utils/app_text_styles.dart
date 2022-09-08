import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle appTextStyle(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        fontSize: fontSize ?? 11,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppColors.grayTextColor,
      ),
    );
  }

  // static TextStyle appTextStyleWithDecoration(
  //     {double fontSize,
  //     FontWeight fontWeight,
  //     Color color,
  //     TextDecoration decoration,
  //     Color decorationColor}) {
  //   return TextStyle(
  //     fontFamily: Constant.fontFamily,
  //     fontSize: fontSize ?? 11,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: fontWeight ?? FontWeight.normal,
  //     color: color ?? AppColors.bodyTextColor,
  //     decoration: decoration ?? null,
  //     decorationColor: decorationColor ?? null,
  //   );
  // }

  // static TextStyle textFieldTextStyle({double fontSize}) {
  //   return TextStyle(
  //       fontFamily: Constant.fontFamily,
  //       fontSize: fontSize ?? 16,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w600,
  //       color: AppColors.headlineColor);
  // }

  // static TextStyle titleTextStyle(
  //     {double fontSize, FontWeight fontWeight, Color color}) {
  //   return TextStyle(
  //       fontFamily: Constant.fontFamily,
  //       fontSize: fontSize ?? 16,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: fontWeight ?? FontWeight.w600,
  //       color: color ?? AppColors.headlineColor);
  // }

  // static TextStyle hintTextStyle(
  //     {double fontSize, FontWeight fontWeight, Color color}) {
  //   return TextStyle(
  //     fontFamily: Constant.fontFamily,
  //     fontSize: fontSize ?? 16,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: fontWeight ?? FontWeight.w600,
  //     color: color ?? AppColors.black.withOpacity(0.4),
  //   );
  // }

  // static TextStyle buttonTextStyle(
  //     {Color textColor, FontWeight fontWeight, double fontSize}) {
  //   return TextStyle(
  //     fontSize: fontSize ?? 16,
  //     fontStyle: FontStyle.normal,
  //     fontWeight: fontWeight ?? FontWeight.w700,
  //     color: textColor ?? AppColors.bgWhiteColor,
  //     fontFamily: Constant.fontFamily,
  //   );
  // }
}
