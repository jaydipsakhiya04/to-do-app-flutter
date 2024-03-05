import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/payment_data_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

class CommonBottomSheet{
  static Future<void> customBottomSheet({required PaymentDataModel paymentDataModel,required bool isDeposit}) {
    return Get.bottomSheet(
      isScrollControlled: true,
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkTheme,
              borderRadius: BorderRadius.only(topLeft:  Radius.circular(15.r),topRight: Radius.circular(15.r),
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.titleDark,
                          ),
                          width: double.infinity,
                        ).marginSymmetric(horizontal: 130.w).marginSymmetric(vertical: 20.h),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        isDeposit?IconAsset.moneycome:IconAsset.transaction,
                        height: 60.w,
                        width: 60.w,
                      ),
                      10.h.verticalSpace,
                      CommonText(
                        text: AppString.transactionDetails,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ).marginOnly(bottom: 20.h),
                      Container(
                        padding: EdgeInsets.all(16.r),
                        margin: EdgeInsets.only(top: 8.h, bottom: 20.h, left: 16.w, right: 16.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightBrown),
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.darkTheme,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: AppString.transactionDate,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.bodyDark,
                                ),
                                CommonText(
                                  text:paymentDataModel.date,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ],
                            ).marginOnly(bottom: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: AppString.amountCamel,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.bodyDark,
                                ),
                                CommonText(
                                  text: "500",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ],
                            ).marginOnly(bottom: 8.h),

                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.r),
                        margin: EdgeInsets.only(top: 8.h, bottom: 20.h, left: 16.w, right: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.darkBackGroundHome,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: AppString.transactionId,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.bodyDark,
                                ),
                                CommonText(
                                  text: AppString.trans,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ).marginOnly(bottom: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: AppString.incomeSource,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.bodyDark,
                                ),
                                CommonText(
                                  text: AppString.booking,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ).marginOnly(bottom: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: AppString.type,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.bodyDark,
                                ),
                                CommonText(
                                  text: isDeposit==true?AppString.deposit:AppString.withdraw,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ).marginOnly(bottom: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: AppString.status,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.bodyDark,
                                ),
                                CommonText(
                                  text: AppString.success,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ).marginOnly(bottom: 8.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}