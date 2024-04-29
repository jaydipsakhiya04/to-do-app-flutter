import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/lithium_battery_modules/home/controller/parameter_setting_controller.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_appbar_widget.dart';
import 'package:flutter_template/widget/custom_button.dart';
import 'package:flutter_template/widget/custom_textfeild.dart';
import 'package:get/get.dart';

class ParameterSettingScreen extends StatelessWidget {
  ParameterSettingScreen({Key? key}) : super(key: key);

  final ParameterSettingController _parameterSettingController = Get.put(ParameterSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: "parameterSettings".tr,isSimpleAppBar: false,statusBarIconBrightness: Brightness.light,backgroundColor: AppColors.white,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.only(bottom: 30.h, top: 16.h, left: 16.w, right: 16.w),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _parameterSettingController.settingList.value.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.85),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    TextEditingController parameterController =
                        TextEditingController(text: _parameterSettingController.voltageList.value[index]);
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonText(
                                text: _parameterSettingController.settingList.value[index],
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkBlue,
                              ),
                              CustomTextField(
                                isPrefix: false,
                                prefix: Container(color: Colors.transparent,height: 10.w,width: 30.w,),
                                contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                                controller: parameterController,
                                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                                suffix: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonText(
                                      text: _parameterSettingController.unitList.value[index],
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkBlue,
                                    ),
                                  ],
                                ),
                                keyboardType: TextInputType.number,
                                textColor: AppColors.darkBlue,
                              ),
                              40.h.verticalSpace,
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      padding: EdgeInsets.symmetric(vertical: 15.h),
                                      buttonColor: AppColors.white,
                                      needBorderColor: true,
                                      textColor: AppColors.darkBlue,
                                      text: AppString.cancel,
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
                                      onTap: () {
                                        _parameterSettingController.voltageList.value[index] = parameterController.text;
                                        _parameterSettingController.voltageList.refresh();
                                        Navigation.pop();
                                      },
                                      padding: EdgeInsets.symmetric(vertical: 15.h),
                                      buttonColor: AppColors.orange,
                                      textColor: AppColors.white,
                                      needBorderColor: false,
                                      text: AppString.save,
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
                  },
                  child: Container(
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
                    padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 12.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: CommonText(
                                softWrap: true,
                                text: _parameterSettingController.settingList.value[index],
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Obx(
                              () => CommonText(
                                text: _parameterSettingController.voltageList.value[index],
                                fontSize: 16.sp,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkBlue,
                              ),
                            ),
                            CommonText(
                              text: _parameterSettingController.unitList.value[index],
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkBlue,
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              ImageAsset.next,
                              height: 24.h,
                              width: 24.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      ],
        ),
      ),
    );
  }
}
