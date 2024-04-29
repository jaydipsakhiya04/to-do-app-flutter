import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void showSnackBarAtTop({
    required String message,
    String? title,
    Color? color,
  }) {
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 10.w),
      borderRadius: 8.r,
      snackStyle: SnackStyle.FLOATING,
      // padding: EdgeInsets.symmetric(vertical: 12.h),
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
          InkWell(
            onTap: Get.back,
            child: Icon(Icons.close, color: Colors.white, size: 16.sp),
          )
        ],
      ),
      titleText: Container(),
      // backgroundColor: title?.toLowerCase() == "error"
      //     ? Colors.redAccent
      //     : title?.toLowerCase() == "success"
      //     ? Colors.red
      //     : Colors.black45,
      backgroundColor: color??Colors.red,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2),
      colorText: Colors.white,
      // isDismissible: false,
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 6),
    );
  }
}


