import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/custom_textfield.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';

class AddBankDetailScreen extends StatelessWidget {
   AddBankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  GestureDetector(
        onTap: (){
          Get.offNamed(Routes.phoneNumberVerification);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h),
          margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: AppString.sendOtpButton,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColors.titleDark,
              ),
            ],
          ),
        ),
      ),
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
            suffix: SizedBox.shrink(),
          ),
          CommonTextField(
            hintText: AppString.enterIfscCode,
            textColor: AppColors.bodyDark,
            label: AppString.ifscCode,
            suffix: SizedBox.shrink(),
          ),
          CommonTextField(
            // controller: _addBankDataController.bankName,
            hintText: AppString.enterBankName,
            textColor: AppColors.bodyDark,
            label: AppString.bankName,
            suffix: SizedBox.shrink(),
          ),
        ],
      ).marginSymmetric(horizontal: 16.w),
    );
  }
}
