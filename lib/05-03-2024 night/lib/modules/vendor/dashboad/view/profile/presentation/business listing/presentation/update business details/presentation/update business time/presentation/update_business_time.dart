import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/businessdetails/controller/business_address_controller.dart';
import 'package:local/modules/vendor/businessdetails/controller/business_hour_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';


class UpdateBusinessTime extends StatelessWidget {
  final String? title;
  final BusinessHourController controller = Get.find();

  UpdateBusinessTime({
    Key? key,
     this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackGroundHome,
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
          text: AppString.updateBusinessTime,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var day in controller.daysOfWeek) ...[
              _buildDayTimeField(day, context),
              if (BusinessHourController.showAddMore[day]!.value) // Conditionally show additional fields based on controller state
                _buildAdditionalDayTimeField(day, context),
            ],

            CustomButton(
              onTap: () {
              },
              text: AppString.saveContinue,
            ).paddingOnly(top: 24.h, bottom: 40.h),
          ],
        )).paddingOnly(left: 16.w, right: 16.w, top: 20.h),
      ),
    );
  }

  // Inside BusinessHoursScreen class

  Widget _buildDayTimeField(String day, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: day,
              fontWeight: FontWeight.w500,
              height: 1.4,
              fontSize: 13.sp,
            ).paddingOnly(bottom: 8.h),
            GestureDetector(
              onTap: () {
                controller.toggleAddMore(day);
              },
              child: CommonText(
                text: AppString.addMoreHours,
                fontWeight: FontWeight.w500,
                height: 1.4,
                fontSize: 14.sp,
              ).paddingOnly(bottom: 8.h),
            ),
          ],
        ),
        Obx(
              () => TimeSelectionField(
            openingHintText: controller.openingTimes[day]?.value != null ? " ${_formatTime(controller.openingTimes[day]!.value!)}" : "11:30 am",
            openingOnTap: () async {
              TimeOfDay? time = await getTime(context: context, title: "11:30 am");
              if (time != null) {
                controller.setOpenTime(day, time);
              }
            },
            closingHintText: controller.closingTimes[day]?.value != null ? " ${_formatTime(controller.closingTimes[day]!.value!)}" : "2:15 pm",
            closingOnTap: () async {
              if (controller.openingTimes[day]?.value != null) {
                TimeOfDay? time = await getTime(
                    context: context,
                    title: "2:15 pm",
                    initialTime: controller.closingTimes[day]!.value,
                    minTime: controller.openingTimes[day]!.value);
                if (time != null) {
                  controller.setClosingTime(day, time);
                }
              }
            },
          ),
        ).paddingOnly(bottom: 12.h),
      ],
    );
  }

  Widget _buildAdditionalDayTimeField(String day, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
              () => TimeSelectionField(
            openingHintText: controller.openingTimes[day]?.value != null ? _formatTime(controller.openingTimes[day]!.value!) : "Opening at",
            openingOnTap: () async {
              TimeOfDay? time = await getTime(context: context, title: "Opening At");
              if (time != null) {
                controller.setOpenTime(day, time);
              }
            },
            closingHintText: controller.closingTimes[day]?.value != null ? _formatTime(controller.closingTimes[day]!.value!) : "Closing At",
            closingOnTap: () async {
              if (controller.openingTimes[day]?.value != null) {
                TimeOfDay? time = await getTime(
                    context: context,
                    title: "Closing At",
                    initialTime: controller.closingTimes[day]!.value,
                    minTime: controller.openingTimes[day]!.value);
                if (time != null) {
                  controller.setClosingTime(day, time);
                }
              }
            },
          ),
        ).paddingOnly(bottom: 12.h),
      ],
    );
  }
}

class TimeSelectionField extends StatelessWidget {
  final String openingHintText;
  final String closingHintText;
  final Function openingOnTap;
  final Function closingOnTap;

  const TimeSelectionField({
    Key? key,
    required this.openingHintText,
    required this.closingHintText,
    required this.openingOnTap,
    required this.closingOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              await openingOnTap();
            },
            child: Container(
              height: 48.h,
              padding: EdgeInsets.only(top: 10.h, bottom: 13.h, right: 8.w, left: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: AppColors.whiteColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CommonText(
                      text: openingHintText,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.bodyDark, // Customize as needed
                    ),
                  ),
                  Image.asset(
                    ImagesAsset.downArrow,
                    scale: 3.h,
                  ),
                ],
              ),
            ).paddingOnly(right: 4.w),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () async {
              await closingOnTap();
            },
            child: Container(
              height: 48.h,
              padding: EdgeInsets.only(top: 10.h, bottom: 13.h, right: 8.w, left: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: AppColors.whiteColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CommonText(
                      text: closingHintText,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.bodyDark, // Customize as needed
                    ),
                  ),
                  Image.asset(
                    ImagesAsset.downArrow,
                    scale: 3.h,
                  ),
                ],
              ),
            ).paddingOnly(left: 4.w),
          ),
        ),
      ],
    );
  }
}

String _formatTime(TimeOfDay time) {
  String hour = time.hourOfPeriod < 10 ? '0${time.hourOfPeriod}' : '${time.hourOfPeriod}';
  String minute = time.minute < 10 ? '0${time.minute}' : '${time.minute}';
  String period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hour:$minute $period';
}

Future<TimeOfDay?> getTime({
  required BuildContext context,
  String? title,
  TimeOfDay? initialTime,
  TimeOfDay? minTime,
  String? cancelText,
  String? confirmText,
}) async {
  TimeOfDay? time = await showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
    helpText: title ?? "Select time",
    initialEntryMode: TimePickerEntryMode.dial,
  );

  return time;
}
