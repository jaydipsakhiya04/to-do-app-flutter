import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/signup/controller/enter_user_details_controller.dart';
import 'package:local/modules/splash/controller/splash_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class EnterUserDetailsScreen extends StatelessWidget {
  EnterUserDetailsScreen({Key? key}) : super(key: key);
  final EnterUserDetailsController enterUserDetailsController = Get.put(EnterUserDetailsController());
  SplashController splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImagesAsset.bgImage),
        ),
      ),
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Colors.transparent,
        body: Form(
          key: enterUserDetailsController.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w500,
                  text: AppString.greatCreateYourAccount,
                ),
                CommonText(
                  height: 1.5.h,
                  fontSize: 14.sp,
                  color: AppColors.bodyDark,
                  fontWeight: FontWeight.w400,
                  text: AppString.greatCreateYourAccountDescription,
                ).paddingOnly(top: 12.h, bottom: 18.h),
                Image.asset(
                  width: 271.h,
                  fit: BoxFit.fill,
                  ImagesAsset.waveImage,
                ).paddingOnly(bottom: 40.h),
                CommonText(
                  fontSize: 12.sp,
                  text: AppString.firstName,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextField(
                  filled: true,
                  hintText: AppString.enterFirstName,
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  controller: enterUserDetailsController.firstNameController,
                ).paddingOnly(top: 10.h, bottom: 13.h),
                CommonText(
                  fontSize: 12.sp,
                  text: AppString.lastName,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextField(
                  filled: true,
                  hintText: AppString.enterLastName,
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  controller: enterUserDetailsController.lastNameController,
                ).paddingOnly(top: 10.h, bottom: 13.h),
                CommonText(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  text: AppString.emailAddress,
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  controller: enterUserDetailsController.emailController,
                  hintText: AppString.enterEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      if (enterUserDetailsController.isEmailFieldTouched) {
                        return 'Please enter your email';
                      }
                    } else if (!enterUserDetailsController.isEmailValidValue.value && enterUserDetailsController.isEmailFieldTouched) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ).paddingOnly(top: 10.h, bottom: 24.h),
                CustomButton(
                  onTap: () {
                    // enterUserDetailsController.firstNameController.clear();
                    // enterUserDetailsController.lastNameController.clear();
                    // enterUserDetailsController.emailController.clear();
                    if (enterUserDetailsController.firstNameController.text.isNotEmpty ||
                        enterUserDetailsController.lastNameController.text.isNotEmpty ||
                        enterUserDetailsController.emailController.text.isNotEmpty) {
                      if (enterUserDetailsController.formKey.currentState!.validate()) {
                        print("vanDor Value ----> PhoneOtp to redirect ---> ${splashController.isVandor.value}");
                        Navigation.pushNamed(Routes.birthDate);
                        enterUserDetailsController.firstNameController.clear();
                        enterUserDetailsController.lastNameController.clear();
                        enterUserDetailsController.emailController.clear();
                      }
                    }
                  },
                  text: AppString.Continue,
                ).paddingOnly(bottom: 40.h),
              ],
            ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
          ),
        ),
      ),
    );
  }
}
