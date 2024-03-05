import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/signup/controller/business_account_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class BusinessNameScreen extends StatelessWidget {
  BusinessNameScreen({Key? key}) : super(key: key);
  final CreateBusinessAccountController createBusinessAccountController = Get.find();
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              // Handle back button tap
              Navigator.pop(context);
              // Dismiss the keyboard if it's open
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
            child: Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.circular(8.89.r),
                border: Border.all(
                  width: 1.25,
                  color: AppColors.borderColor.withOpacity(0.2),
                ),
              ),
              child: Center(
                child: Image.asset(
                  IconAsset.backIcon,
                  height: 15.h,
                  width: 9.w,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.businessNameTitle,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 28.sp,
              ),
              CommonText(
                text: AppString.businessNameDescription,
                fontWeight: FontWeight.w400,
                height: 1.6,
                fontSize: 14.sp,
                color: AppColors.bodyDark,
              ).paddingOnly(top: 5.h, bottom: 16.h),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(bottom: 40.h),
              CommonText(
                text: AppString.businessName,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              CustomTextField(
                filled: true,
                hintText: AppString.enterBusinessName,
                controller: createBusinessAccountController.businessNameController,
                fillColor: AppColors.whiteColor.withOpacity(0.1),
              ).paddingOnly(top: 10.h, bottom: 25.h),
              CustomButton(
                onTap: () {
                  // createBusinessAccountController.businessNameController.clear();
                  if (createBusinessAccountController.businessNameController.text.isNotEmpty) {
                    Navigation.pushNamed(Routes.businessPhone);
                  }
                },
                text: AppString.Continue,
              ),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
  }
}
