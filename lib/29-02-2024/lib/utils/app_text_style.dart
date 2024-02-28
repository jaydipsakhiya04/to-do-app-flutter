import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_font.dart';

class AppTextStyle {
  // Regular Text Style

  TextStyle hanKenF16W6titleDark =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColors.titleDark, height: 2, fontFamily: AppFontFamily.hankenGroteskSemiBold);
  TextStyle hanKenF28W6titleDark =
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, color: AppColors.titleDark, fontFamily: AppFontFamily.hankenGroteskReguler);
  TextStyle hanKenF28W5titleDark =
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500, color: AppColors.titleDark, fontFamily: AppFontFamily.hankenGroteskReguler);
  TextStyle hanKenF16W5titleDark =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.titleDark, fontFamily: AppFontFamily.hankenGroteskReguler);
  TextStyle hanKenF14W4titleDark =
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.titleDark, fontFamily: AppFontFamily.hankenGroteskReguler);
  TextStyle hanKenF11W5titleDark =
      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: AppColors.titleDark, fontFamily: AppFontFamily.hankenGroteskMedium);
  TextStyle hanKenF12W5titleDark =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.titleDark, fontFamily: AppFontFamily.hankenGroteskMedium);
  TextStyle hanKenF12W6titleDark =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.titleDark, fontFamily: AppFontFamily.hankenGroteskMedium);
  TextStyle hanKenF12W5bodyDark =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.bodyDark, fontFamily: AppFontFamily.hankenGroteskMedium);
  TextStyle hanKenF16W4bodyDark =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.bodyDark, fontFamily: AppFontFamily.hankenGroteskReguler);

  // Medium Text Style

  TextStyle SansRegF12W5Primary = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.titleDark, height: 1.5, fontFamily: AppFontFamily.hankenGroteskReguler);

  // Bold Text Style

  TextStyle spaceF12W7Primary = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.titleDark, height: 1.5, fontFamily: AppFontFamily.hankenGroteskReguler);
}
