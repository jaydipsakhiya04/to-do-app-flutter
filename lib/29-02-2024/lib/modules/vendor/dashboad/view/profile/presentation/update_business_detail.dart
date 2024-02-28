import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/business_listing_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/custom_textfield.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';

class UpdateBusinessDetail extends StatelessWidget {
  UpdateBusinessDetail({Key? key}) : super(key: key);

  BusinessListingController _businessListingController = Get.find();


  final argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        titleSpacing: -8,
        title: CommonText(
          text: AppString.updateBusinessDetails,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Image.asset(argument[0], fit: BoxFit.cover),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Image.asset(argument[1], fit: BoxFit.cover),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Image.asset(argument[2], fit: BoxFit.cover),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    child: GestureDetector(
                      onTap: (){
                        Navigation.pushNamed(Routes.updateImage, arg: argument);
                      },
                      child:Container(
                        color: Colors.transparent,
                        child: ClipRect(
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                argument[3],
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.black45.withOpacity(0.6 ),
                              ),
                              // BackdropFilter(
                              //   filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                              //   child: Container(
                              //     color: Colors.transparent,
                              //   ),
                              // ),
                              Center(
                                child: CommonText(
                                  text: "See All",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
              ],
            ),
            20.h.verticalSpace,
            Column(
              children: [
                CommonTextField(
                  hintText: AppString.restaurantsName,
                  label: AppString.businessName,
                  suffix: SizedBox.shrink(),
                ),
                CommonTextField(
                  hintText: AppString.hotelNumber,
                  label: AppString.businessPhoneNum,
                  keyboardType: TextInputType.phone,
                ),
                CommonTextField(
                  hintText: AppString.site,
                  label: AppString.website,
                  suffix: SizedBox.shrink(),
                ),
              ],
            ).paddingSymmetric(horizontal: 16.w),
            Divider(
              height: 3.h,
              thickness: 1,
              color: AppColors.lightBrown,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigation.pushNamed(Routes.updateBusinessAddress);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: AppString.businessAddress,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightGrey,
                        ).paddingOnly(top: 16.h),
                        SvgPicture.asset(
                          IconAsset.edit,
                          color: AppColors.whiteColor,
                          height: 20.w,
                          width: 20.w,
                        ),
                      ],
                    ),
                  ),
                ),
                CommonText(
                        text: AppString.addressMap,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGrey)
                    .paddingSymmetric(vertical: 16.w),
              ],
            ).paddingSymmetric(horizontal: 16.w),
            Divider(
              height: 3.h,
              thickness: 1,
              color: AppColors.lightBrown,
            ),
            GestureDetector(
                onTap: (){
                  Navigation.pushNamed(Routes.updateBusinessTime);
                },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: AppString.businessTime,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGrey,
                    ),
                    SvgPicture.asset(
                      IconAsset.edit,
                      color: AppColors.whiteColor,
                      height: 20.w,
                      width: 20.w,
                    ),
                  ],
                ).paddingOnly(top: 16.h, left: 16.w, right: 16.w),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                _businessListingController.weekDays.length,
                (index) => ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  leading: CommonText(
                    text: _businessListingController.weekDays[index],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGrey,
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: AppString.timeHour,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGrey,
                      ),
                      CommonText(
                        text: AppString.timeHour,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGrey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 3.h,
              thickness: 1,
              color: AppColors.lightBrown,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigation.pushNamed(Routes.categoriesEdit);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: AppString.businessCategories,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ).paddingOnly(top: 16.h),
                        SvgPicture.asset(
                          IconAsset.edit,
                          color: AppColors.whiteColor,
                          height: 20.w,
                          width: 20.w,
                        ),
                      ],
                    ).paddingOnly(bottom: 16.h, left: 16.w, right: 16.w),
                  ),
                ),
                Column(
                  children: [
                    innerCategories(
                      first: AppString.restaurants,
                      second: AppString.american,
                    ),
                    innerCategories(
                      first: AppString.restaurants,
                      second: AppString.american,
                    ),
                    innerCategories(
                      first: AppString.restaurants,
                      second: AppString.american,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16.w),
                Divider(
                  height: 3.h,
                  thickness: 1,
                  color: AppColors.lightBrown,
                ),
              ],
            ).paddingOnly(bottom: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                payments(
                  onTap: (){
                    Navigation.pushNamed(Routes.paymentMethod);
                  },
                  title1: AppString.acceptCreditCard,
                  title2: AppString.acceptCash,
                  field: AppString.payments,
                ),
                payments(
                  onTap: (){
                    Navigation.pushNamed(Routes.features);
                  },
                  title1: AppString.casual,
                  title2: AppString.offersCatering,
                  field: AppString.features,
                ),
                payments(
                  onTap: (){
                    Navigation.pushNamed(Routes.ecoFriendly);
                  },
                  title1: AppString.bikeParking,
                  title2: AppString.bringContainer,
                  field: AppString.ecoFriendly,
                ),

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigation.pushNamed(Routes.servicesEdit);
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: AppString.services,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ).paddingOnly(bottom: 16.h, left: 16.w),
                            SvgPicture.asset(
                              IconAsset.edit,
                              color: AppColors.whiteColor,
                              height: 20.w,
                              width: 20.w,
                            ),
                          ],
                        ).paddingOnly(right: 16.w),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        _businessListingController.services.length,
                        (index) => CommonText(
                          text: _businessListingController.services[index],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightGrey,
                        ).paddingOnly(bottom: 16.h, left: 16.w),
                      ),
                    ),
                  ],
                ),

                Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.lightBrown,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: AppString.bookingPrice,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ).paddingOnly(top: 16.h),
                CommonText(
                  text: AppString.thousand,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ).paddingOnly(top: 16.h),
              ],
            ).paddingOnly(left: 16.w, right: 16.w, bottom: 16.w)
          ],
        ),
      ),
    );
  }

  Widget innerCategories({
    required String first,
    required String second,
  }) {
    return Row(
      children: [
        CommonText(
          text: first,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.lightWhitegrey,
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.lightWhitegrey,
          size: 12.sp,
        ).paddingSymmetric(horizontal: 9.w),
        CommonText(
          text: second,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.lightWhitegrey,
        ),
      ],
    ).marginOnly(bottom: 10.h);
  }

  Widget payments({required String field,required String title1,required String title2,void Function()? onTap}){
    return Column(
      children: [
        GestureDetector(
          onTap:onTap,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  field,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.titleDark),
                ),
                SvgPicture.asset(
                  IconAsset.edit,
                  color: AppColors.whiteColor,
                  height: 20.w,
                  width: 20.w,
                ),
              ],
            ).paddingOnly(left: 16.w, right: 16.w),
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              IconAsset.coin,
              height: 24.w,
              width: 24.w,
            ).paddingOnly(
              right: 16.w,
            ),
            Text(
              title1,
              style: TextStyle(fontSize: 14.sp, color: AppColors.lightGrey, fontWeight: FontWeight.w500),
            ),
          ],
        ).paddingOnly(bottom: 13.5.h, left: 16.w, top: 16.h),
        Row(
          children: [
            SvgPicture.asset(
              IconAsset.cash,
              height: 24.h,
              width: 24.w,
            ).paddingOnly(
              right: 16.w,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                title2,
                style: TextStyle(fontSize: 14.sp, color: AppColors.lightGrey, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ).paddingOnly(bottom: 16.h, left: 16.w),
        Divider(
          height: 1,
          thickness: 1,
          color: AppColors.lightBrown,
        ),
        20.h.verticalSpace
      ],
    );
  }
}
