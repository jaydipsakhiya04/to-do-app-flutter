import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/signup/controller/business_account_controller.dart';
import 'package:local/modules/vendor/businessdetails/controller/what_kindof_business_controller.dart';
import 'package:local/modules/vendor/businessdetails/controller/accept_payment_controller.dart';
import 'package:local/modules/vendor/businessdetails/widget/checkbox.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class PaymentAcceptScreen extends StatelessWidget {
  PaymentAcceptScreen({Key? key}) : super(key: key);
  AcceptPaymentController acceptPaymentController = Get.put(AcceptPaymentController());
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
              Navigation.pushNamed(Routes.businessFeatures);
            },
            text: AppString.skip,
            imageAsset: ImagesAsset.rightArrow,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppString.payments,
              fontWeight: FontWeight.w500,
              height: 1.5,
              fontSize: 28.sp,
            ).paddingOnly(left: 16.w),
            CommonText(
              text: AppString.busniessDescription,
              fontWeight: FontWeight.w500,
              height: 1.5,
              fontSize: 14.sp,
              color: AppColors.bodyDark,
            ).paddingOnly(top: 5.h, bottom: 16.h, left: 16.w),
            Image.asset(
              ImagesAsset.waveImage,
              width: 271.w,
            ).paddingOnly(bottom: 40.h, left: 16.w),
            Column(
              children: [
                CustomCheckboxListTile(
                  value: acceptPaymentController.acceptCreditCards,
                  title: AppString.areYouAcceptCash,
                  onChanged: (newValue) {
                    acceptPaymentController.toggleAcceptCreditCards(newValue!);
                  },
                ),
                CustomCheckboxListTile(
                  value: acceptPaymentController.acceptCash,
                  title: AppString.areYouAcceptCreditCards,
                  onChanged: (newValue) {
                    acceptPaymentController.toggleAcceptCash(newValue!);
                  },
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                Navigation.pushNamed(Routes.businessFeatures);
              },
              text: AppString.saveContinue,
            ).paddingOnly(left: 16.w),
          ],
        ).paddingOnly(right: 16.w, top: 32.h, bottom: 16.h),
      ),
    );
  }
}
