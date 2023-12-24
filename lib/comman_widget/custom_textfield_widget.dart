import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  double? borderRadius;
  String? label;
  TextStyle? labelStyle;
  double? borderWidth;
  bool isShowBorder = true;
  Color? borderColor;
  String? hintText;

  CustomTextField(
      {Key? key,
      this.borderRadius,
      required this.isShowBorder,
        this.label,
        this.labelStyle,
      this.borderColor,
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
        TextField(

          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
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
