import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local/widget/custom_loading_widget.dart';

class SocialButtonWidget extends StatefulWidget {
  final double? height;
  final double? svgHeight;
  final VoidCallback? onTap;
  final double? width;
  final String? image;
  final Color? buttonColor;
  final Color? svgColor;
  final bool isLoader;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const SocialButtonWidget({
    Key? key,
    this.height,
    this.width,
    this.image,
    this.buttonColor,
    this.onTap,
    this.padding,
    this.isLoader = false,
    this.borderRadius,
    this.svgColor,
    this.svgHeight,
  }) : super(key: key);

  @override
  SocialButtonWidgetState createState() => SocialButtonWidgetState();
}

class SocialButtonWidgetState extends State<SocialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoader ? null : widget.onTap,
      child: Container(
          height: widget.height ?? 50.h,
          width: widget.width ?? 73.75.w,
          // padding: widget.padding ?? const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8.r),
            color: widget.buttonColor,
          ),
          child: Center(
              child: widget.isLoader
                  ? const CustomLoadingWidget(
                      color: Colors.white,
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.image != null)
                          Image.asset(
                            widget.image!,
                            height: widget.svgHeight ?? 22.h,
                            color: widget.svgColor,
                          ),
                      ],
                    ))),
    );
  }
}
