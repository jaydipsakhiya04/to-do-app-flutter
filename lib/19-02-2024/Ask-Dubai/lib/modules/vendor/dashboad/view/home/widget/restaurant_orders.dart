import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/widget/common_text.dart';

class RestaurantOrder extends StatelessWidget {
  String orderTime;
  String orderPrice;
  String orderQuantity;

   RestaurantOrder({Key? key,
  required this.orderTime,
  required this.orderPrice,
  required this.orderQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(text: orderTime,fontSize: 10.sp,color: AppColors.middleGrey,),
        CommonText(text: orderPrice,fontSize: 26.sp),
        CommonText(text: orderQuantity,fontSize: 16.sp,color: AppColors.middleGrey,),
      ],
    );
  }
}
