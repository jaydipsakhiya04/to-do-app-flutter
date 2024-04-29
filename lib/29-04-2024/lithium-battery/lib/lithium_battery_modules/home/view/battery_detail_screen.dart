import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/lithium_battery_modules/home/controller/battery_detail_controller.dart';
import 'package:flutter_template/lithium_battery_modules/home/widget/battery_features.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_appbar_widget.dart';
import 'package:get/get.dart';

class BatteryDetailScreen extends StatelessWidget {
  BatteryDetailScreen({Key? key}) : super(key: key);

  final BatteryDetailController _batteryDetailController = Get.put(BatteryDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppString.details,
        isSimpleAppBar: false,
        backgroundColor: AppColors.white,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2.r),
                        ),
                      ),
                      backgroundColor: AppColors.white,
                      child: Container(
                        color: AppColors.white,
                        child: Obx(
                          () => SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                      text: AppString.batteryProtectionStatus,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkBlue,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigation.pop();
                                      },
                                      child: SvgPicture.asset(ImageAsset.cross, height: 30.h, width: 30.h),
                                    )
                                  ],
                                ),
                                24.h.verticalSpace,
                                CommonText(
                                  text: AppString.stateOfCharge,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkBlue,
                                ),
                                Wrap(
                                    children: List.generate(_batteryDetailController.chargeList.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _batteryDetailController.setSelectedChargeIndex(index);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                                      margin: EdgeInsets.only(right: 12.w, top: 12.h),
                                      decoration: BoxDecoration(
                                        color: _batteryDetailController.chargeIndex.value == index
                                            ? AppColors.orange
                                            : AppColors.whiteGrey,
                                        borderRadius: BorderRadius.circular(2.r),
                                      ),
                                      child: CommonText(
                                        text: _batteryDetailController.chargeList[index],
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: _batteryDetailController.chargeIndex.value == index
                                            ? Colors.white
                                            : AppColors.darkBlue,
                                      ),
                                    ),
                                  );
                                })),
                                16.h.verticalSpace,
                                CommonText(
                                  text: AppString.chargingAlarm,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkBlue,
                                ),
                                Wrap(
                                    children: List.generate(_batteryDetailController.alarmChargeList.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _batteryDetailController.setSelectedChargingAlarmIndex(index);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                                      margin: EdgeInsets.only(right: 12.w, top: 12.h),
                                      decoration: BoxDecoration(
                                        color: _batteryDetailController.chargingAlarmIndex.value == index
                                            ? AppColors.orange
                                            : AppColors.whiteGrey,
                                        borderRadius: BorderRadius.circular(2.r),
                                      ),
                                      child: CommonText(
                                        text: _batteryDetailController.alarmChargeList[index],
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: _batteryDetailController.chargingAlarmIndex.value == index
                                            ? Colors.white
                                            : AppColors.darkBlue,
                                      ),
                                    ),
                                  );
                                })),
                                16.h.verticalSpace,
                                CommonText(
                                  text: AppString.dischargeState,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkBlue,
                                ),
                                Wrap(
                                    children: List.generate(_batteryDetailController.dischargeStateList.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _batteryDetailController.setSelectedDischargeIndex(index);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                                      margin: EdgeInsets.only(right: 12.w, top: 12.h),
                                      decoration: BoxDecoration(
                                        color: _batteryDetailController.dischargeIndex.value == index
                                            ? AppColors.orange
                                            : AppColors.whiteGrey,
                                        borderRadius: BorderRadius.circular(2.r),
                                      ),
                                      child: CommonText(
                                        text: _batteryDetailController.dischargeStateList[index],
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: _batteryDetailController.dischargeIndex.value == index
                                            ? Colors.white
                                            : AppColors.darkBlue,
                                      ),
                                    ),
                                  );
                                })),
                                16.h.verticalSpace,
                                CommonText(
                                  text: AppString.dischargeAlarm,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkBlue,
                                ),
                                Wrap(
                                    children: List.generate(_batteryDetailController.dischargeAlarmList.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _batteryDetailController.setSelectedDischargingAlarmIndex(index);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                                      margin: EdgeInsets.only(right: 12.w, top: 12.h),
                                      decoration: BoxDecoration(
                                        color: _batteryDetailController.dischargingAlarmIndex.value == index
                                            ? AppColors.orange
                                            : AppColors.whiteGrey,
                                        borderRadius: BorderRadius.circular(2.r),
                                      ),
                                      child: CommonText(
                                        text: _batteryDetailController.dischargeAlarmList[index],
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: _batteryDetailController.dischargingAlarmIndex.value == index
                                            ? Colors.white
                                            : AppColors.darkBlue,
                                      ),
                                    ),
                                  );
                                })),
                              ],
                            ).paddingSymmetric(vertical: 40.h, horizontal: 16.w),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  // padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(right: 16.w),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.w, color: AppColors.orange),
                    ),
                  ),
                  child: CommonText(
                    text: AppString.protectStatus,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ],
          ).paddingOnly(top: 14.h),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.h.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: BatteryFeatures(
                    image: ImageAsset.calendar,
                    title: AppString.dateOfManufacturing,
                    amount: "2.4.2024",
                  ),
                ),
                12.w.horizontalSpace,
                Expanded(
                  child: BatteryFeatures(
                    image: ImageAsset.flash,
                    title: AppString.designVoltage,
                    amount: "14400mV",
                  ),
                ),
              ],
            ),
            12.h.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: BatteryFeatures(
                    image: ImageAsset.capacity,
                    title: AppString.realCapacity,
                    amount: "10000mAh",
                  ),
                ),
                12.w.horizontalSpace,
                Expanded(
                  child: BatteryFeatures(
                    image: ImageAsset.cycleTime,
                    title: AppString.cycleTime,
                    amount: "0",
                  ),
                ),
              ],
            ),
            12.h.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: BatteryFeatures(
                    image: ImageAsset.hVoltage,
                    title: AppString.hVoltage,
                    amount: "3.281V",
                  ),
                ),
                12.w.horizontalSpace,
                Expanded(
                  child: BatteryFeatures(
                    image: ImageAsset.downVoltage,
                    title: AppString.lVoltage,
                    amount: "3.561V",
                  ),
                ),
              ],
            ),
            12.h.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: BatteryFeatures(
                    image: ImageAsset.dv,
                    title: AppString.dv,
                    amount:  "0.007V",
                  ),
                ),
                12.w.horizontalSpace,
                Expanded(child: Container(color: Colors.transparent,),),
              ],
            ),
            16.h.verticalSpace,
            CommonText(
              text: AppString.cellVoltage,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkBlue,
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 16.h,bottom: 25.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _batteryDetailController.cellsList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightGrey,
                        spreadRadius: 0.r,
                        blurRadius: 5.r,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 16.h),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
                    leading: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(color: AppColors.darkWhite, borderRadius: BorderRadius.circular(2.r)),
                      child: SvgPicture.asset(
                        ImageAsset.cell,
                        height: 24.h,
                        width: 24.h,
                      ),
                    ),
                    title: CommonText(
                      text: _batteryDetailController.cellsList[index],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                    trailing: CommonText(
                      text: _batteryDetailController.cellsVoltageList[index],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue,
                    ),
                  ),
                );
              },
            )
          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    );
  }
}
