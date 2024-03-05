import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/businessdetails/controller/restaurant_photos_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/controller/business_listing_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class UpdateImageScreen extends StatelessWidget {
  UpdateImageScreen({Key? key}) : super(key: key);
  RestaurantPhotoController restaurantPhotoController = Get.find();
  BusinessListingController _businessListingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
          onPressed: () {
            Navigation.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        titleSpacing: -8,
        title: CommonText(
          text: AppString.updateImage,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<RestaurantPhotoController>(
            init: RestaurantPhotoController(),
            builder: (controller) => Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: _businessListingController.image.length + 1 + controller.imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_businessListingController.image.length > index) {
                    return Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: Padding(
                            padding: EdgeInsets.all(2.r),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.asset(
                                _businessListingController.image[index],
                                fit: BoxFit.cover, // Maintain image aspect ratio and cover entire space
                              ).paddingAll(8.r),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: GestureDetector(
                            onTap: () => null,
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
                  return Obx(
                        () => controller.imagePaths.isNotEmpty &&
                        _businessListingController.image.length - 1 + controller.imagePaths.length >= index
                        ? Stack(
                      children: [
                        GestureDetector(
                          onTap: () => print('Tapped image at index $index'),
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.file(
                                  File(controller.imagePaths[index - _businessListingController.image.length]),
                                  fit: BoxFit.cover, // Maintain image aspect ratio and cover entire space
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
                    )
                        : GestureDetector(
                      onTap: controller.pickImage,
                      child: Padding(
                        padding: EdgeInsets.all(14.r),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.darkBackGroundHome,
                          ),
                          padding: EdgeInsets.all(8.sp),
                          child: Image.asset(
                            ImagesAsset.plus,
                            scale: 4.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          CustomButton(
            onTap: () {},
            text: AppString.save,
          ).paddingOnly(
            top: 10.h,
          ),
        ],
      ).paddingOnly(left: 16.w, right: 16.w, top: 32.h, bottom: 16.h),
    );
  }
}
