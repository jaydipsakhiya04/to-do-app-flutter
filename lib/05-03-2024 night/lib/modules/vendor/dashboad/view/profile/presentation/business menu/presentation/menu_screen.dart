import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20menu/controller/menu_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/menu_card_data_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:readmore/readmore.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final BusinessMenuController _businessMenuController =
      Get.put(BusinessMenuController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundHome,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundHome3,
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
          text: "Menu",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
      ),
      body: Obx(() {
        return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return businessMenuCard(
                businessMenuCardModel:
                    _businessMenuController.businessMenuCardList[index],
                onTap: () {
                  Map<String, dynamic> args = {};
                  args["data"] =
                      _businessMenuController.businessMenuCardList[index];
                  args["isAdd"] = false;
                  args["index"] = index;
                  Navigation.pushNamed(Routes.addAndUpdateMenu, arg: args).then(
                    (value) {
                      _businessMenuController.businessMenuCardList[index] =
                          value;
                      _businessMenuController.businessMenuCardList.refresh();
                    },
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 6.h,
                color: AppColors.backGroundHome3,
              );
            },
            itemCount: _businessMenuController.businessMenuCardList.length);
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {

              Map<String, dynamic> args = {};
              args["data"] = "";
              args["isAdd"] = true;
               args["index"] = _businessMenuController.businessMenuCardList.length;


              Navigation.pushNamed(Routes.addAndUpdateMenu, arg: args);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(8.r)),
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 30.w),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 20.sp,
                    color: AppColors.whiteColor,
                  ),
                  4.w.horizontalSpace,
                  CommonText(
                    text: AppString.add,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget businessMenuCard(
      {required BusinessMenuCardModel businessMenuCardModel,
      void Function()? onTap}) {
    return Container(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(IconAsset.veg),
                    6.h.verticalSpace,
                    CommonText(
                      text: businessMenuCardModel.title,
                      fontSize: 18.h,
                      fontWeight: FontWeight.w500,
                    ),
                    6.h.verticalSpace,
                    CommonText(
                      text: "\$ ${businessMenuCardModel.price}",
                      fontSize: 18.h,
                      fontWeight: FontWeight.w400,
                    ),
                    10.h.verticalSpace,
                    ReadMoreText(
                      (businessMenuCardModel.details),
                      trimLines: 2,
                      colorClickableText: AppColors.blackColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'more',
                      trimExpandedText: '  ..less',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.lightGrey,
                          fontWeight: FontWeight.w400),
                      lessStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteColor),
                      moreStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
              12.w.horizontalSpace,
              Expanded(
                flex: 4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: businessMenuCardModel.imageList.isEmpty ?  Image.asset(
                      ImagesAsset.pasta,

                      width: 150.r,
                      fit: BoxFit.cover,
                    ) :
                         SizedBox(
                           height: 150.r,

                           // width: 180.r,
                           child: Image.file(
                              File(businessMenuCardModel.imageList[0]),fit: BoxFit.cover,
                             ),
                         )
                        ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            height: 2.h,
            color: AppColors.backGroundHome4,
          ),
          Row(
            children: [
              CommonText(
                  text: AppString.showBusinessProfile,
                  fontSize: 16.sp,
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.w500),
              5.w.horizontalSpace,
              Obx(
                () {
                  return SizedBox(
                    height: 35.h,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                        value: _businessMenuController.switchButton.value,
                        onChanged: (value) {
                          _businessMenuController.switchButton.value = value;
                        },
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              InkWell(
                onTap: onTap ?? () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      IconAsset.edit,
                      color: Colors.white,
                      height: 20.w,
                      width: 20.w,
                    ),
                    12.w.horizontalSpace,
                    CommonText(
                        text: AppString.edit,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
