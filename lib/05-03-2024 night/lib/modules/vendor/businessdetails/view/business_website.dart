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
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class BusinessWebsiteScreen extends StatelessWidget {
  BusinessWebsiteScreen({Key? key}) : super(key: key);
  final CreateBusinessAccountController createBusinessAccountController = Get.find();

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
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          onTap: () {
            // Handle back button tap
            Navigator.pop(context);
            // Dismiss the keyboard if it's open
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.businessWebsiteTitle,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 28.sp,
              ),
              CommonText(
                text: AppString.businessWebsiteDescription,
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
                text: AppString.website,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              CustomTextField(
                filled: true,
                hintText: AppString.enterWebsite,
                controller: createBusinessAccountController.websiteController,
                fillColor: AppColors.whiteColor.withOpacity(0.1),
              ).paddingOnly(top: 10.h, bottom: 25.h),
              CustomButton(
                onTap: () {
                  if (createBusinessAccountController.websiteController.text.isNotEmpty) {
                    Navigation.pushNamed(Routes.whatKindOfBusiness);
                  }
                },
                text: AppString.Continue,
              ),
              Center(
                child: GestureDetector(
                  onTap: () => Navigation.pushNamed(Routes.whatKindOfBusiness),
                  child: CommonText(
                    text: AppString.iDontHaveAWebsite,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ).paddingOnly(top: 24.h),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
  }
}
