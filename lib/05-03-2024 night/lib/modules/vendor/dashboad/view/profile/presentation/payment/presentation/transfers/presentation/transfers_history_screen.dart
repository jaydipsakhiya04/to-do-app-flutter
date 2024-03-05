import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/analytics/controller/analystic_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/controller/payment_data_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/widget/custom_bottonsheet.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/widget/deposite_card_widget.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/widget/app_bar_widget.dart';
import 'package:local/widget/common_text.dart';

class TransferHistoryScreen extends StatelessWidget {
   TransferHistoryScreen({Key? key}) : super(key: key);

  final AnalysticController _analysticController= Get.find();
   final PaymentDataController _paymentDataController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar:  AppBarwidget(title: AppString.transfer,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppString.todayDate,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ).marginOnly(bottom: 16.h,top: 20.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _paymentDataController.todayDepositeList.length,itemBuilder: (context, index) {
              return DepositeCardWidget(
                paymentDataModel: _paymentDataController.todayWithDrawList[index], isDeposite: false,
                onTap: (){
                  CommonBottomSheet.customBottomSheet(paymentDataModel: _paymentDataController.todayDepositeList[index], isDeposit: false);
                },
              );
            },),
            CommonText(
              text: AppString.todayDate,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ).marginOnly(bottom: 16.h,),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _paymentDataController.todayDepositeList.length,itemBuilder: (context, index) {
              return DepositeCardWidget(
                paymentDataModel: _paymentDataController.yesterWithDrawList[index], isDeposite: false,
                onTap: (){
                  CommonBottomSheet.customBottomSheet(paymentDataModel: _paymentDataController.todayDepositeList[index], isDeposit: false);
                },
              );
            },),
          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    );
  }
}
