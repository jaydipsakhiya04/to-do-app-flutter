import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/social_authentication/app_validations.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_button.dart';
import 'package:flutter_template/widget/custom_textfeild.dart';
import 'package:get/get_utils/get_utils.dart';


class CommonPasswordDialog extends StatelessWidget {
  final VoidCallback? onTap;
  final TextEditingController controller;
  final VoidCallback? onTapBack;

  const CommonPasswordDialog({
    Key? key,
    required this.onTap,
    required this.controller,
    required this.onTapBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2.r),
        ),
      ),
      backgroundColor: AppColors.white,
      child: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: AppString.inputPwd,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.darkBlue,
            ),
            24.h.verticalSpace,
            CustomTextField(
              contentPadding: EdgeInsets.symmetric(vertical: 14.h),
              controller: controller,
              prefixImage: ImageAsset.lock,
              hintText: AppString.enterPassword,
              validator: (value) => AppValidation.validatePassword(value),
            ),
            40.h.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    buttonColor: AppColors.white,
                    buttonBorderColor: AppColors.darkBlue,
                    textColor: AppColors.darkBlue,
                    text: AppString.cancel,
                    needBorderColor: true,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    onTap: onTapBack,
                  ),
                ),
                16.w.horizontalSpace,
                Expanded(
                  child: CustomButton(
                    onTap: onTap,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    buttonColor: AppColors.orange,
                    textColor: AppColors.white,
                    needBorderColor: false,
                    text: AppString.ok,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(vertical: 40.h, horizontal: 16.w),
      ),
    );
  }
}
