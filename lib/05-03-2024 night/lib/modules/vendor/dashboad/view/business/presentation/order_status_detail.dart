import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:local/utils/app_colors.dart";
import "package:local/utils/app_string.dart";
import "package:local/utils/assets.dart";
import "package:local/utils/navigation_utils/navigation.dart";
import "package:local/widget/common_text.dart";
import "package:local/widget/custom_button.dart";

import "../controller/order_status_detail_controller.dart";
import "../model/order_status_detail_model.dart";

class OrderStatusDetailScreen extends StatelessWidget {
  final OrderStatusDetailController _pendingOrderController = Get.put(OrderStatusDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 2,
              center: const Alignment(0.9, -0.8),
              colors: [AppColors.backGroundHome2, AppColors.backGroundHome],
            ),
          ),
        ),
        leading: SizedBox(),
        titleSpacing: -36,
        title: CommonText(
          text: AppString.todaysOrder,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 17.h),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Column(
              children: [
                Divider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ),
                TabBar(
                  controller: _pendingOrderController.tabController,
                  labelColor: AppColors.titleDark,
                  unselectedLabelColor: AppColors.middleGrey,
                  indicatorWeight: 5,
                  indicatorColor: Colors.white,
                  padding: EdgeInsets.only(right: 90.w),
                  onTap: (value) {},
                  automaticIndicatorColorAdjustment: true,
                  tabs: [
                    Tab(
                      child: Text(
                        "PENDING",
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ).paddingOnly(bottom: 10.h),
                    ),
                    Tab(
                      child: Text(
                        "ACCEPTED",
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ).paddingOnly(bottom: 10.h),
                    ),
                    Tab(
                      child: Text(
                        "REJECTED",
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ).paddingOnly(bottom: 10.h),
                    ),
                  ],
                  dividerColor: Colors.transparent,
                ),
              ],
            )),
      ),
      body: TabBarView(
        controller: _pendingOrderController.tabController,
        children: [
          Obx(() {
            return ListView.builder(
              itemCount: _pendingOrderController.pendingOrders.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return pendingOrderCard(
                      orderStatusDataModel: _pendingOrderController.pendingOrders[index],
                      onTap: () {
                        showCustomBottomSheet(orderStatusDataModel: _pendingOrderController.pendingOrders[index]);
                      });
                });
              },
            );
          }),
          Obx(() {
            return ListView.builder(
              itemCount: _pendingOrderController.acceptedOrders.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return pendingOrderCard(
                      orderStatusDataModel: _pendingOrderController.acceptedOrders[index],
                      onTap: () {
                        showCustomBottomSheet(orderStatusDataModel: _pendingOrderController.acceptedOrders[index]);
                      });
                });
              },
            );
          }),
          Obx(() {
            return ListView.builder(
              itemCount: _pendingOrderController.rejectedOrders.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return pendingOrderCard(
                      orderStatusDataModel: _pendingOrderController.rejectedOrders[index],
                      onTap: () {
                        showCustomBottomSheet(orderStatusDataModel: _pendingOrderController.rejectedOrders[index]);
                      });
                });
              },
            );
          }),
        ],
      ),
    );
  }

  void showCustomBottomSheet({required OrderStatusDataModel orderStatusDataModel}) {
    Get.bottomSheet(
      isScrollControlled: true,
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkTheme,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.titleDark,
                          ),
                          width: double.infinity,
                        ).marginSymmetric(horizontal: 130.w).marginSymmetric(vertical: 20.h),
                        CommonText(
                          text: AppString.orderDetails,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ).marginOnly(bottom: 20.h),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.darkBackGroundHome,
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          ImagesAsset.girlImage,
                          height: 50.h,
                          width: 50.h,
                        ),
                        CommonText(
                          text: orderStatusDataModel.userName ?? "",
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                          margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.lightBg,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 5.r,
                                width: 5.r,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: orderStatusDataModel.orderType == OrderType.pending
                                        ? Colors.green
                                        : orderStatusDataModel.orderType == OrderType.accepted
                                            ? Colors.yellow
                                            : Colors.red),
                              ),
                              6.w.horizontalSpace,
                              CommonText(
                                  text: orderStatusDataModel.orderType == OrderType.pending
                                      ? AppString.pendingLowerCase
                                      : orderStatusDataModel.orderType == OrderType.accepted
                                          ? AppString.acceptedLower
                                          : AppString.rejectedLower,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: orderStatusDataModel.orderType == OrderType.pending
                                      ? Colors.green
                                      : orderStatusDataModel.orderType == OrderType.accepted
                                          ? Colors.yellow
                                          : Colors.red),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.r),
                          margin: EdgeInsets.only(top: 8.h, bottom: 16.h, left: 16.w, right: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.darkTheme,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: AppString.dateLower,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: AppColors.bodyDark,
                                  ),
                                  CommonText(
                                    text: orderStatusDataModel.date ?? "",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ],
                              ).marginOnly(bottom: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: AppString.timeLower,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: AppColors.bodyDark,
                                  ),
                                  CommonText(
                                    text: orderStatusDataModel.time ?? "",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ],
                              ).marginOnly(bottom: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: AppString.peopleLower,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: AppColors.bodyDark,
                                  ),
                                  CommonText(
                                    text: orderStatusDataModel.people ?? "",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ],
                              ).marginOnly(bottom: 8.h),
                              if (orderStatusDataModel.orderType != OrderType.rejected)
                                if (orderStatusDataModel.orderType != OrderType.pending ||
                                    orderStatusDataModel.isSetAlert == true)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonText(
                                        text: AppString.payment,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: AppColors.bodyDark,
                                      ),
                                      CommonText(
                                        text: AppString.thousand,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ],
                                  ).marginOnly(bottom: 8.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (orderStatusDataModel.orderType != OrderType.rejected) ...[
                  Container(
                    padding: EdgeInsets.all(12.r),
                    margin: EdgeInsets.only(top: 10.h, bottom: 16.h, left: 16.w, right: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.lightBg,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        color: AppColors.darkBackGroundHome,
                        padding: EdgeInsets.all(12.r),
                        child: Image.asset(ImagesAsset.yellowbell),
                      ),
                      title: Obx(() {
                        return CommonText(
                          text: orderStatusDataModel.isSetAlert.value ? AppString.setAlert : AppString.activeAlert,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        );
                      }),
                      trailing: Obx(() {
                        return InkWell(
                          onTap: () {
                            orderStatusDataModel.isSetAlert.value = !orderStatusDataModel.isSetAlert.value;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48.r),
                              color: orderStatusDataModel.isSetAlert.value ? AppColors.green : AppColors.darkRed,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  orderStatusDataModel.isSetAlert.value ? ImagesAsset.play : ImagesAsset.stop,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                3.w.horizontalSpace,
                                CommonText(
                                  text: orderStatusDataModel.isSetAlert.value
                                      ? AppString.startAlert
                                      : AppString.stopAlert,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  if (orderStatusDataModel.orderType == OrderType.pending)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(
                            onTap: () {
                              Get.closeAllSnackbars();
                              orderStatusDataModel.isSetAlert.value = !orderStatusDataModel.isSetAlert.value;
                              _pendingOrderController.pendingOrders.remove(orderStatusDataModel);
                              orderStatusDataModel.orderType = OrderType.accepted;
                              orderStatusDataModel.isSetAlert.value = !orderStatusDataModel.isSetAlert.value;
                              orderStatusDataModel.orderType=OrderType.rejected;
                              _pendingOrderController.rejectedOrders.add(orderStatusDataModel);
                              Navigation.pop();
                              _pendingOrderController.pendingOrders.refresh();
                              _pendingOrderController.tabController.animateTo(2);
                              Get.snackbar('Order Rejected', 'The order has been rejected');
                            },
                            borderRadius: BorderRadius.circular(10.r),
                            width: 165.w,
                            height: 50.h,
                            buttonBorderColor: AppColors.primaryDefaultColor,
                            buttonColor: Colors.transparent,
                            svgColor: AppColors.primaryDefaultColor,
                            textColor: AppColors.primaryDefaultColor,
                            svg: ImagesAsset.cross,
                            text: "Reject",
                          ),
                          12.w.horizontalSpace,
                          CustomButton(
                            onTap: () {
                              Get.closeAllSnackbars();
                              orderStatusDataModel.isSetAlert.value = !orderStatusDataModel.isSetAlert.value;
                              _pendingOrderController.pendingOrders.remove(orderStatusDataModel);
                              orderStatusDataModel.orderType = OrderType.accepted;
                              orderStatusDataModel.isSetAlert.value = !orderStatusDataModel.isSetAlert.value;
                              _pendingOrderController.acceptedOrders.add(orderStatusDataModel);

                              Navigation.pop();
                              _pendingOrderController.pendingOrders.refresh();
                              _pendingOrderController.tabController.animateTo(1);
                              Get.snackbar('Order Accepted', 'The order has been accepted');
                            },
                            width: 165.w,
                            height: 50.h,
                            svg: ImagesAsset.donecheck,
                            text: "Accept",
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ],
                      ),
                    ),
                  if (orderStatusDataModel.orderType == OrderType.accepted)
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              Get.closeAllSnackbars();
                              _pendingOrderController.acceptedOrders.remove(orderStatusDataModel);
                              orderStatusDataModel.orderType = OrderType.rejected;

                              _pendingOrderController.rejectedOrders.add(orderStatusDataModel);
                              Navigation.pop();
                              _pendingOrderController.rejectedOrders.refresh();
                              _pendingOrderController.tabController.animateTo(2);
                              Get.snackbar('Order Rejected', 'The order has been rejected');
                              // Get.closeAllSnackbars();
                            },
                            borderRadius: BorderRadius.circular(10.r),
                            width: 165.w,
                            height: 50.h,
                            buttonBorderColor: AppColors.primaryDefaultColor,
                            buttonColor: AppColors.primaryDefaultColor,
                            svgColor: AppColors.whiteColor,
                            textColor: AppColors.whiteColor,
                            svg: ImagesAsset.cross,
                            text: "Reject",
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16.w),
                  20.h.verticalSpace,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pendingOrderCard({
    required OrderStatusDataModel orderStatusDataModel,
    void Function()? onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: AppColors.darkBackGroundHome),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      orderStatusDataModel.profile ?? "",
                      height: 38.h,
                      width: 38.w,
                    ).marginOnly(right: 5.w),
                    CommonText(
                      text: orderStatusDataModel.userName ?? "",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    if (orderStatusDataModel.orderType != OrderType.rejected)
                      Container(
                        decoration: BoxDecoration(color: AppColors.darkTheme, borderRadius: BorderRadius.circular(5.r)),
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              IconAsset.bell,
                              height: 20.h,
                              width: 20.w,
                              color: (orderStatusDataModel.isSetAlert.value) ? Colors.white : Colors.yellow,
                            ),
                            8.w.horizontalSpace,
                            CommonText(
                              text:
                                  (orderStatusDataModel.isSetAlert.value) ? AppString.setAlert : AppString.activeAlert,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      )
                  ],
                ).paddingAll(12.r),
                Divider(
                  height: 2,
                  color: AppColors.dividerColor2,
                  thickness: 2,
                ),
                FittedBox(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        orderDetails(title1: AppString.date, title2: orderStatusDataModel.date ?? "")
                            .paddingOnly(left: 16.w),
                        VerticalDivider(
                          width: 0.w,
                          color: AppColors.dividerColor2,
                        ).paddingSymmetric(horizontal: 24.w),
                        orderDetails(title1: AppString.time, title2: orderStatusDataModel.time ?? ""),
                        VerticalDivider(
                          width: 0.w,
                          color: AppColors.dividerColor2,
                        ).paddingSymmetric(horizontal: 24.w),
                        orderDetails(title1: AppString.people, title2: orderStatusDataModel.people ?? "")
                            .paddingOnly(right: 16.w)
                      ],
                    ).paddingSymmetric(vertical: 20.h),
                  ),
                ),
              ],
            ),
          ).marginOnly(left: 16.w, right: 16.w, top: 12.h),
        ),
      ],
    );
  }

  Widget orderDetails({
    required String title1,
    required String title2,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: title1,
          fontSize: 10.sp,
          color: AppColors.middleGrey,
          fontWeight: FontWeight.w400,
        ).paddingOnly(bottom: 4.h),
        FittedBox(
          child: CommonText(
            maxLine: 1,
            text: title2,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
