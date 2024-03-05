import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:country_picker/src/utils/country_picker_mixin.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:local/modules/authentication/signup/controller/phone_login_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class PhoneNumberScreen extends StatelessWidget with CountryPickerHelper {
  PhoneNumberScreen({Key? key}) : super(key: key);
  PhoneNumberController phoneNumberController = Get.put(PhoneNumberController());
  TextEditingController phoneNUmController = TextEditingController();

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: (){
              Navigation.pop();
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
                child: SvgPicture.asset(
                  IconAsset.vector,
                  height: 15.h,
                  width: 9.w,
                  alignment: Alignment.center,
                  colorFilter: ColorFilter.mode(
                    AppColors.titleDark,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          /*leading: Container(
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
                IconsAsset.backIcon,
                height: 15.h,
                width: 9.w,
              ),
            ),
          ),*/
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.enterPhoneNum,
                fontWeight: FontWeight.w500,
                fontSize: 26.sp,
              ),
              CommonText(
                height: 1.6,
                text: AppString.enterPhoneNumDescription,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.bodyDark,
              ).paddingOnly(top: 12.h, bottom: 18.h),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(bottom: 40.h),

              // CustomTextField(
              //   filled: true,
              //   hintText: AppString.enterEmail,
              //   controller: loginController.emailController,
              //   fillColor: AppColors.whiteColor.withOpacity(0.1),
              // ).paddingOnly(top: 10.h, bottom: 13.h),

              // intl_phone_number_input: ^0.7.4 use for country code and number

              // showCountryPickerSheet(),
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
                        fillColor: AppColors.whiteColor.withOpacity(0.1),
                        hintText: "Input phone number",
                        controller: phoneNUmController,
                      ),
                    ),
                  ],
                ),
              ),

              // Obx(
              //   () => InternationalPhoneNumberInput(
              //     onInputChanged: phoneNumberController.onPhoneNumberChanged,
              //     onInputValidated: phoneNumberController.onPhoneNumberValidated,
              //     selectorConfig: SelectorConfig(
              //       selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              //       useBottomSheetSafeArea: true,
              //     ),
              //     ignoreBlank: false,
              //     autoValidateMode: AutovalidateMode.disabled,
              //     selectorTextStyle: TextStyle(color: Colors.black),
              //     initialValue: phoneNumberController.number.value,
              //     textFieldController: phoneNumberController.controller,
              //     formatInput: true,
              //     keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
              //     inputBorder: OutlineInputBorder(),
              //     onSaved: (PhoneNumber number) {
              //       print('On Saved: $number');
              //       showCountryPickerSheet();
              //     },
              //   ),
              // ),
              //
              // CustomButton(
              //   onTap: () {
              //     showCountryPickerSheet();
              //   },
              //   text: AppString.getOTP,
              // ).paddingOnly(top: 26.h, bottom: 40.h),

              CustomButton(
                onTap: () {
                  Navigation.pushNamed(Routes.phoneOTP);
                },
                text: AppString.getOTP,
              ).paddingOnly(top: 26.h, bottom: 40.h),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
  }
}
