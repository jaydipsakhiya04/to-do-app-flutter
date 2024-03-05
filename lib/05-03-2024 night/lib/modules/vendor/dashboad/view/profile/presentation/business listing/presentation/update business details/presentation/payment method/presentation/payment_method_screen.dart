import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:local/modules/vendor/businessdetails/controller/accept_payment_controller.dart';
import 'package:local/modules/vendor/businessdetails/widget/checkbox.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class PaymentMethodScreen extends StatelessWidget {
   PaymentMethodScreen({Key? key}) : super(key: key);

  final AcceptPaymentController acceptPaymentController = Get.put(AcceptPaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          text: AppString.paymentMethod,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
      ),
      backgroundColor: AppColors.darkTheme,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const Spacer(),
          CustomButton(
            onTap: () {
            },
            text: AppString.save,
          ).paddingOnly(left: 16.w),
        ],
      ).paddingOnly(right: 16.w, top: 16.h, bottom: 16.h),
    );
  }
}
