import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/lithium_battery_modules/profile/view/edit_profile/controller/edit_profile_controller.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/utils/social_authentication/app_validations.dart';
import 'package:flutter_template/widget/app_snackbar.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_appbar_widget.dart';
import 'package:flutter_template/widget/custom_button.dart';
import 'package:flutter_template/widget/custom_textfeild.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

 final  EditProfileController _editProfileController = Get.put(EditProfileController());
  final Map<String, dynamic> vendorDetails = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomButton(
          onTap: () {
            Navigation.pop();
            AppSnackBar.showSnackBarAtTop(message: "Profile Updated Successfully",color: Colors.green);

          },
          padding: EdgeInsets.symmetric(vertical: 15.h),
          buttonColor: AppColors.orange,
          textColor: AppColors.white,
          text: AppString.updateProfile,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ).marginSymmetric(horizontal: 16.w),
        backgroundColor: AppColors.whiteGrey,
        appBar: CustomAppBar(
          title: AppString.editProfile,
          isSimpleAppBar: false,
          backgroundColor: AppColors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Obx(() {
                            final File? image =
                                _editProfileController.image.value;
                            return ClipOval(
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                height: 110.h,
                                width: 110.h,
                                child: image != null
                                    ? Image.file(
                                        image,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        ImageAsset.user,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            );
                          }),
                          Positioned(
                            left: 69.w,
                            top: 64.h,
                            child: GestureDetector(
                              onTap: _editProfileController.pickImage,
                              child: SvgPicture.asset(
                                ImageAsset.editProfile,
                                height: 50.h,
                                width: 50.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      32.h.verticalSpace,
                      Column(
                        children: [
                          CustomTextField(
                            fillColor: AppColors.white,
                            filled: true,
                            contentPadding: EdgeInsets.zero,
                            inputFormatters: [
                              SentenceCapitalizationFormatter()
                            ],
                            label: AppString.name,
                            hintColor: AppColors.darkBlue,
                            textCapitalization: TextCapitalization.words,
                            controller:
                                _editProfileController.nameEditController,
                            prefixImage: ImageAsset.person,
                            hintText: AppString.powerace,
                            validator: (value) =>
                                AppValidation.nameValidation(value),
                          ),
                          14.h.verticalSpace,
                          CustomTextField(
                            fillColor: AppColors.white,
                            filled: true,
                            contentPadding: EdgeInsets.zero,
                            label: AppString.email,
                            controller:
                                _editProfileController.emailEditController,
                            prefixImage: ImageAsset.sms,
                            inputLower: true,
                            hintColor: AppColors.darkBlue,
                            hintText: AppString.judyMail,
                            validator: (value) =>
                                AppValidation.validateEmail(value),
                            suffix: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: CommonText(
                                    text: AppString.change,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.deepOrange,
                                  ),
                                )
                              ],
                            ).paddingOnly(right: 4.w),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                25.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
