import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/businessdetails/controller/business_eco_friendly_controller.dart';
import 'package:local/modules/vendor/businessdetails/controller/business_features_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class BusinessServiceScreen extends StatelessWidget {
  BusinessServiceScreen({Key? key}) : super(key: key);
  final TextEditingController serviceController = TextEditingController();
  final RxList<String> tags = <String>[].obs;

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
          isTrailing: true,
          trailingWidget: CustomTrailingWidget(
            onTap: () {
              Navigation.pushNamed(Routes.bookingPrice);
            },
            text: AppString.skip,
            imageAsset: ImagesAsset.rightArrow,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.businessService,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 28.sp,
              ),
              CommonText(
                text: AppString.busniessDescription,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 14.sp,
                color: AppColors.bodyDark,
              ).paddingOnly(
                top: 5.h,
                bottom: 16.h,
              ),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(
                bottom: 40.h,
              ),
              CommonText(
                fontSize: 12.sp,
                text: AppString.businessService,
                fontWeight: FontWeight.w600,
              ).paddingOnly(bottom: 8.h),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        filled: true,
                        fillColor: AppColors.whiteColor.withOpacity(0.1),
                        controller: serviceController,
                        hintText: AppString.enterService,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final text = serviceController.text.trim();
                        if (text.isNotEmpty) {
                          tags.add(text);
                          serviceController.clear();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.whiteColor.withOpacity(0.1),
                            ),
                            padding: EdgeInsets.all(8.sp),
                            child: Image.asset(
                              ImagesAsset.plus,
                              scale: 3.sp,
                              color: AppColors.titleDark,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => Wrap(
                    spacing: 8.w,
                    children: tags
                        .map((tag) => GestureDetector(
                              onTap: () {
                                tags.remove(tag);
                                tags.refresh();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryDefaultColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CommonText(
                                      text: tag,
                                      fontSize: 14.sp,
                                      color: AppColors.titleDark,
                                      fontWeight: FontWeight.w400,
                                    ).paddingOnly(right: 5.w),
                                    Image.asset(ImagesAsset.cross, scale: 3)
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  )).paddingOnly(bottom: (tags.length > 1) ? 1.h : 24.h),
              CustomButton(
                onTap: () {
                  Navigation.pushNamed(Routes.bookingPrice);
                },
                text: AppString.saveContinue,
              ),
            ],
          ).paddingOnly(right: 16.w, left: 16.w, top: 32.h, bottom: 16.h),
        ),
      ),
    );
  }
}
