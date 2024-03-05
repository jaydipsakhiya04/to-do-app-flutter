import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/custom_textfield.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class CategoriesEditScreen extends StatelessWidget {
  const CategoriesEditScreen({Key? key}) : super(key: key);

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
          text: AppString.updateBusinessCategories,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppString.businessCategories,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ).paddingOnly(top: 5.h, bottom: 16.h),

            ///   Categories Services section
            Container(
              height: 300.h,
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.whiteColor.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 343.w,
                    child: Row(
                      children: [
                        Text(
                          "Restaurants",
                          style: TextStyle(
                            color: AppColors.titleDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        Image.asset(
                          ImagesAsset.rightArrow,
                          scale: 3,
                        ),
                        Text(
                          "American",
                          style: TextStyle(
                            color: AppColors.titleDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        // for (String service in whatKindOfBusinessController.selectedServices)
                        //   ..._buildSubcategories(service, ""),
                      ],
                    ).paddingOnly(
                      top: 12.5.h,
                    ),
                  ),
                  CommonText(
                    text: "Select Service",
                    color: AppColors.bodyDark,
                  ).paddingOnly(
                    top: 12.5.h,
                  ),

                  Wrap(
                    spacing: 0.2,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Advertising services",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Brand Management",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Digital Marketing",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
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
                              "American",
                              style: TextStyle(
                                color: AppColors.titleDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.clear,
                              color: AppColors.titleDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Advertising services",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Brand Management",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
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
                  ).paddingOnly(top: 12.5.h, bottom: 12.h),
                ],
              ),
            ).paddingOnly(bottom: 28.h),
            Container(
              height: 300.h,
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.whiteColor.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 343.w,
                    child: Row(
                      children: [
                        // for (String key in whatKindOfBusinessController.selectedkey)
                        //   ..._buildSubcategories("", key),
                        // Use toString() to convert Key? to String, and handle null with null-aware operator
                        Text(
                          "Restaurants",
                          style: TextStyle(
                            color: AppColors.titleDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        Image.asset(
                          ImagesAsset.rightArrow,
                          scale: 3,
                        ),
                        Text(
                          "American",
                          style: TextStyle(
                            color: AppColors.titleDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        // for (String service in whatKindOfBusinessController.selectedServices)
                        //   ..._buildSubcategories(service, ""),
                      ],
                    ).paddingOnly(
                      top: 12.5.h,
                    ),
                  ),
                  CommonText(
                    text: "Select Service",
                    color: AppColors.bodyDark,
                  ).paddingOnly(
                    top: 12.5.h,
                  ),
                  Wrap(
                    spacing: 0.2,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Advertising services",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Brand Management",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Digital Marketing",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
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
                              "Breakfast & Brunch",
                              style: TextStyle(
                                color: AppColors.titleDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.clear,
                              color: AppColors.titleDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Advertising services",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.bodyDark),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Brand Management",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.add,
                              color: AppColors.bodyDark,
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 10, top: 5, right: 8.w),
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
                  ).paddingOnly(top: 12.5.h, bottom: 12.h),
                ],
              ),
            ).paddingOnly(bottom: 28.h),
            CommonTextField(hintText: "Enter categories",label: "Add categories",suffix: SizedBox.shrink(),),

            CustomButton(
              onTap: () {},
              text: AppString.save,
            ).paddingOnly(bottom: 26.h),
          ],
        ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
      ),
    );
  }
}
