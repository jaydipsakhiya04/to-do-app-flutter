import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:local/modules/vendor/dashboad/view/business/controller/pending_order_controller.dart";
import "package:local/modules/vendor/dashboad/view/business/model/pending_orders_model.dart";
import "package:local/utils/app_string.dart";
import "package:local/utils/assets.dart";

import "../../../../../../utils/app_colors.dart";
import "../../../../../../widget/common_text.dart";

class PendingOrderScreen extends StatelessWidget {
  final PendingOrderController _pendingOrderController =
      Get.put(PendingOrderController());

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 2,
              center: Alignment(0.9, -0.8),
              colors: [AppColors.backGroundHome2, AppColors.backGroundHome],
            ),
          ),
        ),
        title: CommonText(
          text: AppString.todaysOrder,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 17.h),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Column(
              children: [
                Divider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ) ,
                TabBar(
                  controller: _pendingOrderController.tabController,
                  // labelColor: Colors.blue,
                  indicatorWeight: 5,
                  indicatorColor: Colors.white,
                  padding: EdgeInsets.only(right: 100.w),
                  automaticIndicatorColorAdjustment: true,
                  tabs: [
                    Tab(
                      child: CommonText(
                        text: AppString.pending,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ).paddingOnly(bottom: 10.h),
                    ),
                    Tab(
                      child: CommonText(
                        text: AppString.accepted,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ).paddingOnly(bottom: 10.h),
                    ),
                    Tab(
                      child: CommonText(
                        text: AppString.rejected,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ).paddingOnly(bottom: 10.h),
                    ),
                  ],
                  dividerColor: Colors.transparent,
                ),
              ],
            )),
      ),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(140.h),
      //   child: Container(
      //     width: double.infinity,
      //     height: 150.h,
      //     decoration: BoxDecoration(
      //       gradient: RadialGradient(
      //         radius: 2,
      //         center: Alignment(0.9, -0.8),
      //         colors: [AppColors.backGroundHome2, AppColors.backGroundHome],
      //       ),
      //     ),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Row(
      //           children: [
      //             CommonText(
      //               text: AppString.todaysOrder,
      //               fontSize: 16.sp,
      //               fontWeight: FontWeight.w400,
      //             ).paddingSymmetric(vertical: 17.h),
      //           ],
      //         ).paddingOnly(left: 16.w),
      //         Divider(
      //           thickness: 2,
      //           color: AppColors.dividerColor,
      //         ).paddingOnly(bottom: 12.h),
      //         TabBar(
      //           controller: _pendingOrderController.tabController,
      //           // labelColor: Colors.blue,
      //           indicatorWeight: 5,
      //           indicatorColor: Colors.white,
      //           padding: EdgeInsets.only(right: 100.w),
      //           automaticIndicatorColorAdjustment: true,
      //           tabs: [
      //             Tab(
      //               child: CommonText(
      //                 text: AppString.pending,
      //                 fontSize: 12.sp,
      //                 fontWeight: FontWeight.w500,
      //               ).paddingOnly(bottom: 10.h),
      //             ),
      //             Tab(
      //               child: CommonText(
      //                 text: AppString.accepted,
      //                 fontSize: 12.sp,
      //                 fontWeight: FontWeight.w500,
      //               ).paddingOnly(bottom: 10.h),
      //             ),
      //             Tab(
      //               child: CommonText(
      //                 text: AppString.rejected,
      //                 fontSize: 12.sp,
      //                 fontWeight: FontWeight.w500,
      //               ).paddingOnly(bottom: 10.h),
      //             ),
      //           ],
      //           dividerColor: Colors.transparent,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: TabBarView(
        controller: _pendingOrderController.tabController,
        children: [
          Obx(
          () {
              return ListView.builder(
                itemCount: _pendingOrderController.pendingOrders.length,
                itemBuilder: (context, index) {
                           return Obx(
                             () {
                               return pendingOrderCard(
                                  pendingOrdersDataModel:
                                      _pendingOrderController.pendingOrders[index],
                                  onTap: () {
                                  // showCustomBottomSheet(pendingOrdersDataModel: _pendingOrderController.pendingOrders[index],);
                                  //   _pendingOrderController.pendingOrders[index].isSetAlert = _pendingOrderController.isSetAlert.value;
                                  //   print("valll ---- ${_pendingOrderController.isSetAlert.value}");
                                    print("_pendingOrderController.pendingOrders[index].isSetAlert ---- ${_pendingOrderController.pendingOrders[index].isSetAlert}");

                                    Get.bottomSheet(
                                      isScrollControlled: true,
                                      Container(
                                        height: 0.725.sh,
                                        color: AppColors.darkTheme,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(12.r),
                                                      topRight: Radius.circular(12.r))),
                                              width: double.infinity,
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 4.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(10.r),
                                                        color: AppColors.white,
                                                      ),
                                                      width: double.infinity,
                                                    )
                                                        .marginSymmetric(horizontal: 130.w)
                                                        .marginSymmetric(vertical: 20.h),
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
                                                      text: _pendingOrderController.pendingOrders[index].userName ?? "",
                                                      fontSize: 24.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: 6.h, horizontal: 8.w),
                                                      margin: EdgeInsets.only(
                                                          top: 8.h, bottom: 16.h),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(20.r),
                                                        color: AppColors.lightBg,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          SvgPicture.asset(IconAsset.greenDot),
                                                          CommonText(
                                                            text: AppString.pendingLowerCase,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 12.sp,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(16.r),
                                                      margin: EdgeInsets.only(
                                                          top: 8.h,
                                                          bottom: 16.h,
                                                          left: 16.w,
                                                          right: 16.w),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(20.r),
                                                        color: AppColors.darkTheme,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              CommonText(
                                                                text: AppString.dateLower,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12.sp,
                                                                color: AppColors.lightGrey2,
                                                              ),
                                                              CommonText(
                                                                text:
                                                                AppString.pendingLowerCase,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14.sp,
                                                              ),
                                                            ],
                                                          ).marginOnly(bottom: 8.h),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              CommonText(
                                                                text: AppString.timeLower,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12.sp,
                                                                color: AppColors.lightGrey2,
                                                              ),
                                                              CommonText(
                                                                text:
                                                                AppString.pendingLowerCase,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14.sp,
                                                              ),
                                                            ],
                                                          ).marginOnly(bottom: 8.h),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              CommonText(
                                                                text: AppString.peopleLower,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12.sp,
                                                                color: AppColors.lightGrey2,
                                                              ),
                                                              CommonText(
                                                                text:
                                                                AppString.pendingLowerCase,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14.sp,
                                                              ),
                                                            ],
                                                          ).marginOnly(bottom: 8.h),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              CommonText(
                                                                text: AppString.payment,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12.sp,
                                                                color: AppColors.lightGrey2,
                                                              ),
                                                              CommonText(
                                                                text:
                                                                AppString.pendingLowerCase,
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
                                            Container(
                                              padding: EdgeInsets.all(12.r),
                                              margin: EdgeInsets.only(
                                                  top: 10.h,
                                                  bottom: 16.h,
                                                  left: 16.w,
                                                  right: 16.w),
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
                                                title: CommonText(
                                                  text: AppString.setAlert,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.sp,
                                                ),
                                                trailing: Container(
                                                  padding: EdgeInsets.all(10.r),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(48.r),
                                                    color: _pendingOrderController.pendingOrders[index].isSetAlert!.value  ?  Colors.red : AppColors.green ,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Image.asset(ImagesAsset.play),
                                                      CommonText(
                                                        text: _pendingOrderController.pendingOrders[index].isSetAlert.value  ?  AppString.stopAlert :  AppString.startAlert,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 15.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border:
                                                        Border.all(color: AppColors.purple),
                                                        borderRadius: BorderRadius.circular(10.r),
                                                      ),
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 47.w, vertical: 14.h),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.close,
                                                            color: AppColors.purple,
                                                          ),
                                                          1.w.horizontalSpace,
                                                          CommonText(
                                                            text: AppString.reject,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 14.sp,
                                                            color: AppColors.purple,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  12.w.horizontalSpace,
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap : () {

                                                        // _pendingOrderController.isSetAlert.value = !_pendingOrderController.isSetAlert.value;
                                                        _pendingOrderController.pendingOrders[index].isSetAlert.value = !_pendingOrderController.pendingOrders[index].isSetAlert.value;
                                                        // _pendingOrderController.pendingOrders.refresh();
                                                        Get.back();
                                                        _pendingOrderController.pendingOrders.refresh();
                                                        // print("valll ---- ${_pendingOrderController.isSetAlert.value}");


                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: AppColors.purple,
                                                          border: Border.all(
                                                              color: AppColors.darkTheme),
                                                          borderRadius: BorderRadius.circular(10.r),
                                                        ),
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 47.w, vertical: 14.h),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.check,
                                                              color: AppColors.white,
                                                            ),
                                                            1.w.horizontalSpace,
                                                            CommonText(
                                                              text: AppString.accept,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            20.h.verticalSpace,
                                            Container(
                                              height: 4.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.r),
                                                color: AppColors.white,
                                              ),
                                              width: double.infinity,
                                            )
                                                .marginSymmetric(horizontal: 130.w)
                                          ],
                                        ),
                                      ),
                                    );

                                  });
                             }
                           );


                },
              );
            }
          ),
          Center(child: Icon(Icons.notifications_active_outlined)),
          Center(child: Icon(Icons.directions_bike)),
        ],
      ),
    );
  }

  void showCustomBottomSheet({required PendingOrdersDataModel pendingOrdersDataModel}){

  }

  Widget pendingOrderCard({
    required PendingOrdersDataModel pendingOrdersDataModel,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.darkBackGroundHome),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  pendingOrdersDataModel.profile ?? "",
                  height: 38.h,
                  width: 38.w,
                ).paddingOnly(left: 12.w, right: 8.w),
                CommonText(
                  text: pendingOrdersDataModel.userName ?? "",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.darkTheme,
                      borderRadius: BorderRadius.circular(5.r)),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconAsset.bell,
                        height: 20.h,
                        width: 20.w,
                        color: (pendingOrdersDataModel.isSetAlert?.value  ?? true) ? Colors.white : Colors.yellow,
                      ),
                      8.w.horizontalSpace,
                      CommonText(
                        text: (pendingOrdersDataModel.isSetAlert?.value ?? true) ? AppString.setAlert : AppString.activeAlert,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                )
              ],
            ).paddingAll(12.r),
            Divider(
              color: AppColors.dividerColor2,
              thickness: 2,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CommonText(
                          text: AppString.date,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ).paddingOnly(bottom: 4.h),
                        CommonText(
                          text: pendingOrdersDataModel.date ?? "",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    width: 2.w,
                    color: AppColors.dividerColor2,
                  ).paddingSymmetric(horizontal: 24.w),
                  Expanded(
                    child: Column(
                      children: [
                        CommonText(
                          text: AppString.time,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ).paddingOnly(bottom: 4.h),
                        CommonText(
                          text: pendingOrdersDataModel.time ?? "",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    width: 2.w,
                    color: AppColors.dividerColor2,
                  ).paddingSymmetric(horizontal: 24.w),
                  Expanded(
                    child: Column(
                      children: [
                        CommonText(
                          text: AppString.people,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ).paddingOnly(bottom: 4.h),
                        CommonText(
                          text: pendingOrdersDataModel.people ?? "",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 16.w, vertical: 20.h),
            ),
          ],
        ),
      ).marginOnly(left: 16.w, right: 16.w, top: 12.h),
    );
  }
}
