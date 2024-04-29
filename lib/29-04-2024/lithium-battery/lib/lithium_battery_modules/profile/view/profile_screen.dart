import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/lithium_battery_modules/profile/controller/profile_data_controller.dart';
import 'package:flutter_template/lithium_battery_modules/profile/model/profile_features_model.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/utils/navigation_utils/routes.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_appbar_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final ProfileDataController profileDataController = Get.put(ProfileDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGrey,
      appBar:CustomAppBar(title: AppString.profile,isSimpleAppBar: false,backgroundColor: AppColors.white,),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  ClipOval(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      height: 70.h,
                      width: 70.h,
                      child: Image.asset(
                        ImageAsset.user,
                       fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  12.w.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                          text:AppString.judyJain,
                          color: AppColors.darkBlue,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500).paddingOnly(left: 0.w),
                      1.h.verticalSpace,
                      CommonText(
                          text: AppString.judyMail,
                          color: AppColors.darkBlue,
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                      6.h.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          Navigation.pushNamed(Routes.editProfileScreen);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonText(text:"viewProfile".tr, color: AppColors.darkBlue, fontSize: 12.sp, fontWeight: FontWeight.w400),
                              2.w.horizontalSpace,
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.darkBlue,
                                size: 12.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            16.h.verticalSpace,
            profileMainCard(title: "accountSetting".tr, itemList: profileDataController.accountSettingList),
            12.h.verticalSpace,
            profileMainCard(title:"others".tr, itemList: profileDataController.othersSettingList),
            12.h.verticalSpace,
            profileMainCard(title: "logOut".tr, itemList: profileDataController.loginSettingList),
          ],
        ).paddingOnly(left: 16.w,right: 16.w,top: 24.h,bottom: 30.h),
      )
    );
  }

  Widget profileFeatures({required ProfileFeatureModel profileFeatureModel}) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(top: 4.h),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.only(left: 24.w,right: 16.w,),
        onTap: () => profileFeatureModel.onTap?.call(),
        leading: SvgPicture.asset(
          profileFeatureModel.leadingImage,
          height: 24.h,
          width: 24.w,
        ),
        title: CommonText(text: profileFeatureModel.title, color: AppColors.darkBlue, fontSize: 16.sp, fontWeight: FontWeight.w400)
            .paddingOnly(left:5.w ),
        trailing: profileFeatureModel.trailing ??
            SvgPicture.asset(
              ImageAsset.rightArrow,
              height: 18.h,
              width: 18.h,
            ),
      ),
    );
  }

  Widget profileMainCard({required String title,  required List<ProfileFeatureModel> itemList}) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10.r),
      ),
      padding:  EdgeInsets.only(top: 16.h,bottom: 18.h),
      width: 1.sh,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  height: 32.h,
                  width: 4.w,
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(4),
                    ),
                  ),
                ),
                13.w.horizontalSpace,
                CommonText(text: title, fontSize: 18.sp, fontWeight: FontWeight.w500),
              ],
            ),
          ),
          10.h.verticalSpace,
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemList.length,
            separatorBuilder: (context, index) {
              return Container(
                height: 1.5.h,
                color: AppColors.dividerColor,
                // margin: const EdgeInsets.symmetric(vertical: 3),
              );
            },
            itemBuilder: (context, index) {
              return profileFeatures(profileFeatureModel: itemList[index]);
            },
          )
        ],
      ),
    );
  }
}