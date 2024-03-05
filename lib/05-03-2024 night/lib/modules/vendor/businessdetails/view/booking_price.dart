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

class BookingPriceScreen extends StatelessWidget {
  BookingPriceScreen({Key? key}) : super(key: key);
  // BusinessEcoFriendlyController businessEcoFriendlyController = Get.put(BusinessEcoFriendlyController());
  TextEditingController priceController = TextEditingController();

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
              // Navigation.pushNamed(Routes.paymentAccept);
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
                text: AppString.bookingPrice,
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
                text: AppString.price,
                fontWeight: FontWeight.w600,
              ).paddingOnly(bottom: 8.h),
          
              CustomTextField(
                filled: true,
                fillColor: AppColors.whiteColor.withOpacity(0.1),
                controller: priceController,
                hintText: AppString.enterService,
                keyboardType: TextInputType.emailAddress,
              ).paddingOnly(bottom: 24.h),
          
              // in this code user select any option from drop down then after select that selectd option display as tag in below DropdownButtonFormField
              CustomButton(
                onTap: () {
                  Navigation.pushNamed(Routes.vanDorDashBoard);
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
