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

class BusinessEcoFriendlyScreen extends StatelessWidget {
  BusinessEcoFriendlyScreen({Key? key}) : super(key: key);
  BusinessEcoFriendlyController businessEcoFriendlyController = Get.put(BusinessEcoFriendlyController());

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
              Navigation.pushNamed(Routes.businessService);
            },
            text: AppString.skip,
            imageAsset: ImagesAsset.rightArrow,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppString.businessEcoFriendly,
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
              text: AppString.businessEcoFriendly1,
              fontWeight: FontWeight.w600,
            ),
            DropdownButtonFormField<String>(
              dropdownColor: AppColors.appColor,
              icon: Image.asset(
                ImagesAsset.downArrow,
                height: 8.h,
                color: AppColors.titleDark,
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
                    AppString.selectEcoFriendly,
                    style: TextStyle(
                      color: AppColors.titleDark,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  );
                },
              ),
              value: businessEcoFriendlyController.dropdownValue?.value,
              onChanged: (String? newValue) {
                businessEcoFriendlyController.dropdownValue?.value = newValue!;
                if (!businessEcoFriendlyController.selectedOptions.contains(newValue)) {
                  businessEcoFriendlyController.addSelectedOption(newValue!);
                }
              },
              items: businessEcoFriendlyController.list.map<DropdownMenuItem<String>>((String value) {
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
                children: businessEcoFriendlyController.selectedOptions.map((option) {
                  return GestureDetector(
                    onTap: () {
                      businessEcoFriendlyController.removeSelectedOption(option);
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

            // in this code user select any option from drop down then after select that selectd option display as tag in below DropdownButtonFormField
            CustomButton(
              onTap: () {
                Navigation.pushNamed(Routes.businessService);
              },
              text: AppString.saveContinue,
            ),
          ],
        ).paddingOnly(right: 16.w, left: 16.w, top: 32.h, bottom: 16.h),
      ),
    );
  }
}
