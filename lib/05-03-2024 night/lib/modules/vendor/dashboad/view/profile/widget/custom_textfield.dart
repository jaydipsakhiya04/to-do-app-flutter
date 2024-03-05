import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/widget/common_text.dart';

class CommonTextField extends StatelessWidget {
  Widget? suffix;
  String hintText;
  String? label;
  TextInputType? keyboardType;
  TextEditingController? controller;
  bool? obscureText;
  void Function()? onTap;
  Color? textColor;
  int? maxLines;
  int? minLines;
  String? initialValue;
  EdgeInsets? contentPadding;

  CommonTextField({
    Key? key,
    this.suffix,
    required this.hintText,
    this.label,
    this.controller,
    this.obscureText,
    this.onTap,
    this.keyboardType,
    this.textColor,
    this.maxLines,
    this.minLines,
    this.initialValue,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: label ?? "",
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
        8.h.verticalSpace,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.darkBackGroundHome,
          ),
          child: TextFormField(
            initialValue: initialValue,
            maxLines: maxLines,
            minLines: minLines,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            obscuringCharacter: "*",
            controller: controller,
            style: TextStyle(color: AppColors.titleDark),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                suffixIcon: GestureDetector(
                  onTap: onTap,
                  child: suffix ??
                      CommonText(
                        text: AppString.change,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      ).paddingOnly(top: 18.h, right: 10.w),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: textColor ?? AppColors.titleDark,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ],
    ).marginOnly(bottom: 16.h);
  }
}
