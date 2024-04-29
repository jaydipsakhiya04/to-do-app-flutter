import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/lithium_battery_modules/home/controller/bluetooth_devices_controller.dart';
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

class BluetoothDevicesScreen extends StatelessWidget {
  BluetoothDevicesScreen({Key? key}) : super(key: key);

  final BluetoothDevicesController _bluetoothDevicesController = Get.put(BluetoothDevicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteGrey,
        toolbarHeight: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                color: AppColors.whiteGrey,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  14.h.verticalSpace,
                  ListTile(
                    // dense: true,
                    leading: SizedBox(),
                    minLeadingWidth: 50.w,
                    title: Center(
                      child: CommonText(
                        textAlign: TextAlign.right,
                        text: "bluetoothDevices".tr,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    trailing: PopupMenuButton<String>(
                      color: AppColors.white,
                      icon: SvgPicture.asset(
                        ImageAsset.more,
                        color: AppColors.darkBlue,
                      ).paddingOnly(right: 8.w, bottom: 4.h),
                      iconSize: 40.sp,
                      onSelected: (String value) {
                        if (value == AppString.setting) {
                          passwordDialog(context,
                              onTap: () {
                                if (_bluetoothDevicesController
                                    .settingController.text.isNotEmpty) {
                                  Navigation.replace(
                                      Routes.parameterSettingScreen);
                                  _bluetoothDevicesController.settingController
                                      .clear();
                                } else {
                                  AppSnackBar.showSnackBarAtTop(
                                      message: "Please enter Password");
                                }
                              },
                              controller:
                                  _bluetoothDevicesController.settingController,
                              onTapBack: () {
                                _bluetoothDevicesController.settingController
                                    .clear();
                                Navigation.pop();
                              });
                        } else if (value == AppString.profile) {
                          passwordDialog(
                              context,
                              onTap: () {
                                if (_bluetoothDevicesController
                                    .profileController.text.isNotEmpty) {
                                  Navigation.replace(Routes.profileScreen);
                                  _bluetoothDevicesController.profileController
                                      .clear();
                                } else {
                                  AppSnackBar.showSnackBarAtTop(
                                      message: "Please enter Password");
                                }
                              },
                              controller:
                                  _bluetoothDevicesController.profileController,
                              onTapBack: () {
                                _bluetoothDevicesController.profileController
                                    .clear();
                                Navigation.pop();
                              });
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
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
                  ),
                  0.h.verticalSpace,
                  CommonText(
                    text: "searchingDevices".tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                  14.h.verticalSpace,
                  SvgPicture.asset(
                    ImageAsset.blutoothWave,
                    height: 184.h,
                    width: 184.h,
                  ),
                ],
              ),
            ),
            16.h.verticalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "availableDevices".tr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkBlue,
                ),
                16.h.verticalSpace,
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightGrey3,
                            spreadRadius: 4,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        child: Material(
                          color: AppColors.white,
                          child: Obx(
                            () => ListTile(
                              onTap: () {
                                _bluetoothDevicesController
                                    .setSelectedLanguageIndex(index);
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    SystemChrome.setEnabledSystemUIMode(
                                        SystemUiMode.edgeToEdge);
                                    if (_bluetoothDevicesController
                                            .selectedIndex.value ==
                                        index) {
                                      alertDialogBoxes(context);
                                    }
                                  },
                                );
                              },
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12.w),
                              dense: true,
                              tileColor: AppColors.white,
                              leading: Container(
                                  padding: EdgeInsets.all(8.r),
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: SvgPicture.asset(
                                    ImageAsset.battery,
                                    height: 24.h,
                                    width: 24.h,
                                  )),
                              title: CommonText(
                                text: AppString.deviceName,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkBlue,
                              ),
                              subtitle: CommonText(
                                text: AppString.deviceAddress,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                              trailing: _bluetoothDevicesController
                                          .selectedIndex.value ==
                                      index
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CommonText(
                                          text: AppString.pairing,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey,
                                        ).paddingOnly(bottom: 4.h),
                                      ],
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 16.w),
          ],
        ),
      ),
    );
  }

  Future alertDialogBoxes(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: "bluetoothPairing".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue,
                    ),
                  ],
                ),
                24.h.verticalSpace,
                CommonText(
                  text: AppString.deviceName,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkBlue,
                ),
                6.h.verticalSpace,
                CommonText(
                  text: AppString.deviceAddress,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
                16.h.verticalSpace,
                CommonText(
                  text: "pairUpWithTheDevice".tr,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkBlue,
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
                        onTap: () {
                          Navigation.pop();
                        },
                      ),
                    ),
                    16.w.horizontalSpace,
                    Expanded(
                      child: CustomButton(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        buttonColor: AppColors.orange,
                        textColor: AppColors.white,
                        needBorderColor: false,
                        text: "pair".tr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        onTap: () {
                          _bluetoothDevicesController.selectedIndex.value = -1;
                          Navigation.pop();
                          // Open the second dialog here
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                insetPadding:
                                    EdgeInsets.symmetric(horizontal: 0.w),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2.r),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                child: Container(
                                  color: AppColors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        ImageAsset.pairing,
                                        height: 100.h,
                                        width: 100.h,
                                      ),
                                      24.h.verticalSpace,
                                      CommonText(
                                        text: "pairedSuccessfully".tr,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkBlue,
                                      ),
                                      8.h.verticalSpace,
                                      CommonText(
                                        text: "yourDeviceIsConnectedSuccessfullyNow".tr,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey,
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      vertical: 50.h, horizontal: 20.w),
                                ),
                              );
                            },
                          );
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              Navigation.pop();
                              Navigation.replaceAll(Routes.batteryDataScreen);
                              _bluetoothDevicesController.selectedIndex.value =
                                  -1;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                40.h.verticalSpace,
              ],
            ).paddingSymmetric(horizontal: 16.w),
          ),
        );
      },
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
