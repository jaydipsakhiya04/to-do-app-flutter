import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/analystic_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/payment_data_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/custom_bottonsheet.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';

import 'package:local/widget/common_text.dart';

import '../widget/deposite_card_widget.dart';

class DepositScreen extends StatelessWidget {
   DepositScreen({Key? key}) : super(key: key);

  final AnalysticController _analysticController= Get.find();
   final PaymentDataController _paymentDataController=Get.find();

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
        title: CommonText(text: AppString.deposit, fontSize: 18.sp, fontWeight: FontWeight.w600),
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
                        "${_analysticController.endDate.value!.day}-${_analysticController.endDate.value!.month}-${_analysticController.endDate.value!.year}",
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
                paymentDataModel: _paymentDataController.todayDepositeList[index], isDeposite: true,
                onTap: (){
                  CommonBottomSheet.customBottomSheet(paymentDataModel: _paymentDataController.todayDepositeList[index], isDeposit: true);
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
                paymentDataModel: _paymentDataController.todayDepositeList[index], isDeposite: true,
                onTap: (){
                  CommonBottomSheet.customBottomSheet(paymentDataModel: _paymentDataController.todayDepositeList[index], isDeposit: true);
                },
              );
            },),
          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    );
  }


}
