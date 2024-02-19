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
              Container(
                height: 214.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.whiteColor.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Iterate over each selected service and display its subcategories

                        for (String service in whatKindOfBusinessController.selectedServices) ..._buildSubcategories(service, ""),
                        // for (String key in whatKindOfBusinessController.selectedkey)
                        //   ..._buildSubcategories("", key), // Use toString() to convert Key? to String, and handle null with null-aware operator
                      ],
                    ),
                  ),
                ),
              ).paddingOnly(bottom: 16.h),
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
