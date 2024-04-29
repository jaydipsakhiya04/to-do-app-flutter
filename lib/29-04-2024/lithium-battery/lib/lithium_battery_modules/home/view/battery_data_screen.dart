import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/lithium_battery_modules/home/controller/battery_data_controller.dart';
import 'package:flutter_template/lithium_battery_modules/home/widget/battery_features.dart';
import 'package:flutter_template/lithium_battery_modules/home/widget/temprature_widget.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/utils/navigation_utils/routes.dart';
import 'package:flutter_template/utils/social_authentication/app_validations.dart';
import 'package:flutter_template/widget/app_snackbar.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_button.dart';
import 'package:flutter_template/widget/custom_textfeild.dart';
import 'package:get/get.dart';

class BatteryDataScreen extends StatelessWidget {
  BatteryDataScreen({Key? key}) : super(key: key);

  final BatteryDataController _batteryDataController =
      Get.put(BatteryDataController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageAsset.bgImage),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            // statusBarColor: AppColors.darkBlue,
            statusBarIconBrightness: Brightness.light,
          ),
          toolbarHeight: 6.h,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: AppString.deviceName,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
                PopupMenuButton<String>(
                  color: AppColors.white,
                  icon: SvgPicture.asset(
                    ImageAsset.more,
                  ).paddingOnly(right: 10.w, bottom: 4.h),
                  iconSize: 40.sp,
                  onSelected: (String value) {
                    if (value == AppString.searchDevices) {
                      Navigation.replace(Routes.bluetoothDeviceScreen);
                    } else if (value == AppString.details) {
                      passwordDialog(context,
                          onTap: () {
                            if (_batteryDataController
                                .detailsController.text.isNotEmpty) {
                              Navigation.replace(Routes.batteryDetailScreen);
                              _batteryDataController.detailsController.clear();
                            } else {
                              AppSnackBar.showSnackBarAtTop(
                                  message: "Please enter Password");
                            }
                          },
                          controller: _batteryDataController.detailsController,
                          onTapBack: () {
                            _batteryDataController.detailsController.clear();
                            Navigation.pop();
                          });
                    } else if (value == AppString.setting) {
                      passwordDialog(context,
                          onTap: () {
                            if (_batteryDataController
                                .settingController.text.isNotEmpty) {
                              Navigation.replace(Routes.parameterSettingScreen);
                              _batteryDataController.settingController.clear();
                            } else {
                              AppSnackBar.showSnackBarAtTop(
                                  message: "Please enter Password");
                            }
                          },
                          controller: _batteryDataController.settingController,
                          onTapBack: () {
                            _batteryDataController.settingController.clear();
                            Navigation.pop();
                          });
                    } else if (value == AppString.profile) {
                      passwordDialog(context,
                          onTap: () {
                            if (_batteryDataController
                                .profileController.text.isNotEmpty) {
                              Navigation.replace(Routes.profileScreen);
                              _batteryDataController.profileController.clear();
                            } else {
                              AppSnackBar.showSnackBarAtTop(
                                  message: "Please enter Password");
                            }
                          },
                          controller: _batteryDataController.profileController,
                          onTapBack: () {
                            _batteryDataController.profileController.clear();
                            Navigation.pop();
                          });
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                          value: AppString.searchDevices,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                ImageAsset.searchDevice,
                                height: 20.w,
                                width: 20.w,
                              ),
                              10.w.horizontalSpace,
                              CommonText(
                                text: "searchDevices".tr,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkBlue,
                              ),
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: AppString.details,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                ImageAsset.note,
                                height: 20.w,
                                width: 20.w,
                              ),
                              10.w.horizontalSpace,
                              CommonText(
                                text: "details".tr,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkBlue,
                              ),
                            ],
                          )),
                      PopupMenuItem<String>(
                          value: AppString.setting,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                ImageAsset.setting,
                                height: 20.w,
                                width: 20.w,
                              ),
                              10.w.horizontalSpace,
                              CommonText(
                                text: "setting".tr,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkBlue,
                              ),
                            ],
                          )),
                      PopupMenuItem<String>(
                        value: AppString.profile,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ImageAsset.profile,
                              height: 20.w,
                              width: 20.w,
                            ),
                            10.w.horizontalSpace,
                            CommonText(
                              text: "profile".tr,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkBlue,
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ).paddingOnly(left: 16.w, top: 10.h),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Stack(
              //   children: [
              //     Positioned(
              //       // Battery Body
              //       child: SvgPicture.asset(
              //         ImageAsset.batteryBody,
              //         width: 104.w,
              //         height: 280.h,
              //       ),
              //     ),
              //     Positioned(
              //       // Battery Level
              //       top: 0.h,
              //       left: 0.5.w,
              //       child: SvgPicture.string(
              //         _batteryDataController.getBatterySVG(70),
              //         height: 180.h,
              //       ),
              //     ),
              //     Positioned(
              //       // Battery Top
              //       child: SvgPicture.asset(
              //         ImageAsset.batteryTop,
              //         width: 260.w,
              //         height: 282.h,
              //       ),
              //     ),
              //     Positioned(
              //       // Battery Bottom
              //       child: SvgPicture.asset(
              //         ImageAsset.batteryBottom,
              //         width: 260.w,
              //         height: 280.h,
              //       ),
              //     ),
              //     Positioned(
              //       // Battery Level Text
              //       top: 110.h,
              //       left: 116.w,
              //       child: CommonText(
              //         text: "70%",
              //         fontSize: 30.sp,
              //         fontWeight: FontWeight.w600,
              //         color: AppColors.white,
              //       ),
              //     ),
              //   ],
              // ),
              Stack(
                children: [
                  Positioned(
                    // Battery Body
                    child: SvgPicture.asset(
                      ImageAsset.batteryBody,
                      width: 104.w,
                      height: 280.h,
                    ),
                  ),
                  Positioned(
                    // Battery Level
                    top: 0.h,
                    left: 0.5.w,
                    child: SvgPicture.string(
                      _batteryDataController.getBatterySVG(70),
                      height: 180.h,
                    ),
                  ),
                  Positioned(
                    // Battery Top
                    child: SvgPicture.asset(
                      ImageAsset.batteryTop,
                      width: 260.w,
                      height: 282.h,
                    ),
                  ),
                  Positioned(
                    // Battery Bottom
                    child: SvgPicture.asset(
                      ImageAsset.batteryBottom,
                      width: 260.w,
                      height: 280.h,
                    ),
                  ),
                  Positioned.fill(
                    child: FractionallySizedBox(
                      widthFactor: 0.190.w, // Adjust as needed
                      heightFactor: 0.2.h, // Adjust as needed
                      alignment: Alignment.center,
                      child: CommonText(
                        text: "70%",
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 20.h,
                  bottom: 10.h,
                ),
                margin: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  bottom: 50.h,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.whiteGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: BatteryFeatures(
                            image: ImageAsset.voltage,
                            title: "voltage".tr,
                            amount: "14.262",
                          ),
                        ),
                        12.w.horizontalSpace,
                        Expanded(
                          child: BatteryFeatures(
                            image: ImageAsset.average,
                            title: "currentAverage".tr,
                            amount: "0.0",
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
                            title: "ratedCapacity".tr,
                            amount: "10.00Ah",
                          ),
                        ),
                        12.w.horizontalSpace,
                        Expanded(
                          child: BatteryFeatures(
                            image: ImageAsset.cycleTime,
                            title:"cycleTime".tr,
                            amount: "0",
                          ),
                        ),
                      ],
                    ),
                    16.h.verticalSpace,
                    TemperatureWidget(
                        image: ImageAsset.temperature,
                        title: "TS1",
                        amount: "27'C"),
                    12.h.verticalSpace,
                    TemperatureWidget(
                        image: ImageAsset.temperature,
                        title: "TS2",
                        amount: "27'C"),
                    16.h.verticalSpace,
                    Divider(
                      height: 0.h,
                      thickness: 2,
                      color: AppColors.lightGrey,
                    ),
                    8.h.verticalSpace,
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: CommonText(
                        text: AppString.cMos,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue,
                      ),
                      trailing: Theme(
                        data: ThemeData(
                          useMaterial3: true,
                        ).copyWith(
                          colorScheme: Theme.of(context)
                              .colorScheme
                              .copyWith(outline: Colors.transparent),
                        ),
                        child: SwitchTheme(
                          data: const SwitchThemeData(
                            thumbIcon: MaterialStatePropertyAll(
                              Icon(
                                Icons.add,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          child: Obx(
                            () => Transform.scale(
                              scale: 0.7,
                              child: Switch(
                                inactiveThumbColor: AppColors.white,
                                inactiveTrackColor: AppColors.grey,
                                activeTrackColor: AppColors.orange,
                                onChanged: (value) {
                                  _batteryDataController
                                      .changeSwitchValue(value);
                                },
                                value: _batteryDataController.isActive.value,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future passwordDialog(
    BuildContext context, {
    required VoidCallback? onTap,
    required TextEditingController controller,
    required VoidCallback? onTapBack,
  }) {
    return showDialog(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: "inputPwd".tr,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkBlue,
              ),
              24.h.verticalSpace,
              CustomTextField(
                contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                controller: controller,
                prefixImage: ImageAsset.lock,
                hintText: "enterPassword".tr,
                validator: (value) => AppValidation.validatePassword(value),
              ),
              40.h.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        buttonColor: AppColors.white,
                        buttonBorderColor: AppColors.darkBlue,
                        textColor: AppColors.darkBlue,
                        text: "cancel".tr,
                        needBorderColor: true,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        onTap: onTapBack),
                  ),
                  16.w.horizontalSpace,
                  Expanded(
                    child: CustomButton(
                      onTap: onTap,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      buttonColor: AppColors.orange,
                      textColor: AppColors.white,
                      needBorderColor: false,
                      text: "ok".tr,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(vertical: 40.h, horizontal: 16.w),
        ),
      ),
    );
  }
}
