import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

class QueriesScreen extends StatelessWidget {
  const QueriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        titleSpacing: 1,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: CommonText(
          text: AppString.queries,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
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
                          title: CommonText(
                              text: "smittt patel", fontSize: 12.sp, fontWeight: FontWeight.w500),
                          subtitle: CommonText(
                            text: AppString.aMonthAgo,

                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.middleGrey,
                          ),
                        ),
                        CommonText(
                          text:  "gugyugug jbjbj jbjbjbh bbjgudt jfuxrd yufyyg",
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
              color: AppColors.backGroundHome3,
              thickness: 1,
            ),
            userChatCard(),
            userChatCard(),
            userChatCard(),
            userChatCard(),
          ],
        ).paddingAll(16.r),
      ),
    );
  }

  Widget userChatCard(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            ImagesAsset.girlImage,
            height: 35.h,
            width: 35.w,
          ),
          title: CommonText(text: "smit patel", fontSize: 12.sp),
          subtitle: CommonText(
            text: AppString.aMonthAgo,
            fontSize: 10.sp,
            color: AppColors.middleGrey,
          ),
          trailing: Icon(Icons.more_vert_outlined, color: AppColors.titleDark),
        ),
        CommonText(text: AppString.msg6, fontSize: 16.sp, fontWeight: FontWeight.w500)
            .marginOnly(bottom: 16.h),
      ],
    );
  }
}