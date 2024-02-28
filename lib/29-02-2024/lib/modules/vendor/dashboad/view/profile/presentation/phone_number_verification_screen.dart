import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/add_new_bank_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import '../widget/phone_verify.dart';

class PhoneNumberVerificationScreen extends StatelessWidget {
   PhoneNumberVerificationScreen({Key? key}) : super(key: key);
  final PhoneNumberVerificationController pinPutOTPController = Get.put(PhoneNumberVerificationController());
  AddBankDataController _addBankDataController=Get.put(AddBankDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.backGroundHome3,
          ),
        ),
        titleSpacing: -12,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: CommonText(text: AppString.enterCode, fontSize: 16.sp, fontWeight: FontWeight.w400),
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppString.enterTheCodeForPhone,
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
            ).marginOnly(right: 28.w),
            CommonText(
              text: AppString.enterTheCodeForPhoneDescription,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              height: 1.5,
              color: AppColors.bodyDark,
            ).paddingOnly(top: 12.h, bottom: 18.h),
            Image.asset(
              ImagesAsset.waveImage,
              width: 271.w,
            ).paddingOnly(bottom: 40.h),
            CommonText(
              text: AppString.didNotReceiveCode,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.bodyDark,
            ),
            Row(
              children: [
                Obx(() {
                  return GestureDetector(
                      onTap: () {
                        if (pinPutOTPController.isResendEnabled.value) {
                          pinPutOTPController.startResendTimer();
                        }
                      },
                      child: pinPutOTPController.isResendEnabled.value?
                      const Text(
                        AppString.resendAgain,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ):
                      RichText(
                          text: TextSpan(
                              text: "Resend again in ",
                              style: TextStyle(
                                color: AppColors.bodyDark,
                              ),
                              children: [
                                TextSpan(
                                  text: '${pinPutOTPController.getFormattedTime(pinPutOTPController.resendDelayInSeconds.value)} Sec',
                                  style: TextStyle(
                                    color: AppColors.titleDark,
                                  ),
                                )
                              ]
                          ))
                  );
                }),
              ],
            ).paddingOnly(bottom: 40.h),

            PinputOTP().paddingOnly(bottom: 24.h),

            CustomButton(
              onTap: () async {

                if (pinPutOTPController.validatePin()) {
                  Get.back();
                  Get.find<AddBankDataController>().bankData.value={
                    "title":"Bank of America",
                    "subTitle":"2564 **** **** 1121",
                    "profile":ImagesAsset.flag,
                    "trail":Icons.more_vert_outlined
                  };
                }
              },
              text: AppString.verify,
            ).paddingOnly(bottom: 40.h),

          ],
        ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
      ),
    );
  }
}
