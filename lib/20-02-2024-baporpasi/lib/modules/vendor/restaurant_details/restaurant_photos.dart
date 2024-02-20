import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/businessdetails/controller/restaurant_photos_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class RestaurantPhotosScreen extends StatelessWidget {
  RestaurantPhotosScreen({Key? key}) : super(key: key);
  RestaurantPhotoController restaurantPhotoController = Get.put(RestaurantPhotoController());
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
        appBar: CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppString.restaurantsPhotos,
              fontWeight: FontWeight.w500,
              height: 1.5,
              fontSize: 28.sp,
            ),
            CommonText(
              text: AppString.restaurantsPhotosDescription,
              fontWeight: FontWeight.w500,
              height: 1.5,
              fontSize: 14.sp,
              color: AppColors.bodyDark,
            ).paddingOnly(top: 5.h, bottom: 16.h),
            Image.asset(
              ImagesAsset.waveImage,
              width: 271.w,
            ).paddingOnly(bottom: 40.h),

            ///   Categories Services section
            GetBuilder<RestaurantPhotoController>(
              init: RestaurantPhotoController(),
              builder: (controller) => Expanded(
                child: GridView.builder(
                  // shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: controller.imagePaths.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == controller.imagePaths.length) {
                      return GestureDetector(
                        onTap: controller.pickImage,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.whiteColor.withOpacity(0.2),
                            ),
                            padding: EdgeInsets.all(8.sp),
                            child: Image.asset(
                              ImagesAsset.plus,
                              scale: 2.sp,
                            ).paddingSymmetric(horizontal: 30.w),
                          ),
                        ),
                      );
                    } else {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () => print('Tapped image at index $index'),
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(controller.imagePaths[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            right: 12,
                            child: GestureDetector(
                              onTap: () => controller.removeImage(index),
                              child: Container(
                                height: 20.h,
                                width: 20.w,
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent,
                                ),
                                child: Image.asset(
                                  ImagesAsset.delete,
                                  width: 16.w,
                                  height: 16.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),

            // Spacer(),
            CustomButton(
              onTap: () {
                restaurantPhotoController.isAddMenuPhoto.value = false;
                Navigation.pushNamed(Routes.restaurantMenu);
              },
              text: AppString.saveContinue,
            ),
          ],
        ).paddingOnly(left: 16.w, right: 16.w, top: 32.h, bottom: 16.h),
      ),
    );
  }
}
