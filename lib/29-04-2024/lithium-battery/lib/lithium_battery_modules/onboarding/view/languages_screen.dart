import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/lithium_battery_modules/onboarding/controller/language_controller.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_preferences.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/utils/navigation_utils/routes.dart';
import 'package:flutter_template/widget/app_snackbar.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_appbar_widget.dart';
import 'package:flutter_template/widget/custom_button.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({Key? key}) : super(key: key);

  final LanguageController _languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argument = Get.arguments ?? {};
    bool? parameter = argument["isLanguageParameter"];
    return Scaffold(
      appBar: (parameter == true)
          ? CustomAppBar(
              title: "selectLanguages".tr,
              isSimpleAppBar: false,
              statusBarColor: AppColors.darkBlue)
          : null,
      backgroundColor:
          !(parameter == true) ? AppColors.white : AppColors.whiteGrey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => CustomButton(
          isLoader: _languageController.isLoading.value,
          onTap: () async {
            if (_languageController.selectedLanguageIndex.value != -1 &&
                !(parameter == true)) {
              String selectedLanguageCode = _languageController.languageList[_languageController.selectedLanguageIndex.value].code;
              // AppPreference.setString('selectedLanguageCode', selectedLanguageCode);
              _languageController.appPreference.setLanguage(language: selectedLanguageCode);

              Get.updateLocale(Locale(selectedLanguageCode));
              Navigation.pushNamed(Routes.loginScreen);
            } else if (_languageController.selectedLanguageIndex.value != -1 &&
                parameter == true) {
              String selectedLanguageCode = _languageController.languageList[_languageController.selectedLanguageIndex.value].code;
              // AppPreference.setString('selectedLanguageCode', selectedLanguageCode);
              _languageController.appPreference.setLanguage(language: selectedLanguageCode);
              Get.updateLocale(Locale(selectedLanguageCode));
              Navigation.replaceAll(Routes.batteryDataScreen);
            } else {
              AppSnackBar.showSnackBarAtTop(message: "Please select language");
            }
          },

          padding: EdgeInsets.symmetric(vertical: 15.h),
          buttonColor: AppColors.orange,
          textColor: AppColors.white,
          text: "save".tr,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ).marginSymmetric(horizontal: 16.w),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (parameter == true)
              ? 16.h.verticalSpace
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonText(
                      text: "selectLanguages".tr,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue,
                    ),
                    8.h.verticalSpace,
                    CommonText(
                      text: "weHelpYouInYourOwnLanguage".tr,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                    40.h.verticalSpace,
                  ],
                ).paddingOnly(left: 16.w, top: 52.h),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _languageController.languageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      _languageController.setSelectedLanguageIndex(index);
                      _languageController.appPreference.setLanguage(language: _languageController.languageList[index].code);
                      print("langcode ----- ${_languageController.languageList[index].code}");
                      // AppPreference.setString('selectedLanguageCode', _languageController.languageList[index].code);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color:
                              _languageController.selectedLanguageIndex.value ==
                                      index
                                  ? AppColors.darkBlue
                                  : AppColors.lightGrey,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            _languageController.languageList[index].image,
                            height: 36,
                            width: 54,
                          ),
                          16.h.verticalSpace,
                          CommonText(
                            text: _languageController.languageList[index].name,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ).paddingOnly(bottom: 25.h),
    );
  }
}
