import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/custom_textfield.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class AddBankDetailScreen extends StatelessWidget {
  AddBankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: CustomButton(
              onTap: () {
                Navigation.replace(Routes.phoneNumberVerification);
              },
              borderRadius: BorderRadius.circular(10.r),
              width: 165.w,
              height: 50.h,
              buttonBorderColor: AppColors.primaryDefaultColor,
              buttonColor: AppColors.primaryDefaultColor,
              textColor: AppColors.whiteColor,
              text: AppString.withdraw,
            ),
          ),
        ],
      ).paddingOnly(left: 16.w, right: 16.w, bottom: 16.h),
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
            Navigation.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: CommonText(text: AppString.addBankaDetail, fontSize: 16.sp, fontWeight: FontWeight.w400),
      ),
      body: Column(
        children: [
          20.h.verticalSpace,
          CommonTextField(
            // controller:bankAccountController,
            hintText: AppString.enterbankAc,
            textColor: AppColors.bodyDark,
            label: AppString.bankAcName,
            suffix: const SizedBox.shrink(),
          ),
          CommonTextField(
            hintText: AppString.enterIfscCode,
            textColor: AppColors.bodyDark,
            label: AppString.ifscCode,
            suffix: const SizedBox.shrink(),
          ),
          CommonTextField(
            // controller: _addBankDataController.bankName,
            hintText: AppString.enterBankName,
            textColor: AppColors.bodyDark,
            label: AppString.bankName,
            suffix: const SizedBox.shrink(),
          ),
        ],
      ).marginSymmetric(horizontal: 16.w),
    );
  }
}
