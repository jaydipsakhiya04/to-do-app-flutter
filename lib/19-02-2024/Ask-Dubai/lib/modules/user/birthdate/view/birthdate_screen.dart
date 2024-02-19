import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/user/birthdate/controller/birthdate_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class BirthDateScreen extends StatelessWidget {
  BirthDateScreen({Key? key}) : super(key: key);
  final BirthDateController birthDateController = Get.put(BirthDateController());

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
        appBar: CustomAppBar(),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.tellUsBirthdate,
                fontWeight: FontWeight.w500,
                fontSize: 28.sp,
              ),
              CommonText(
                text: AppString.tellUsBirthdateDescription,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.bodyDark,
              ).paddingOnly(top: 12.h, bottom: 18.h),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(bottom: 40.h),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(textTheme: CupertinoTextThemeData(textStyle: TextStyle(color: Colors.red))),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime:
                        DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day), // Set initialDateTime to 18 years ago
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (value) {
                      birthDateController.selectedDate.value = value;
                      birthDateController.calculateAge();
                    },
                  ),
                ),
              ),
              CommonText(
                text: AppString.summary,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: /*AppColors.hintTextColor*/ Colors.white,
              ).paddingOnly(top: 12.h, bottom: 8.h),
              Obx(() => Row(
                    children: [
                      CommonText(
                        text: "Your Age:",
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.bodyDark,
                      ).paddingOnly(right: 5.w),
                      CommonText(
                        text: "${birthDateController.age} years",
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: AppColors.titleDark,
                      ),
                    ],
                  )),
              Obx(() {
                if (birthDateController.message.isNotEmpty) {
                  return Text(birthDateController.message.value, style: const TextStyle(color: Colors.red));
                } else {
                  return const SizedBox.shrink();
                }
              }),
              CustomButton(
                onTap: () {
                  birthDateController.setMessage();
                },
                text: AppString.Continue,
              ).paddingOnly(top: 26.h, bottom: 40.h),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
  }
}
