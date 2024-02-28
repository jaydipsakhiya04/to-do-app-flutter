import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/common_service_card.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class ServicesEditScreen extends StatelessWidget {
  ServicesEditScreen({Key? key}) : super(key: key);
  final RxList<String> tags = <String>[].obs;
  final TextEditingController serviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        titleSpacing: -8,
        title: CommonText(
          text: AppString.services,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            fontSize: 12.sp,
            text: AppString.businessService,
            fontWeight: FontWeight.w600,
          ).paddingOnly(bottom: 8.h),
          SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    filled: true,
                    fillColor: AppColors.whiteColor.withOpacity(0.1),
                    controller: serviceController,
                    hintText: AppString.enterService,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final text = serviceController.text.trim();
                    if (text.isNotEmpty) {
                      tags.add(text);
                      serviceController.clear();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.whiteColor.withOpacity(0.1),
                        ),
                        padding: EdgeInsets.all(8.sp),
                        child: Image.asset(
                          ImagesAsset.plus,
                          scale: 3.sp,
                          color: AppColors.titleDark,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => Wrap(
                spacing: 8.w,
                children: tags
                    .map((tag) => GestureDetector(
                          onTap: () {
                            tags.remove(tag);
                            tags.refresh();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: AppColors.primaryDefaultColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50.r),
                              border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CommonText(
                                  text: tag,
                                  fontSize: 14.sp,
                                  color: AppColors.titleDark,
                                  fontWeight: FontWeight.w400,
                                ).paddingOnly(right: 5.w),
                                Image.asset(ImagesAsset.cross, scale: 3)
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              )).paddingOnly(bottom: (tags.length > 1) ? 1.h : 24.h),
          CommonText(
            text: AppString.services,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ).marginOnly(bottom: 16.h),
          CommonServiceCard(
            title: AppString.commercialServices,
          ),CommonServiceCard(
            title: AppString.electricalPanelRepair,
          ),CommonServiceCard(
            title: AppString.lightingInstallation,
          ),CommonServiceCard(
            title: AppString.electricalPanelInstallation,
          ),CommonServiceCard(
            title: AppString.eVCharging,
          ),
          Spacer(),
          CustomButton(
            onTap: () {},
            text: AppString.save,
          ),
        ],
      ).paddingAll(16.r),
    );
  }
}
