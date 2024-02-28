import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/signup/controller/business_account_controller.dart';
import 'package:local/modules/vendor/businessdetails/controller/what_kindof_business_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class WhatKindOfBusinessScreen extends StatelessWidget {
  WhatKindOfBusinessScreen({Key? key}) : super(key: key);
  final WhatKindOfBusinessController whatKindOfBusinessController = Get.put(WhatKindOfBusinessController());
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () => Navigation.pop(),
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
                text: AppString.whatKindOfBusinessTitle,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 28.sp,
              ),
              RichText(
                text: TextSpan(
                  text: AppString.whatKindOfBusinessDescription,
                  style: TextStyle(
                    color: AppColors.bodyDark,
                    height: 1.6,
                    fontSize: 14.sp,
                  ),
                  children: [
                    TextSpan(
                      // text: " ${AppString.whatKindOfBusinessDescription2}",
                      text: " ${createBusinessAccountController.businessNameController.text}",
                      style: TextStyle(fontWeight: FontWeight.w500, height: 1.6, fontSize: 14.sp, color: AppColors.titleDark),
                    ),
                    TextSpan(
                      text: " ${AppString.whatKindOfBusinessDescription3}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                        fontSize: 14.sp,
                        color: AppColors.bodyDark,
                      ),
                    )
                  ],
                ),
              ).paddingOnly(top: 5.h, bottom: 16.h),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(bottom: 40.h),
              CommonText(
                text: AppString.businessCategories,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              CustomTextField(
                filled: true,
                hintText: AppString.enterCategories,
                // controller: createBusinessAccountController.businessNameController,
                controller: whatKindOfBusinessController.searchController,
                fillColor: AppColors.whiteColor.withOpacity(0.1),
                onChanged: (value) {
                  print("whatKindOfBusinessController.isDisplay.value ---> ${whatKindOfBusinessController.isDisplay.value}");
                  print("whatKindOfBusinessController.searchController ---> ${whatKindOfBusinessController.searchController.text}");

                  whatKindOfBusinessController.isDisplay.value = true;
                  if (value.isEmpty) whatKindOfBusinessController.isDisplay.value = false;
                  whatKindOfBusinessController.isDisplay.refresh();
                  print("whatKindOfBusinessController.isDisplay.value ---> ${whatKindOfBusinessController.isDisplay.value}");
                },
              ).paddingOnly(top: 10.h, bottom: 12.h),
              Obx(() => (whatKindOfBusinessController.isDisplay.value)
                  ? SizedBox(
                      height: 290.h,
                      child: ListView.builder(
                        itemCount: whatKindOfBusinessController.services.length,
                        itemBuilder: (BuildContext context, int index) {
                          String key = whatKindOfBusinessController.services.keys.elementAt(index);
                          List<String> subServices = whatKindOfBusinessController.services[key]!;
                          List<String> filteredSubServices = subServices
                              .where((subService) =>
                                  whatKindOfBusinessController.searchController.text.isEmpty ||
                                  ("$key - $subService").toLowerCase().contains(whatKindOfBusinessController.searchController.text.toLowerCase()))
                              .toList();

                          if (filteredSubServices.isEmpty) {
                            return SizedBox.shrink(); // Hide the entire section if no matching sub-service
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...filteredSubServices.map((subService) {
                                return InkWell(
                                    onTap: () {
                                      whatKindOfBusinessController.selectService(subService, key);
                                      whatKindOfBusinessController.searchController.clear();

                                      print("whatKindOfBusinessController.isDisplay.value ---> ${whatKindOfBusinessController.isDisplay.value}");
                                      whatKindOfBusinessController.isDisplay.value = false;
                                      print("whatKindOfBusinessController.isDisplay.value ---> ${whatKindOfBusinessController.isDisplay.value}");
                                    },
                                    child: Text(
                                      "$key - $subService",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: whatKindOfBusinessController.selectedServices.contains(subService)
                                            ? AppColors.primaryDefaultColor
                                            : Colors.white,
                                      ),
                                    ));
                              }).toList(),
                            ],
                          );
                        },
                      ),
                    )
                  : Wrap(
                      spacing: 8.0,
                      children: whatKindOfBusinessController.selectedServices.map((service) {
                        String key = whatKindOfBusinessController.services.keys
                            .firstWhere((key) => whatKindOfBusinessController.services[key]!.contains(service), orElse: () => "");
                        return GestureDetector(
                          onTap: () => whatKindOfBusinessController.selectService(service, key),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryDefaultColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  key,
                                  style: TextStyle(fontSize: 14.0, color: AppColors.titleDark),
                                ),
                                SizedBox(width: 4.w),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 13.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  service,
                                  style: TextStyle(
                                    color: AppColors.titleDark,
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Icon(
                                  Icons.clear,
                                  size: 18.sp,
                                  color: AppColors.titleDark,
                                ),
                              ],
                            ),
                          ).paddingOnly(bottom: 10, top: 5),
                        );
                      }).toList(),
                    )),
              CustomButton(
                onTap: () {
                  if (whatKindOfBusinessController.selectedServices.isNotEmpty) {
                    // Navigation.pushNamed(Routes.businessAddress);
                    Navigation.pushNamed(Routes.businessAddress);
                  } else {
                    // For example:
                    Get.snackbar(
                      "Error",
                      "Please select at least one category.",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                text: AppString.Continue,
              ).paddingOnly(bottom: 16.h),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
  }
}
