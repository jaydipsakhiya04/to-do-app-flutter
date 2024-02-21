import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
 import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

class AnalysticScreen extends StatelessWidget {
  AnalysticScreen({Key? key}) : super(key: key);

  // AnalysticController _analysticController = Get.put(AnalysticController());

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
        titleSpacing: 1,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: CommonText(
            text: AppString.analytics,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Column(
            children: [
              Divider(
                thickness: 2,
                color: AppColors.dividerColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CommonText(
                    text: "Data Range",
                    fontSize: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050));
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
      body: Container(
        padding: EdgeInsets.all(20.r),
        margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        color: Colors.yellowAccent,
        child: Column(),
      ),
    );
  }
}