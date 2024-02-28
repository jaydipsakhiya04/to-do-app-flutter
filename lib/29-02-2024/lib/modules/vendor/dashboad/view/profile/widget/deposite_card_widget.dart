import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/payment_data_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

class DepositeCardWidget extends StatelessWidget {
  PaymentDataModel? paymentDataModel;
  bool isDeposite;
  void Function()? onTap;
   DepositeCardWidget({Key? key, this.paymentDataModel,required this.isDeposite,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.darkBackGroundHome,
          ),
          color: Colors.transparent,
        ),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 0),
          leading: SvgPicture.asset((isDeposite)?IconAsset.moneycome:IconAsset.transaction,height: 24.w,width: 24.w,),
          title: CommonText(
            text: AppString.transaction,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
          subtitle: CommonText(
            text: paymentDataModel?.title??"",
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.titleDark,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: paymentDataModel?.date??"",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
              CommonText(
                text: "500",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.titleDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
