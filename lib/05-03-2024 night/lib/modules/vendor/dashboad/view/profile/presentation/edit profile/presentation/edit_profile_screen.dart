import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/edit%20profile/controller/edit_profile_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

import '../../../widget/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({Key? key}) : super(key: key);

  EditProfileController _editProfileController = Get.put(EditProfileController());

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
              Navigation.pop();
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
                    // Stack(
                    //   alignment: Alignment.bottomRight,
                    //   children: [
                    //     ClipOval(
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //         ),
                    //         height: 110.h,
                    //         width: 110.h,
                    //         child: Image.asset(
                    //           ImagesAsset.user,
                    //           fit: BoxFit.fill,
                    //         ),
                    //       ),
                    //     ),
                    //     ClipOval(
                    //       child: Container(
                    //         padding: EdgeInsets.all(5.r),
                    //           height: 31.h,
                    //           width: 31.h,
                    //           decoration: BoxDecoration(
                    //             shape: BoxShape.circle,
                    //             color: Colors.white,
                    //           ),
                    //           child: SvgPicture.asset(IconAsset.edit)),
                    //     ),
                    //   ],
                    // ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Obx(() {
                          // final File? image = _editProfileController.image.value;
                          final File? image=_editProfileController.image.value;
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
                                fit: BoxFit.fill,
                              )
                                  : Image.asset(
                                ImagesAsset.user,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        }),
                        GestureDetector(
                          onTap: _editProfileController.pickImage,
                          child: ClipOval(
                            child: Container(
                              padding: EdgeInsets.all(5.r),
                              height: 31.h,
                              width: 31.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: SvgPicture.asset('assets/icons/edit.svg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  32.h.verticalSpace,

                  ],
                ),
              ),
              CommonTextField(
                keyboardType: TextInputType.text,
                initialValue: AppString.judyJain,
                label: AppString.fullName,
                suffix: SizedBox(), hintText: '',
              ),
              CommonTextField(
                keyboardType: TextInputType.numberWithOptions(),
                initialValue: AppString.judyBirth,
                label: AppString.birthday,
                suffix: IconButton(
                  icon: Icon(Icons.calendar_today,color: AppColors.purple,size: 20.sp),
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _editProfileController.selectedDate.value ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      _editProfileController.selectedDate.value = pickedDate;
                    }
                  },
                ), hintText: '',
              ),
              CommonTextField(
                keyboardType: TextInputType.emailAddress,
                initialValue: AppString.judyMail,
                label: AppString.email, hintText: '',
              ),
              CommonTextField(
                keyboardType: TextInputType.number,
                initialValue: AppString.judyNumber,
                label: AppString.phoneNumber, hintText: '',
              ),
              CommonTextField(
                obscureText: true,
                initialValue: "*********",
                maxLines: 1,
                label: AppString.password, hintText: '',
              ),
              26.h.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(10.r),
                      width: 165.w,
                      height: 50.h,
                      buttonBorderColor: AppColors.primaryDefaultColor,
                      buttonColor: AppColors.primaryDefaultColor,
                      textColor: AppColors.whiteColor,
                      text: AppString.updateProfile,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
