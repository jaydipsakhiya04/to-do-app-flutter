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
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class BusinessCategoriesServicesScreen extends StatelessWidget {
  BusinessCategoriesServicesScreen({Key? key}) : super(key: key);

  final WhatKindOfBusinessController whatKindOfBusinessController = Get.find();

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
            // Handle onTap action
          },
          isTrailing: true,
          trailingWidget: CustomTrailingWidget(
            onTap: () {
              Navigation.pushNamed(Routes.restaurantPhotos);
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
                text: AppString.categoriesServices,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 28.sp,
              ),
              CommonText(
                text: AppString.categoriesServicesDescription,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 14.sp,
                color: AppColors.bodyDark,
              ).paddingOnly(top: 5.h, bottom: 16.h),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(bottom: 40.h),
              CommonText(
                text: AppString.businessCategories,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ).paddingOnly(top: 5.h, bottom: 16.h),

              ///   Categories Services section
              // Container(
              //   height: 214.h,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.r),
              //     color: AppColors.whiteColor.withOpacity(0.1),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(18.0),
              //     child: SingleChildScrollView(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           // Iterate over each selected service and display its subcategories
              //
              //           for (String service in whatKindOfBusinessController.selectedServices) ..._buildSubcategories(service, ""),
              //           // for (String key in whatKindOfBusinessController.selectedkey)
              //           //   ..._buildSubcategories("", key), // Use toString() to convert Key? to String, and handle null with null-aware operator
              //         ],
              //       ),
              //     ),
              //   ),
              // ).paddingOnly(bottom: 16.h),
              Container(
                height: 214.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.whiteColor.withOpacity(0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        for (String key in whatKindOfBusinessController.selectedkey)
                          ..._buildSubcategories("", key), // Use toString() to convert Key? to String, and handle null with null-aware operator
                        Icon(
                          Icons.arrow_right,
                          color: AppColors.titleDark,
                        ).paddingOnly(right: 9.w, left: 9.w),
                        for (String service in whatKindOfBusinessController.selectedServices) ..._buildSubcategories(service, ""),
                      ],
                    ).paddingOnly(top: 12.5.h, left: 12.w),
                    CommonText(
                      text: "Selected Service",
                    ).paddingOnly(top: 12.5.h, left: 12.w),
                    Row(
                      children: [
                        Wrap(
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
                                      service,
                                      style: TextStyle(
                                        color: AppColors.titleDark,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Icon(
                                      Icons.clear,
                                      color: AppColors.titleDark,
                                    ),
                                  ],
                                ),
                              ).paddingOnly(bottom: 10, top: 5),
                            );
                          }).toList(),
                        ).paddingOnly(top: 12.5.h, left: 12.w),
                        Wrap(
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
                                      "Brand Management",
                                      style: TextStyle(
                                        color: AppColors.titleDark,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Icon(
                                      Icons.clear,
                                      color: AppColors.titleDark,
                                    ),
                                  ],
                                ),
                              ).paddingOnly(bottom: 10, top: 5),
                            );
                          }).toList(),
                        ).paddingOnly(top: 12.5.h, left: 12.w),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: "Show More (07)",
                          color: AppColors.titleDark,
                        ),
                        CommonText(
                          text: "Remove",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent,
                        ),
                      ],
                    ).paddingOnly(top: 12.5.h, left: 12.w, right: 12.w, bottom: 12.h),
                  ],
                ),
              ).paddingOnly(bottom: 28.h),

              CustomButton(
                onTap: () {
                  Navigation.pushNamed(Routes.restaurantPhotos);
                },
                text: AppString.saveContinue,
              ),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
  }

  // Method to build subcategory widgets for a given service
  List<Widget> _buildSubcategories(String service, String key) {
    List<String> subcategories = whatKindOfBusinessController.services[service] ?? [];
    return [
      SizedBox(height: 20),
      Row(
        children: [
          Text(key, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.titleDark)),
          Text(service, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.titleDark)),
        ],
      ),
      SizedBox(height: 10),
      // Display subcategories for the service
      for (String subcategory in subcategories)
        GestureDetector(
          onTap: () {
            // Handle subcategory selection if needed
          },
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
                Text(subcategory, style: TextStyle(color: AppColors.titleDark, fontSize: 14.0)),
                SizedBox(width: 8.0),
                Icon(Icons.clear, color: AppColors.titleDark),
              ],
            ),
          ).paddingOnly(bottom: 10, top: 5),
        ),
    ];
  }
}
