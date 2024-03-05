import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/date_range_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/date_range_picker.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/widget/common_text.dart';

class AppBarwidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarwidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColors.backGroundHome3,
        ),
      ),
      backgroundColor: AppColors.darkBackGroundHome,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigation.pop();
            },
            child: Container(
              color: Colors.transparent,
              child: Image.asset(
                ImagesAsset.backarrow,
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
          CommonText(text: title, fontSize: 18.sp, fontWeight: FontWeight.w600),
        ],
      ),
      bottom: PreferredSize(
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
                  // if (_analysticController.startDate.value != null)
                  //   CommonText(
                  //     text:
                  //         "${_analysticController.startDate.value!.day}-${_analysticController.startDate.value!.month}-${_analysticController.startDate.value!.year}",
                  //     color: AppColors.purple,
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 12.sp,
                  //   ),
                  // if (_analysticController.startDate.value != null && _analysticController.endDate.value != null)
                  //   CommonText(
                  //     text: "--",
                  //     color: AppColors.purple,
                  //   ).marginSymmetric(horizontal: 8.w),
                  // if (_analysticController.endDate.value != null)
                  //   CommonText(
                  //     text:
                  //         "${_analysticController.endDate.value!.day}-${_analysticController.endDate.value!.month}-${_analysticController.endDate.value!.year}",
                  //     color: AppColors.purple,
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 12.sp,
                  //   ).marginOnly(right: 12.w),
                  // GestureDetector(
                  //   onTap: () async {
                  //     final picked = await showDateRangePicker(
                  //       context: context,
                  //       firstDate: DateTime(2022),
                  //       lastDate: DateTime(2025),
                  //       initialDateRange:
                  //           _analysticController.startDate.value != null && _analysticController.endDate.value != null
                  //               ? DateTimeRange(
                  //                   start: _analysticController.startDate.value!,
                  //                   end: _analysticController.endDate.value!,
                  //                 )
                  //               : null,
                  //     );
                  //     if (picked != null) {
                  //       _analysticController.selectDateRange(picked.start, picked.end);
                  //     }
                  //   },
                  //   child: Container(
                  //     color: Colors.transparent,
                  //     child: Image.asset(
                  //       ImagesAsset.calendar,
                  //       height: 22.h,
                  //       width: 22.h,
                  //     ),
                  //   ),
                  // ),
                  Obx(() {
                    return Text(
                      dateRangeController.startDate.value != null
                          ? "${dateRangeController.startDate.value!.day}-${dateRangeController.startDate.value!.month}-${dateRangeController.startDate.value!.year}"
                          : "",
                      style: TextStyle(
                        color: AppColors.purple,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    );
                  }),
                  if (dateRangeController.startDate.value != null && dateRangeController.endDate.value != null)
                    CommonText(
                      text: "--",
                      color: AppColors.purple,
                    ).marginSymmetric(horizontal: 8.w),
                  Obx(() {
                    return Text(
                      dateRangeController.endDate.value != null
                          ? "${dateRangeController.endDate.value!.day}-${dateRangeController.endDate.value!.month}-${dateRangeController.endDate.value!.year}"
                          : "",
                      style: TextStyle(
                        color: AppColors.purple,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    );
                  }),
                  DateRangePickerWidget(startDate: dateRangeController.startDate, endDate: dateRangeController.endDate),
                ],
              ).paddingOnly(bottom: 10.h, left: 16.w, right: 16.w),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
