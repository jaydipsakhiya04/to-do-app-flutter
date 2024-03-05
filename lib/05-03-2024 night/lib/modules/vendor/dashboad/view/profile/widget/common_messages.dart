import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/widget/common_text.dart';

class CommonMessages extends StatelessWidget {

  String msg1;
  String msg2;
  String title;
   CommonMessages({Key? key,
   required this.msg1,
     required this.msg2,
     required this.title
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: title,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        16.h.verticalSpace,
        CommonText(
          text: msg1,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
        16.h.verticalSpace,
        CommonText(
          text: msg2,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
      ],
    );
  }
}
