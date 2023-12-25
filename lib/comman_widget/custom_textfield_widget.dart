import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  double? borderRadius;
  String? label;
  TextStyle? labelStyle;
  TextEditingController? controller;
  double? borderWidth;
  bool isShowBorder = true;
  bool isShowFocusBorder = false;
  String? Function(String?)? validator;
  Color? borderColor;
  Color? focusBorderColor;
  String? hintText;

  CustomTextField(
      {Key? key,
      this.borderRadius,
      required this.isShowBorder,
      this.label,
      this.labelStyle,
      this.borderColor,
      this.controller,
      this.focusBorderColor,
      this.validator,
      this.hintText,
      this.borderWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "",
          style: labelStyle ?? TextStyle(fontSize: 15.sp, color: Colors.grey),
        ),
        5.h.verticalSpace,
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,

            /// It is used for when we touch on textfield its change color of the border
            focusedBorder: isShowFocusBorder
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        color: focusBorderColor ?? Colors.blue,
                        width: borderWidth ?? 1.w),
                    borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
                  ),

            ///-------------
            border: isShowBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.grey,
                      width: borderWidth ?? 1,
                    ),
                  )
                : UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.grey,
                      width: borderWidth ?? 1,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
