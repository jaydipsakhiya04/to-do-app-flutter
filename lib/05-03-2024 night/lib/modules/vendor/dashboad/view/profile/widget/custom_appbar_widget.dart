import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/analytics/controller/analystic_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/widget/common_text.dart';


class CustomAppBar{
  static PreferredSize customAppBar({required BuildContext context}){
    final AnalysticController _analysticController= Get.find();
    return PreferredSize(
      preferredSize: const Size.fromHeight(40),
      child: Obx(
            () => Column(
          children: [
            Divider(
              thickness: 2,
              color: AppColors.dividerColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonText(
                  text: AppString.dateRange,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                if (_analysticController.startDate.value != null)
                  CommonText(
                    text:
                    "${_analysticController.startDate.value!.day}/${_analysticController.startDate.value!.month}/${_analysticController.startDate.value!.year}",
                    color: AppColors.purple,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),

                if(_analysticController.startDate.value != null&&_analysticController.endDate.value != null)
                  CommonText(
                    text: "--",
                    color: AppColors.purple,
                  ).marginSymmetric(horizontal: 8.w),
                if (_analysticController.endDate.value != null)
                  CommonText(
                    text:
                    "${_analysticController.endDate.value!.day}/${_analysticController.endDate.value!.month}/${_analysticController.endDate.value!.year}",
                    color: AppColors.purple,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ).marginOnly(right: 12.w),
                GestureDetector(
                  onTap: () async {
                    final picked = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2025),
                      initialDateRange:
                      _analysticController.startDate.value != null && _analysticController.endDate.value != null
                          ? DateTimeRange(
                        start: _analysticController.startDate.value!,
                        end: _analysticController.endDate.value!,)
                          : null,
                    );

                    if (picked != null) {
                      _analysticController.selectDateRange(picked.start, picked.end);
                    }
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Icon(
                      Icons.calendar_month_rounded,
                      color: AppColors.purple,
                    ),
                  ),
                ),
              ],
            ).paddingOnly(bottom: 10.h, left: 16.w, right: 16.w),
          ],
        ),
      ),
    );
  }
}