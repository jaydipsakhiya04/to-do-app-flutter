import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/presentation/more/controller/add_new_bank_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);

  final AddBankDataController _addBankDataController = Get.put(AddBankDataController());

  @override
  Widget build(BuildContext context) {
    print("------${_addBankDataController.bankData}");
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
            (_addBankDataController.bankData.isNotEmpty) ? Get.offNamed(Routes.payment) :  Navigation.pop();;
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: CommonText(text: AppString.more, fontSize: 16.sp, fontWeight: FontWeight.w400),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.backGroundHome3),
        ),
        child: Obx(() {
          final bankData = _addBankDataController.bankData.value;
          if (bankData == null || bankData.isEmpty) {
            return ListTile(
              onTap: () {
                Get.toNamed(Routes.addBankDetail);
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: EdgeInsets.all(12.r),
                margin: EdgeInsets.only(left: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120.r),
                  color: AppColors.lightBg,
                ),
                child: SvgPicture.asset(IconAsset.bank, height: 21.w, width: 21.w),
              ),
              title: CommonText(
                text: AppString.addNewBank,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18.sp,
                color: AppColors.titleDark,
              ).marginOnly(right: 12.w),
            );
          } else {
            return ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120.r),
                  color: AppColors.darkBackGroundHome,
                ),
                child: Image.asset(
                  bankData["profile"],
                  height: 21.w,
                  width: 21.w,
                ),
              ).marginOnly(left: 8.w),
              title: CommonText(
                text: bankData["title"],
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              subtitle: CommonText(
                text: bankData["subTitle"],
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.bodyDark,
              ),
              trailing:
              PopupMenuButton(
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),
                      onTap: () {
                        // Add your edit logic here
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                      onTap: () {
                        // Add your delete logic here
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    bankData["trail"],
                    size: 24.sp,
                    color: AppColors.titleDark,
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
