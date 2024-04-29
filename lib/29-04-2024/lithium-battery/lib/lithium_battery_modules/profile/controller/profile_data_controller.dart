import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/lithium_battery_modules/profile/model/profile_features_model.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/utils/navigation_utils/routes.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:get/get.dart';

class ProfileDataController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    ///account list
    accountSettingList.add(
      ProfileFeatureModel(
        title: "languages".tr,

        leadingImage: ImageAsset.languages,
        onTap: () {
          Navigation.pushNamed(
            Routes.languageScreen,
            arg: {
              "isLanguageParameter": true,
            },
          );
        },
      ),
    );




    ///other list
    othersSettingList.add(
      ProfileFeatureModel(
        title: "privacyPolicy".tr,
        leadingImage: ImageAsset.policy,
        onTap: () {

        },
      ),
    );
    othersSettingList.add(
      ProfileFeatureModel(
        title: "termsAndConditions".tr,
        leadingImage: ImageAsset.terms,
        onTap: () {

        },
      ),
    );


    ///login list
    loginSettingList.add(
      ProfileFeatureModel(
        title: "deleteAccount".tr,
        leadingImage: ImageAsset.delete,
        onTap: () {
          showDialog(
            context: Get.context!,
            builder: (context) => Dialog(
              // insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.r),
                ),
              ),
              backgroundColor: AppColors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),

                child:SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        textAlign: TextAlign.center,
                        text: "doYouWantToDeleteTheAccount".tr,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkBlue,
                      ).paddingSymmetric(horizontal: 16.w),
                      10.h.verticalSpace,
                      CommonText(
                        textAlign: TextAlign.center,
                        text: "readyToSayGoodbyeDeletingYourAccountWillRemoveAllYourDataFromOurPoweraceApp".tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ).paddingSymmetric(horizontal: 20.w),
                      16.h.verticalSpace,
                      Container(
                        color: AppColors.grey,
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigation.replaceAll(Routes.loginScreen);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             CommonText(
                               text: "deleteAccount".tr,
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w500,
                               color: AppColors.red,
                             ),
                           ],
                          ).paddingSymmetric(vertical: 10.h),
                        ),
                      ),
                      Container(
                        color: AppColors.grey,
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigation.pop();
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                text: "cancel".tr,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkBlue,
                              ),
                            ],
                          ).paddingOnly(top: 10.h),
                        ),
                      ),
                    ],
                  ).paddingOnly(top: 20.h,bottom: 20.h),
                ),
              ),
            ),
          );
        },
      ),
    );
    loginSettingList.add(
      ProfileFeatureModel(
        title: "logOut".tr,
        leadingImage: ImageAsset.logout,
        onTap: () {
          showDialog(
            context: Get.context!,
            builder: (context) => Dialog(
              // insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.r),
                ),
              ),
              backgroundColor: AppColors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),

                child:SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: "areYouSureYouWantToLogout".tr,
                        textAlign: TextAlign.center,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkBlue,
                      ).paddingSymmetric(horizontal: 20.w),
                      10.h.verticalSpace,
                      CommonText(
                        textAlign: TextAlign.center,
                        text: "youllBeRedirectedToTheLoginPageAndWillNeedToSignInAgainToAccessYourAccount".tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ).paddingSymmetric(horizontal: 20.w),
                      16.h.verticalSpace,
                      Container(
                        color: AppColors.grey,
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigation.replaceAll(Routes.loginScreen);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                text: "logOut".tr,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.red,
                              ),
                            ],
                          ).paddingSymmetric(vertical: 10.h),
                        ),
                      ),
                      Container(
                        color: AppColors.grey,
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigation.pop();
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                text: "cancel".tr,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkBlue,
                              ),
                            ],
                          ).paddingOnly(top: 10.h),
                        ),
                      ),
                    ],
                  ).paddingOnly(top: 20.h,bottom: 20.h),
                ),
              ),
            ),
          );
        },
      ),
    );


  }
  RxList<ProfileFeatureModel> profileData = <ProfileFeatureModel>[].obs;

  RxBool notificationOn = true.obs;
  RxBool darkModeOn = true.obs;
  RxList<ProfileFeatureModel> accountSettingList = <ProfileFeatureModel>[].obs;
  RxList<ProfileFeatureModel> othersSettingList = <ProfileFeatureModel>[].obs;
  RxList<ProfileFeatureModel> loginSettingList = <ProfileFeatureModel>[].obs;
}
