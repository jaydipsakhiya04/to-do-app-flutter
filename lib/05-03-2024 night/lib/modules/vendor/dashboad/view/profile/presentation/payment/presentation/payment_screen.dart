import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/payment_data_model.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/widget/deposite_card_widget.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 2,
              center: const Alignment(0.9, -0.8),
              colors: [AppColors.backGroundHome2, AppColors.backGroundHome],
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigation.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
        ),
        titleSpacing: -8,
        title: CommonText(
          text: AppString.payment,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: AppString.currentBalance,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ).paddingOnly(top: 20.h, bottom: 8.h),
                Row(
                  children: [
                    CommonText(
                      text: AppString.balance,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    16.w.horizontalSpace,
                    Image.asset(ImagesAsset.eye),
                  ],
                ).marginOnly(bottom: 8.h),
                CommonText(
                  text: AppString.accountNumber,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ).marginOnly(left: 24.w, bottom: 24.h)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.darkBackGroundHome,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  2.w.horizontalSpace,
                  Expanded(
                    child: paymentTools(
                      image: IconAsset.deposit,
                      title: AppString.deposit,
                      onTap: () {
                        Get.toNamed(Routes.deposite);
                      },
                    ).marginOnly(left: 20.w),
                  ),
                  Expanded(
                    child: paymentTools(
                      image: IconAsset.transfer,
                      title: AppString.transfer,
                      onTap: () {
                        Get.offAndToNamed(Routes.transferHistory);
                      },
                    ),
                  ),
                  Expanded(
                    child: paymentTools(
                      image: IconAsset.withdraw,
                      title: AppString.withdraw,
                      onTap: () {
                        Get.toNamed(Routes.withDraw);
                      },
                    ),
                  ),
                  Expanded(
                    child: paymentTools(image: IconAsset.more, title: AppString.more,
                      onTap: () {
                        Get.offAndToNamed(Routes.more);
                      },
                    ).marginOnly(right: 20.w),
                  ),
                  2.w.horizontalSpace,
                ],
              ),
            ).marginOnly(left: 16.w,right: 16.w,top: 20.h,bottom: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: AppString.transactionHistory,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ).marginOnly(bottom: 16.h),
                DepositeCardWidget(
                  paymentDataModel: PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
                  isDeposite: true,
                ),
                DepositeCardWidget(
                  paymentDataModel: PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
                  isDeposite: false,
                ),
                DepositeCardWidget(
                  paymentDataModel: PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
                  isDeposite: true,
                ),
                DepositeCardWidget(
                  paymentDataModel: PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
                  isDeposite: false,
                ),
                DepositeCardWidget(
                  paymentDataModel: PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
                  isDeposite: false,
                ),
              ],
            ).marginSymmetric(horizontal: 16.w),
          ],
        ),
      ),
    );
  }

  Widget paymentTools({required String image, void Function()? onTap, required String title}) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120.r),
                color: AppColors.lightBg,
              ),
              child: SvgPicture.asset(image,height: 20.w,width: 20.w,),
            ),
          ),
          8.h.verticalSpace,
          CommonText(
            text: title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
