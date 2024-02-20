import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.name,
      this.backgroundColor,
      this.onPressed,
      this.textColor,
      this.width,
      this.height,
      this.padding,
      this.icon,
      this.isLoading,
      this.loadingCircularColor,
      this.isExpandable,
      this.isEnable = true,
      this.side,
      this.nameStyle,
      this.alignment});

  final String name;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool? isLoading;
  final Color? loadingCircularColor;
  final bool? isExpandable;
  final bool isEnable;
  final VoidCallback? onPressed;
  final BorderSide? side;
  final TextStyle? nameStyle;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 52.h,
      width: isExpandable == false ? null : width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isEnable && !(isLoading ?? false) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          alignment: alignment ?? Alignment.center,
          foregroundColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: isEnable ? (backgroundColor ?? AppColors.primaryDefaultColor) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          side: side,
          // padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w),
          elevation: 0,
          disabledBackgroundColor: isEnable ? (backgroundColor ?? AppColors.primaryDefaultColor) : Colors.transparent,
        ),
        child: Text(
          name,
          style: nameStyle ??
              AppTextStyle()
                  .hanKenF16W6titleDark /*.copyWith(
                    color: isEnable ? (textColor ?? AppColors.primaryDefaultColor) : Colors.transparent,
                  ),*/
          ,
          textAlign: TextAlign.center,
        ),
        // child: isLoading ?? false
        //     ? Transform.scale(
        //         scale: 3, child: Lottie.asset(height: 30.h, isEnable ? AnimationAsset.loading : AnimationAsset.loading, fit: BoxFit.cover))
        //     : SizedBox(
        //         height: height ?? 30.h,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           mainAxisSize: MainAxisSize.min,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Visibility(
        //               visible: icon != null,
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   icon ?? const SizedBox(),
        //                   SizedBox(width: 10.w),
        //                 ],
        //               ),
        //             ),
        //             Text(
        //               name,
        //               style: nameStyle ??
        //                   AppTextStyle().SansMidF14W5Primary.copyWith(
        //                         color: isEnable ? (textColor ?? AppColors.bgPrimaryColor) : AppColors.disableTextColor,
        //                       ),
        //               textAlign: TextAlign.center,
        //             ),
        //           ],
        //         ),
        //       ),
      ),
    );
  }
}
