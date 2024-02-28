import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

import '../widget/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

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
        titleSpacing: 1,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: CommonText(
            text: AppString.editProfile,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipOval(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            height: 110.h,
                            width: 110.h,
                            child: Image.asset(
                              ImagesAsset.user,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                              height: 31.h,
                              width: 31.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: SvgPicture.asset(IconAsset.edit)),
                        ),
                      ],
                    ),
                    32.h.verticalSpace,

                  ],
                ),
              ),
              CommonTextField(
                keyboardType: TextInputType.text,
                hintText: AppString.judyJain,
                label: AppString.fullName,
                suffix: SizedBox(),
              ),
              CommonTextField(
                keyboardType: TextInputType.numberWithOptions(),
                hintText: AppString.judyBirth,
                label: AppString.birthday,
                suffix: const SizedBox(),
              ),
              CommonTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: AppString.judyMail,
                label: AppString.email,
              ),
              CommonTextField(
                keyboardType: TextInputType.number,
                hintText: AppString.judyNumber,
                label: AppString.phoneNumber,
              ),
              CommonTextField(
                obscureText: true,
                hintText: "*********",
                label: AppString.password,
              ),
              26.h.verticalSpace,
              Container(
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.purple,
                ),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                        text: AppString.updateProfile,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
