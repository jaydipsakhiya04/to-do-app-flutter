import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/analytics/controller/analystic_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/app_bar_widget.dart';
import 'package:local/widget/common_text.dart';

class QueriesScreen extends StatelessWidget {
  QueriesScreen({Key? key}) : super(key: key);

  final AnalysticController _analysticController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: const AppBarwidget(title: AppString.queries,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userChatCard(),
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2.w,
                    color: AppColors.backGroundHome3,
                  ),
                  10.h.horizontalSpace,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            ImagesAsset.girlImage,
                            height: 35.h,
                            width: 35.w,
                          ),
                          title: CommonText(text: AppString.name, fontSize: 12.sp, fontWeight: FontWeight.w500),
                          subtitle: CommonText(
                            text: AppString.aMonthAgo,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.middleGrey,
                          ),
                        ),
                        CommonText(
                          text: AppString.queryFirst,
                          color: AppColors.bodyDark,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ).paddingOnly(bottom: 15.h, right: 12.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.h.verticalSpace,
            Divider(
              color: AppColors.backGroundHome4,
              thickness: 1,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              separatorBuilder: (context, index) {
                return Container(
                  height: 0.5,
                  color: AppColors.backGroundHome4,
                  margin: EdgeInsets.symmetric(vertical: 3),
                );
              },
              itemBuilder: (context, index) {
                return userChatCard();
              },
            )
          ],
        ).paddingAll(16.r),
      ),
    );
  }

  Widget userChatCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            ImagesAsset.girlImage,
            height: 35.w,
            width: 35.w,
          ),
          title: CommonText(text: AppString.name, fontSize: 12.sp),
          subtitle: CommonText(
            text: AppString.aMonthAgo,
            fontSize: 10.sp,
            color: AppColors.middleGrey,
            fontWeight: FontWeight.w400,
          ),
          trailing: SvgPicture.asset(IconAsset.verticalMore, width: 20.w, height: 20.w),
        ),
        CommonText(text: AppString.queryThird, fontSize: 16.sp, fontWeight: FontWeight.w500).marginOnly(bottom: 16.h),
      ],
    );
  }
}
