import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/common_messages.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/widget/common_text.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        titleSpacing: -10,
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
        title: CommonText(
          text: AppString.termsConditionsCamelCase,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: Column(
        children: [
          CommonMessages(
            title: AppString.termsConditionsCamelCase,
            msg1: AppString.policy1,
            msg2: AppString.policy2,
          ),
        ],
      ).paddingAll(16.r),
    );
  }
}
