import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/custom-date-range-picker/custom_date_range_picker.dart';

class DateRangePickerWidget extends StatelessWidget {
  final Rx<DateTime?> startDate;
  final Rx<DateTime?> endDate;

  DateRangePickerWidget({required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showCustomDateRangePicker(
          context,
          dismissible: true,
          minimumDate: DateTime.now().subtract(const Duration(days: 30)),
          maximumDate: DateTime.now().add(const Duration(days: 30)),
          endDate: endDate.value,
          startDate: startDate.value,
          backgroundColor: AppColors.appColor,
          primaryColor: Colors.white,
          onApplyClick: (start, end) {
            startDate.value = start;
            endDate.value = end;
          },
          onCancelClick: () {
            startDate.value = null;
            endDate.value = null;
            // setState(() {
            //   endDate = null;
            //   startDate = null;
            // });
          },
        );

      },
      child: Container(
        color: Colors.transparent,
        child: Image.asset(
          ImagesAsset.calendar,
          height: 22.h,
          width: 22.h,
        ),
      ),
    );
  }
}
