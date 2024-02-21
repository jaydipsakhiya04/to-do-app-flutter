import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/home/controller/home_screen_controller.dart';
import 'package:local/modules/vendor/dashboad/view/home/controller/vandor_home_chat_controller.dart';
import 'package:local/modules/vendor/dashboad/view/home/model/query_data_model.dart';
import 'package:local/modules/vendor/dashboad/view/home/widget/restaurant_orders.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';


class VandorHomeScreen extends StatelessWidget {
  final HomeScreenController _homeScreenController = Get.put(HomeScreenController());
  final HomeChatController _homeChatController = Get.put(HomeChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundHome,
      body: Obx(() {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                        radius: 2,
                        center: Alignment(0.9, -0.8),
                        colors: [
                          AppColors.backGroundHome2,
                          AppColors.backGroundHome
                        ]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                              text: AppString.yourRestaurantName, fontSize: 22.sp),
                          GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.vandorNotification);
                              },
                              child: SvgPicture.asset(
                                IconAsset.notification,
                                height: 30.h,
                                width: 30.h,
                              )),
                        ],
                      ).paddingOnly(left: 16.w, right: 16.w, top: 50.h),
                      CommonText(text: AppString.bengaluru, fontSize: 12.sp)
                          .paddingSymmetric(horizontal: 16.w),
                      20.h.verticalSpace,
                      Container(
                        height: 90.h,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 16.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: _homeScreenController.orderTimeList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (index.isEven && index != 0)
                                  const VerticalDivider(width: 1, color: Colors.grey)
                                      .marginOnly(right: 35.w),
                                RestaurantOrder(
                                  orderTime: _homeScreenController
                                      .orderTimeList[index]
                                      .toString(),
                                  orderPrice: _homeScreenController
                                      .orderPriceList[index]
                                      .toString(),
                                  orderQuantity: _homeScreenController
                                      .orderQuantityList[index]
                                      .toString(),
                                ).marginOnly(right: 35.w),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CommonText(text: AppString.todayQueries, fontSize: 16.sp),
                  ],
                ).marginOnly(left: 16.w, top: 20.h),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16.h),
                    itemCount: _homeChatController.querydataList.length,
                    itemBuilder: (context, index) {
                      var data = _homeChatController.querydataList[index];
                      return Column(
                        children: [
                          todayQuery(
                              QueryDataModel(
                                profile: data.profile,
                                user: data.user,
                                time: data.time,
                                msg: data.msg,
                                replyList: data.replyList,
                               ), onTap: () {
                            Get.toNamed(
                              Routes.vandorHomeChat,
                              arguments: data,
                            );
                          })
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }
      ),
    );
  }

  Widget todayQuery(
      QueryDataModel queryDataModel, {
        void Function()? onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(
                queryDataModel.profile ?? "",
                height: 35.h,
                width: 35.w,
              ),
              title:
              CommonText(text: queryDataModel.user ?? "", fontSize: 12.sp),
              subtitle: CommonText(
                text: queryDataModel.time ?? "",
                fontSize: 10.sp,
                color: AppColors.middleGrey,
              ),
              trailing:
              Icon(Icons.more_vert_outlined, color: AppColors.titleDark),
            ),
            CommonText(
                text: queryDataModel.msg ?? "",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500)
                .marginOnly(bottom: 16.h),
            if ((queryDataModel.replyList ?? []).isNotEmpty)
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 2.w,
                      color: AppColors.backGroundHome3,
                    ),
                    10.h.horizontalSpace,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            leading: Image.asset(
                              queryDataModel.profile ?? "",
                              height: 35.h,
                              width: 35.w,
                            ),
                            title: CommonText(
                                text: queryDataModel.user ?? "",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500
                            ),
                            subtitle: CommonText(
                              text: queryDataModel.time ?? "",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.middleGrey,
                            ),
                          ),
                          CommonText(
                            text: queryDataModel.replyList?[0] ?? "",
                            color: AppColors.lightGrey2,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ).paddingOnly(bottom: 15.h,right: 12.w),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            16.h.verticalSpace,
            Divider(
              color: AppColors.backGroundHome3,
              thickness: 1,
            ),
          ],
        ).marginSymmetric(horizontal: 16.w),
      ),
    );
  }
}