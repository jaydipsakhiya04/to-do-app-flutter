import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/widget/common_text.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkTheme,
        appBar: AppBar(
          titleSpacing: 1,
          backgroundColor: AppColors.darkBackGroundHome,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          title: CommonText(
            text: AppString.helpCenter,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8.r),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: CommonText(
                      text: "AppString.helpCenter ?",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                  subtitle: CommonText(
                      text: "AppString.helpCenter",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightGrey),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.lightGrey,
                    size: 18.sp,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.dividerColor,
                ),
              ],
            );
          },
        ));
  }
}