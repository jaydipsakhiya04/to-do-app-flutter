import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

class FeatureCard extends StatelessWidget {

  String title;
  String image;
   FeatureCard({Key? key,required this.title,required this.image,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: SvgPicture.asset(
        image,
        height: 24.w,
        width: 24.w,
      ).paddingOnly(
        right: 16.w,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 14.sp, color: AppColors.lightGrey, fontWeight: FontWeight.w500),
      ),
      trailing: TextButton(onPressed: (){}, child:
      CommonText(text: AppString.remove,
          fontSize: 14.sp, color: AppColors.red, fontWeight: FontWeight.w500
      ),
      ),
    );
  }
}
