import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/businessdetails/controller/business_address_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/data_passing_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';
import 'package:permission_handler/permission_handler.dart';

class BusinessAddressScreen extends StatelessWidget {
  BusinessAddressScreen({Key? key}) : super(key: key);
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  BusinessAddressController businessAddressController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImagesAsset.bgImage),
        ),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          onTap: () {
            // Handle back button tap
            Navigator.pop(context);
            // Dismiss the keyboard if it's open
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.whatIsYourBusinessAddress,
                fontWeight: FontWeight.w500,
                height: 1.4,
                fontSize: 28.sp,
              ),
              CommonText(
                text: AppString.whatIsYourBusinessAddressDescription,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 1.5,
                color: AppColors.bodyDark,
              ).paddingOnly(top: 5.h, bottom: 18.h),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(bottom: 40.h),
              GestureDetector(
                onTap: () {
                  _requestLocationPermission();
                },
                child: Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(
                      //   ImagesAsset.currentLocation1,
                      //   width: 20.w,
                      // ).paddingOnly(right: 8.h),
                      CommonText(
                        text: AppString.deviceLocation,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ),
              ).paddingOnly(bottom: 24.h),
              CommonText(
                text: AppString.address,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
              Obx(() => CustomTextField(
                    filled: true,
                    hintText: (businessAddressController.name.isNotEmpty)
                        ? businessAddressController.name.value
                        : AppString.enterAddress,
                    controller: TextEditingController(),
                    fillColor: AppColors.whiteColor.withOpacity(0.1),
                  ).paddingOnly(top: 10.h, bottom: 13.h)),
              CommonText(
                fontSize: 12.sp,
                text: AppString.aptSuiteOther,
                fontWeight: FontWeight.w600,
              ),
              Obx(() => CustomTextField(
                    filled: true,
                    hintText: (businessAddressController.subLocality.isNotEmpty)
                        ? businessAddressController.subLocality.value
                        : AppString.enterAptSuiteOther,
                    controller: TextEditingController(),
                    fillColor: AppColors.whiteColor.withOpacity(0.1),
                  ).paddingOnly(top: 10.h, bottom: 13.h)),
              CommonText(
                fontSize: 12.sp,
                text: AppString.zipCode,
                fontWeight: FontWeight.w600,
              ),
              Obx(() => CustomTextField(
                    onChanged: (value) {
                      businessAddressController.getLocationFromZip(value);
                    },
                    filled: true,
                    hintText: (businessAddressController.postalCode.isNotEmpty)
                        ? businessAddressController.postalCode.value
                        : AppString.enterZipCode,
                    controller: businessAddressController.zipCodeController,
                    fillColor: AppColors.whiteColor.withOpacity(0.1),
                  ).paddingOnly(top: 10.h, bottom: 13.h)),
              CommonText(
                fontSize: 12.sp,
                text: AppString.city,
                fontWeight: FontWeight.w600,
              ),
              GetBuilder<BusinessAddressController>(
                builder: (controller) {
                  return CustomTextField(
                    hintText: businessAddressController.zipCodeController.text.isNotEmpty
                        ? businessAddressController.city.value
                        : (businessAddressController.locality.isNotEmpty)
                            ? businessAddressController.locality.value
                            : AppString.enterCity,
                    filled: true,
                    controller: TextEditingController(),
                    fillColor: AppColors.whiteColor.withOpacity(0.1),
                  ).paddingOnly(top: 10.h, bottom: 13.h);
                },
              ),
              CommonText(
                fontSize: 12.sp,
                text: AppString.state,
                fontWeight: FontWeight.w600,
              ),
              DropdownButtonFormField<String>(
                icon: Image.asset(
                  ImagesAsset.downArrow,
                  height: 6.h,
                  color: AppColors.bodyDark,
                ).paddingOnly(right: 5.w),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.blackColor),
                      borderRadius: BorderRadius.circular(4.r)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.blackColor),
                      borderRadius: BorderRadius.circular(4.r)),
                  contentPadding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  filled: true,
                ),
                hint: GetBuilder<BusinessAddressController>(
                  builder: (controller) {
                    return Text(
                      controller.zipCodeController.text.isNotEmpty
                          ? controller.state.value
                          : (businessAddressController.administrativeArea.isNotEmpty)
                              ? businessAddressController.administrativeArea.value
                              : AppString.selectState,
                      style: TextStyle(
                        color: AppColors.bodyDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    );
                  },
                ),
                value: businessAddressController.dropdownValue?.value,
                onChanged: (String? newValue) {
                  businessAddressController.dropdownValue?.value = newValue!;
                },
                items: businessAddressController.list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ).paddingOnly(top: 10.h, bottom: 13.h),
              CommonText(
                fontSize: 12.sp,
                text: AppString.country,
                fontWeight: FontWeight.w600,
              ),
              DropdownButtonFormField<String>(
                icon: Image.asset(
                  ImagesAsset.downArrow,
                  height: 6.h,
                  color: AppColors.bodyDark,
                ).paddingOnly(right: 5.w),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.blackColor),
                      borderRadius: BorderRadius.circular(4.r)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.blackColor,
                      ),
                      borderRadius: BorderRadius.circular(4.r)),
                  contentPadding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  filled: true,
                ),
                hint: GetBuilder<BusinessAddressController>(
                  builder: (controller) {
                    return Text(
                      businessAddressController.zipCodeController.text.isNotEmpty
                          ? businessAddressController.country.value
                          : (businessAddressController.country.isNotEmpty)
                              ? businessAddressController.country.value
                              : AppString.selectCountry,
                      style: TextStyle(
                        color: AppColors.bodyDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    );
                  },
                ),
                value: businessAddressController.dropdownValue?.value,
                onChanged: (String? newValue) {
                  businessAddressController.dropdownValue?.value = newValue!;
                },
                items: businessAddressController.list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ).paddingOnly(top: 10.h),
              CustomButton(
                onTap: () {
                  // if (businessAddressController.addressController.text.isNotEmpty ||
                  //     businessAddressController.aptSuiteOtherController.text.isNotEmpty ||
                  //     businessAddressController.cityController.text.isNotEmpty ||
                  //     businessAddressController.zipCodeController.text.isNotEmpty) {
                  //   Navigation.pushNamed(Routes.getStart);
                  // }
                  Map<String, dynamic> userDetails = businessAddressController.getUserDetails();
                  Navigation.pushNamed(Routes.getStart);
                },
                text: AppString.Continue,
              ).paddingOnly(top: 24.h, bottom: 40.h),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 20.h),
        ),
      ),
    );
  }

  void _requestLocationPermission() async {
    final permissionStatus = await Permission.location.request();
    if (permissionStatus == PermissionStatus.granted) {
      _getCurrentLocation();
    } else {
      // Handle permission denied
    }
  }

  void _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      businessAddressController.setLocationFromPosition(position);
    }).catchError((e) {
      print(e);
    });
  }
}
