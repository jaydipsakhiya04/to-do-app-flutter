import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/analystic_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/analystic_data_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/widget/common_text.dart';

class AnalysticScreen extends StatelessWidget {
  AnalysticScreen({Key? key}) : super(key: key);


  final AnalysticController _analysticController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.backGroundHome3,
          ),
        ),
        titleSpacing: -12,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: CommonText(text: AppString.analytics, fontSize: 18.sp, fontWeight: FontWeight.w600),
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
                    if (_analysticController.startDate.value != null)
                      CommonText(
                        text:
                            "${_analysticController.startDate.value!.day}-${_analysticController.startDate.value!.month}-${_analysticController.startDate.value!.year}",
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
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 16.h),
        itemCount: _analysticController.analysticData.length,
        itemBuilder: (context, index) {
          return analysticDataWidget(analysticDataModel: _analysticController.analysticData[index]);
        },
      ),
    );
  }

  Widget analysticDataWidget({required AnalysticDataModel analysticDataModel}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      margin: EdgeInsets.only(
        bottom: 11.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.lightDarkTheme,
      ),
      child: ListTile(
        dense: true,
        leading: ClipOval(
          child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.all(5.r),
              child: SvgPicture.asset(analysticDataModel.image ?? "")),
        ),
        title: CommonText(
          text: analysticDataModel.amount ?? "",
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        subtitle: CommonText(
          text: analysticDataModel.title ?? "",
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.middleGrey,
        ),
      ),
    );
  }
}
