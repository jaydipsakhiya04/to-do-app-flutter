import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/signup/controller/business_account_controller.dart';
import 'package:local/modules/authentication/signup/controller/phone_login_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';
import 'package:country_picker/src/utils/country_picker_mixin.dart';

class BusinessPhoneScreen extends StatelessWidget {
  BusinessPhoneScreen({Key? key}) : super(key: key);
  final CreateBusinessAccountController createBusinessAccountController = Get.find();
  // final PhoneNumberController phoneNumberController = Get.find();
  final PhoneNumberController phoneNumberController = Get.put(PhoneNumberController());
  TextEditingController phoneNUmController = TextEditingController();

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              // Handle back button tap
              Navigator.pop(context);
              // Dismiss the keyboard if it's open
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
            child: Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.circular(8.89.r),
                border: Border.all(
                  width: 1.25,
                  color: AppColors.borderColor.withOpacity(0.2),
                ),
              ),
              child: Center(
                child: Image.asset(
                  IconAsset.backIcon,
                  height: 15.h,
                  width: 9.w,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.yourBusinessPhoneNumber,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 28.sp,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.yourBusinessPhoneNumberDescription,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                        fontSize: 14.sp,
                        color: AppColors.bodyDark,
                      ),
                    ),
                    TextSpan(
                        text: createBusinessAccountController.businessNameController.text,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.6,
                          fontSize: 14.sp,
                          color: AppColors.titleDark,
                        )),
                    TextSpan(
                      text: " ${AppString.yourBusinessPhoneNumberDescription2}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                        fontSize: 14.sp,
                        color: AppColors.bodyDark,
                      ),
                    )
                  ],
                ),
              ).paddingOnly(top: 5.h, bottom: 16.h),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(bottom: 40.h),
              CommonText(
                text: AppString.businessPhoneNum,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              Obx(
                () => Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var country = await showCountryPickerSheet();
                        print("country ${phoneNumberController.selectedCountry.value}");
                        if (country == null) return;
                        phoneNumberController.selectedCountry.value = country;
                        phoneNumberController.selectedCountry.refresh();
                      },
                      child: Container(
                        height: 50.h,
                        width: 105.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.whiteColor.withOpacity(0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /* Image.asset(
                              ImagesAsset.google,
                              width: 20.w,
                            ).paddingOnly(right: 10.h),*/
                            CountryPickerHelper.getDefaultFlagImage(phoneNumberController.selectedCountry.value).paddingOnly(right: 8.h),
                            CommonText(
                              text: "+${phoneNumberController.selectedCountry.value.phoneDetail.code}",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: AppColors.bodyDark,
                            ).paddingOnly(right: 10.h),
                            Image.asset(
                              ImagesAsset.downArrow,
                              width: 10.w,
                              height: 10.h,
                            ).paddingOnly(bottom: 0.h),
                          ],
                        ),
                      ).paddingOnly(right: 12.w),
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        filled: true,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        fillColor: AppColors.whiteColor.withOpacity(0.1),
                        hintText: "Input phone number",
                        controller: phoneNUmController,
                      ),
                    ),
                  ],
                ),
              ).paddingOnly(top: 8.h, bottom: 24.h),
              CustomButton(
                onTap: () {
                  // createBusinessAccountController.businessNameController.clear();
                  if (phoneNUmController.text.isNotEmpty) {
                    Navigation.pushNamed(Routes.businessWebsite);
                  }
                },
                text: AppString.Continue,
              ),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
  }
}
