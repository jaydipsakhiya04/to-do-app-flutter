import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_loading_widget.dart';

class CustomButton extends StatefulWidget {
  final double? height;
  final VoidCallback? onTap;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? text;
  final String? fontFamily;
  final String? svg;
  final String? endSvg;
  final String? premiumText;
  final Color? buttonColor;
  final Color? svgColor;
  final List<BoxShadow>? boxShadow;
  final bool? isShowBoxShadow;
  final Color? disableButtonColor;
  final Color? buttonBorderColor;
  final Color? textColor;
  final Color? disableTextColor;
  final bool needBorderColor;
  final bool isDisabled;
  final bool isLoader;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const CustomButton({
    Key? key,
    this.height,
    this.width,
    this.text,
    this.svg,
    this.endSvg,
    this.premiumText,
    this.buttonBorderColor,
    this.buttonColor,
    this.fontWeight,
    this.fontSize,
    this.textColor,
    this.onTap,
    this.padding,
    this.isDisabled = false,
    this.isLoader = false,
    this.disableButtonColor,
    this.disableTextColor,
    this.needBorderColor = true,
    this.borderRadius,
    this.fontFamily,
    this.boxShadow,
    this.isShowBoxShadow,
    this.svgColor,
  }) : super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final buttonButton = (widget.isDisabled) ? widget.disableButtonColor ?? AppColors.whiteColor : widget.buttonColor ?? AppColors.buttonColor;
    return GestureDetector(
      onTap: (widget.isLoader || widget.isDisabled) ? null : widget.onTap,
      child: Container(
        height: widget.height ?? 52.h,
        width: widget.width,
        padding: widget.padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8.r),
          color: buttonButton,
          boxShadow: widget.isShowBoxShadow ?? false
              ? [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 2),
                  ),
                ]
              : widget.boxShadow,
          border: Border.all(
            color: widget.buttonBorderColor ?? Colors.transparent,
          ),
        ),
        child: widget.isLoader
            ? const CustomLoadingWidget(
                color: Colors.white,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.svg != null)
                        Image.asset(
                          widget.svg!,
                          height: 24,
                          color: widget.svgColor,
                        ).paddingOnly(right: 10.w),
                      Text(
                        widget.text.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: widget.fontSize ?? 16.sp,
                          fontWeight: widget.fontWeight ?? FontWeight.w600,
                          fontFamily: widget.fontFamily ?? AppString.fontName,
                          color: (widget.isDisabled)
                              ? widget.disableTextColor ?? AppColors.whiteColor.withOpacity(0.6)
                              : widget.textColor ?? AppColors.titleDark,
                        ),
                      ),
                    ],
                  ),
                  // if (widget.endSvg != null)
                  //   Transform.translate(
                  //     transformHitTests: true,
                  //     offset: Offset(60.w, 0),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: AppColors.blackColor),
                  //         borderRadius: BorderRadius.circular(4),
                  //         color: Colors.white,
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           Image.asset(
                  //             IconsAsset.coin,
                  //             height: 16,
                  //             width: 24,
                  //           ),
                  //           CommonText(
                  //             text: widget.premiumText.toString(),
                  //             fontSize: 14.sp,
                  //             fontWeight: FontWeight.w500,
                  //           )
                  //         ],
                  //       ).paddingOnly(top: 3.h, bottom: 3.h, right: 4.w),
                  //     ),
                  //   ),
                ],
              ),
      ),
    );
  }
}
