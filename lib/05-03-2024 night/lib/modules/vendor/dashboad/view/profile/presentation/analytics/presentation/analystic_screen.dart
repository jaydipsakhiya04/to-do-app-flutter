import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/analytics/controller/analystic_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/analystic_data_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/widget/app_bar_widget.dart';
import 'package:local/widget/common_text.dart';

class AnalysticScreen extends StatelessWidget {
  AnalysticScreen({Key? key}) : super(key: key);


  final AnalysticController _analysticController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar:  AppBarwidget(title: AppString.analytics,),
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
        leading: Container(
            decoration: BoxDecoration(
              color: AppColors.pinkPurple3,
                  borderRadius: BorderRadius.circular(120.r),
                  border: Border.all(color: AppColors.lightBorder)
            ),
            padding: EdgeInsets.all(14.r),
            child: SvgPicture.asset(analysticDataModel.image ?? ""),
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
