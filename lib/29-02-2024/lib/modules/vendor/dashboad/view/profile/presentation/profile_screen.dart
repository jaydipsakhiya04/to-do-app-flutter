import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/profile_data_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/profile_data_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';



class VendorprofileScreen extends StatelessWidget {
  final ProfileDataController profileDataController =
  Get.put(ProfileDataController());

  VendorprofileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        titleSpacing: 1,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: Row(
          children: [
            SvgPicture.asset(
              IconAsset.profile,
              height: 24.h,
              width: 24.w,
            ).marginOnly(left: 16.w),
          ],
        ),
        title: CommonText(
            text: AppString.profile,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: RadialGradient(
                  radius: 2,
                  center: const Alignment(0.3, -0.8),
                  colors: [
                    AppColors.backGroundHome2,
                    AppColors.backGroundHome2,
                    AppColors.shadowColor,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    ImagesAsset.user,
                    height: 70.h,
                    width: 70.w,
                  ),
                  12.w.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                          text: AppString.judyJain,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500),
                      CommonText(
                          text: AppString.judyMail,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                      6.h.verticalSpace,
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(Routes.editProfile);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              CommonText(
                                  text: AppString.viewProfile,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                              2.w.horizontalSpace,
                              Icon(Icons.arrow_forward_ios_rounded,color: AppColors.titleDark,size: 12.sp,)
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
            profileFeaturesMainCard(title: AppString.accountSetting, itemList: profileDataController.accountSettingList),
            16.h.verticalSpace,
            profileFeaturesMainCard(title: AppString.businessSetting, itemList: profileDataController.businessSettingList),
            16.h.verticalSpace,
            profileFeaturesMainCard(title: AppString.others, itemList: profileDataController.othersSettingList),
            16.h.verticalSpace,
            profileFeaturesMainCard(title: AppString.login, itemList: profileDataController.loginSettingList),
          ],
        ).paddingAll(16.r),
      ),
    );
  }

  Widget profileFeatures({required ProfileFeatureModel profileFeatureModel}) {
    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: AppColors.darkbg,
          ),
          padding: EdgeInsets.all(7.r),
          child: SvgPicture.asset(
            profileFeatureModel.leadingImage,
            height: 24.h,
            width: 24.w,
          )),
      title: CommonText(
          text: profileFeatureModel.title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400),
      trailing: profileFeatureModel.trailing ??
          IconButton(
              onPressed: profileFeatureModel.onTap,
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.titleDark,
                size: 15.sp,
              )),
    );
  }

  Widget profileFeaturesMainCard(
      {required String title, required List<ProfileFeatureModel> itemList}) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightDarkTheme,
          borderRadius: BorderRadius.circular(8.r)),
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: 1.sh,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 24.h,
                  width: 3.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDefaultColor,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(4),
                    ),
                  ),
                ),
                // Container(
                //   width: 5.h,
                //   decoration: BoxDecoration(
                //     color: AppColors.purple,
                //     borderRadius: BorderRadius.circular(20.r),
                //   ),
                // ),
                20.w.horizontalSpace,
                CommonText(
                    text: title, fontSize: 18.sp, fontWeight: FontWeight.w500),
              ],
            ),
          ),
          10.h.verticalSpace,
          ListView.separated(//aa shu
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemList.length,
            separatorBuilder: (context, index) {
              return Container(
                height: 0.5,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(vertical: 3),
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