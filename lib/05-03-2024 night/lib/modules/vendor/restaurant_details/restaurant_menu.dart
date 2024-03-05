import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/businessdetails/controller/restaurant_photos_controller.dart';
import 'package:local/modules/vendor/businessdetails/controller/restaurant_menu_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class RestaurantMenuScreen extends StatelessWidget {
  RestaurantMenuScreen({Key? key}) : super(key: key);

  final RestaurantMenuController restaurantMenuController = Get.find();
  final RestaurantPhotoController restaurantPhotoController = Get.find();
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
              Navigation.pushNamed(Routes.paymentAccept);
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
                text: AppString.restaurantsMenu,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 28.sp,
              ),
              CommonText(
                text: AppString.restaurantsMenuDescription,
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
                text: AppString.addMenuPhotos,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ).paddingOnly(bottom: 8.h),
              DottedBorder(
                dashPattern: [6, 3, 0, 5],
                color: AppColors.whiteColor.withOpacity(0.3),
                strokeWidth: 2,
                child: SizedBox(
                  width: 343.w,
                  height: 114.h,
                  child: Center(
                    child: (restaurantPhotoController.isAddMenuPhoto.value)
                        ? GestureDetector(
                            onTap: () {},
                            child: CommonText(
                              text: "+ ${AppString.addMenuPhotos}",
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          )
                        : GetBuilder<RestaurantMenuController>(
                            init: RestaurantMenuController(),
                            builder: (restaurantMenuController) => Row(
                                  children: [
                                    Container(
                                      width: restaurantMenuController.imagePaths.isEmpty
                                          ? 0
                                          : restaurantMenuController.imagePaths.length == 1
                                              ? 115.w
                                              : 220.w,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: restaurantMenuController.imagePaths.length == 1
                                            ? const NeverScrollableScrollPhysics()
                                            : const BouncingScrollPhysics(),
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                              restaurantMenuController.imagePaths.length,
                                              (index) => Stack(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => print('Tapped image at index $index'),
                                                    child: AspectRatio(
                                                      aspectRatio: 1.0,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(8),
                                                        child: Image.file(
                                                          File(restaurantMenuController.imagePaths[index]),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ).paddingOnly(top: 10.h, bottom: 10.h, left: 8.w, right: 8.w),
                                                  Positioned(
                                                    top: 12.h,
                                                    right: 12.w,
                                                    child: GestureDetector(
                                                      onTap: () => restaurantMenuController.removeImage(index),
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: restaurantMenuController.pickImage,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 6.w, right: 6.w),
                                        child: Container(
                                          height: 98.h,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.r),
                                            color: AppColors.whiteColor.withOpacity(0.1)
                                          ),
                                          child:  Icon(
                                            Icons.add,
                                            color: AppColors.middleGrey,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )).paddingOnly(left: 10.w),
                  ),
                ),
              ).paddingOnly(bottom: 12.h),
              CommonText(
                text: AppString.title,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              CustomTextField(
                filled: true,
                fillColor: AppColors.whiteColor.withOpacity(0.1),
                controller: restaurantMenuController.titleController,
                hintText: AppString.enterTitle,
                keyboardType: TextInputType.emailAddress,
              ).paddingOnly(top: 10.h, bottom: 18.h),
              CommonText(
                text: AppString.price,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              CustomTextField(
                filled: true,
                fillColor: AppColors.whiteColor.withOpacity(0.1),
                controller: restaurantMenuController.priceController,
                hintText: AppString.enterPrice,
                keyboardType: TextInputType.emailAddress,
              ).paddingOnly(top: 10.h, bottom: 18.h),
              CommonText(
                text: AppString.category,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              DropdownButtonFormField<String>(
                icon: Image.asset(
                  ImagesAsset.downArrow,
                  height: 6.h,
                  color: AppColors.bodyDark,
                ).paddingOnly(right: 5.w),
                decoration: InputDecoration(
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.blackColor), borderRadius: BorderRadius.circular(4.r)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.blackColor,
                      ),
                      borderRadius: BorderRadius.circular(4.r)),
                  contentPadding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  filled: true,
                ),
                hint: GetBuilder<RestaurantMenuController>(
                  builder: (controller) {
                    return Text(
                      AppString.selectCategory,
                      style: TextStyle(
                        color: AppColors.bodyDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    );
                  },
                ),
                value: restaurantMenuController.dropdownValue?.value,
                onChanged: (String? newValue) {
                  restaurantMenuController.dropdownValue?.value = newValue!;
                },
                items: restaurantMenuController.list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: AppColors.bodyDark),
                    ),
                  );
                }).toList(),
              ).paddingOnly(top: 10.h,bottom: 10.h),
              CommonText(
                text: AppString.details,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              CustomTextField(
                filled: true,
                maxLine: 3,
                fillColor: AppColors.whiteColor.withOpacity(0.1),
                controller: restaurantMenuController.priceController,
                hintText: AppString.enterDetails,
                keyboardType: TextInputType.emailAddress,
              ).paddingOnly(top: 10.h, bottom: 18.h),

              // Spacer(),
              CustomButton(
                onTap: () {
                  // Navigation.pushNamed(Routes.businessCategoriesServices);
                  Navigation.pushNamed(Routes.paymentAccept);
                },
                text: AppString.saveContinue,
              ),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h, bottom: 16.h),
        ),
      ),
    );
  }
}
