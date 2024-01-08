import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

/// Styles class holding app text styles
class AppTextStyles {
  /// Font family string
  static const String fontFamily = 'Raleway';

  /// Text style for heading 1 text
  static TextStyle title = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.titleColor,
  );

  /// Text style for heading 2 text
  static TextStyle subtitle = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
  );

  /// Text style for titleSm Button
  static TextStyle buttonText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static TextStyle bodyLg = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyColor,
  );

  /// Text style for body text
  static TextStyle body = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyColor,
  );
}
