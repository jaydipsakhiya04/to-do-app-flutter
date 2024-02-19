import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:local/modules/vendor/dashboad/view/controller/notification_controller.dart';
import 'package:local/modules/vendor/dashboad/view/home/model/notificationDataModel.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/widget/common_text.dart';

class VandorNotificationScreen extends StatelessWidget {
   VandorNotificationScreen({Key? key}) : super(key: key);

  NotificationController _notificationController=Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        leadingWidth: 38.w,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
        ).marginOnly(left: 16.w),
        title:  CommonText(text: AppString.notification, fontSize: 16.sp, fontWeight: FontWeight.w400),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(text: AppString.today, fontSize: 12.sp, fontWeight: FontWeight.w500),
              CommonText(text: AppString.markAllAsRead, fontSize: 14.sp, fontWeight: FontWeight.w500,color: AppColors.purple,),
            ],
          ).marginOnly(left: 16.w,right: 16.w,top: 20.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 16.h),
              itemCount: _notificationController.notificationList.length,
              itemBuilder: (context, index) {
                return notificationCard(
                notificationDataModel: _notificationController.notificationList[index],
                );
              },
            ),
          ),
          CommonText(text: AppString.markAllAsRead, fontSize: 14.sp, fontWeight: FontWeight.w500,color: AppColors.purple,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 16.h),
              itemCount: _notificationController.notificationList.length,
              itemBuilder: (context, index) {
                return notificationCard(
                 notificationDataModel: _notificationController.notificationList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationCard({required NotificationDataModel notificationDataModel}){
    return Container(
      padding: EdgeInsets.all(10.r),
      color: Colors.transparent,
      child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(text: notificationDataModel.name??"", fontSize: 16.sp, fontWeight: FontWeight.w500,color:AppColors.white),
              CommonText(text: notificationDataModel.time??"", fontSize: 12.sp, fontWeight: FontWeight.w500,color: AppColors.white),
            ],
          ),
          6.h.verticalSpace,
          CommonText(text: notificationDataModel.msg??"", fontSize: 12.sp, fontWeight: FontWeight.w400,color: AppColors.lightGrey,),
        ],
      ),
    );
  }
}
