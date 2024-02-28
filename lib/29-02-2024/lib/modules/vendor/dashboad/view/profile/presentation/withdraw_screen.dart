import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

class WithDrawScreen extends StatelessWidget {
  const WithDrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      bottomNavigationBar:  Container(
        decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: AppString.withdraw,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.titleDark,
            ),
          ],
        ),
      ),
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
          ),
        ),
        title: CommonText(text: AppString.withdrawMoney, fontSize: 16.sp, fontWeight: FontWeight.w400),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 16.w, right: 16.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightBrown),
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.darkTheme,
            ),
            child: Center(
              child: Column(
                children: [
                  CommonText(
                    text: AppString.withDrawAmount,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: AppColors.bodyDark,
                  ).marginOnly(bottom: 16.h, top: 39.h),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.darkBackGroundHome,
                    ),
                    child: Center(
                      child: CommonText(
                        text: AppString.thousand,
                        fontWeight: FontWeight.w600,
                        fontSize: 32.sp,
                      ),
                    ),
                  ),
                  16.h.verticalSpace,
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      amountContainer(amount: AppString.fiveHundred),
                      8.w.horizontalSpace,
                      amountContainer(amount: AppString.sevenHundred),
                      8.w.horizontalSpace,
                      amountContainer(amount: AppString.thousand),
                      8.w.horizontalSpace,
                      amountContainer(amount: AppString.fiveThousand),
                    ],
                  ).marginOnly(bottom: 39.h),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16.w, bottom: 16.w),
            margin: EdgeInsets.only(left: 16.w, right: 16.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightBrown),
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.darkTheme,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(IconAsset.wallet,height: 24.w,width: 24.w,),
                12.w.horizontalSpace,
                CommonText(
                  text: AppString.walletBalance,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                Spacer(),
                CommonText(
                  text: AppString.thousand,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ],
            ).marginSymmetric(horizontal: 12.w),
          ),
        ],
      ),
    );
  }

  Widget amountContainer({required String amount}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightBrown,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: CommonText(
          text: amount,
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: AppColors.bodyDark,
        ),
      ),
    );
  }
}
