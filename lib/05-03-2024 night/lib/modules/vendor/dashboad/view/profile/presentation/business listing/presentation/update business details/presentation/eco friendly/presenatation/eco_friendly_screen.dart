import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/businessdetails/controller/business_eco_friendly_controller.dart';
import 'package:local/modules/vendor/businessdetails/controller/business_features_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/common_feature_card.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class EcoFriendlyScreen extends StatelessWidget {
  EcoFriendlyScreen({Key? key}) : super(key: key);

  BusinessFeaturesController businessFeaturesController = Get.put(BusinessFeaturesController());

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
          text: AppString.ecoFriendly,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            fontSize: 12.sp,
            text: AppString.businessEcoFriendly1,
            fontWeight: FontWeight.w600,
          ),
          // DropdownButtonFormField<String>(
          //   dropdownColor: AppColors.appColor,
          //   icon: Image.asset(
          //     ImagesAsset.downArrow,
          //     height: 8.h,
          //     color: AppColors.titleDark,
          //   ).paddingOnly(right: 5.w),
          //   decoration: InputDecoration(
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(width: 1, color: Colors.transparent),
          //       borderRadius: BorderRadius.circular(4.r),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderSide: BorderSide(width: 1, color: Colors.transparent),
          //       borderRadius: BorderRadius.circular(4.r),
          //     ),
          //     contentPadding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
          //     fillColor: AppColors.whiteColor.withOpacity(0.1),
          //     filled: true,
          //   ),
          //   hint: GetBuilder<BusinessFeaturesController>(
          //     builder: (controller) {
          //       return Text(
          //         AppString.selectEcoFriendly,
          //         style: TextStyle(
          //           color: AppColors.titleDark,
          //           fontWeight: FontWeight.w500,
          //           fontSize: 14.sp,
          //         ),
          //       );
          //     },
          //   ),
          //   value: businessEcoFriendlyController.dropdownValue?.value,
          //   onChanged: (String? newValue) {
          //     businessEcoFriendlyController.dropdownValue?.value = newValue!;
          //     if (!businessEcoFriendlyController.selectedOptions.contains(newValue)) {
          //       businessEcoFriendlyController.addSelectedOption(newValue!);
          //     }
          //   },
          //   items: businessEcoFriendlyController.list.map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(
          //         value,
          //         style: TextStyle(
          //           color: AppColors.bodyDark,
          //           fontWeight: FontWeight.w500,
          //           fontSize: 14.sp,
          //         ),
          //       ),
          //     );
          //   }).toList(),
          // ).paddingOnly(top: 10.h, bottom: 13.h),
          DropdownButtonFormField<String>(
            dropdownColor: AppColors.appColor,
            icon: Image.asset(
              ImagesAsset.downArrow,
              height: 6.h,
              color: AppColors.bodyDark,
            ).paddingOnly(right: 5.w),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.circular(4.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.circular(4.r),
              ),
              contentPadding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
              fillColor: AppColors.whiteColor.withOpacity(0.1),
              filled: true,
            ),
            hint: GetBuilder<BusinessFeaturesController>(
              builder: (controller) {
                return Text(
                  AppString.selectFeatures,
                  style: TextStyle(
                    color: AppColors.bodyDark,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                );
              },
            ),
            value: businessFeaturesController.dropdownValue?.value,
            onChanged: (String? newValue) {
              businessFeaturesController.dropdownValue?.value = newValue!;
              if (!businessFeaturesController.selectedOptions.contains(newValue)) {
                businessFeaturesController.addSelectedOption(newValue!);
              }
            },
            items: businessFeaturesController.list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: AppColors.bodyDark,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              );
            }).toList(),
          ).paddingOnly(top: 10.h, bottom: 13.h),

          Obx(
                () => Wrap(
              spacing: 8.0,
              children: businessFeaturesController.selectedOptions.map((option) {
                return GestureDetector(
                  onTap: () {
                    businessFeaturesController.removeSelectedOption(option);
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
                        SizedBox(width: 4.w),
                        Text(
                          option,
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
            ),
          ).paddingOnly(bottom: 24.h),
          CommonText(
            fontSize: 18.sp,
            text: AppString.businessFeatures1,
            fontWeight: FontWeight.w600,
          ).marginOnly(bottom: 16.h),
          FeatureCard(
            title: AppString.casual, image: IconAsset.coin,
          ),
          FeatureCard(
            title: AppString.offersCatering, image: IconAsset.cash,
          ),
          const Spacer(),
          CustomButton(
            onTap: () {
            },
            text: AppString.save,
          ),
        ],
      ).paddingAll(16.r),
    );
  }
}
