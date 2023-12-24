import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownWidget extends StatefulWidget {
  String selectedValue;
  String? label;
  List items;
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  double? borderRadius;
  BoxBorder? border;
  TextStyle? labelStyle;

  CustomDropDownWidget(
      {Key? key,
      required this.selectedValue,
      required this.items,
      this.width,
      this.label,
      this.height,
      this.borderRadius,
      this.labelStyle,
      this.border,
      this.padding})
      : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? "",
          style: widget.labelStyle ??  TextStyle(
              fontSize: 15.sp, color: Colors.grey),
        ),
        5.h.verticalSpace,
        Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding ?? EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
            border: widget.border ??
                Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
          ),
          child: DropdownButton<String>(
            padding: EdgeInsets.zero,
            underline: Container(),
            value: widget.selectedValue,
            isExpanded: true,
            items: widget.items.map((item) {
              return DropdownMenuItem<String>(
                  value: item,
                  child: Center(
                    child: Text(item),
                  ));
            }).toList(),
            onChanged: (value) {
              setState(() {
                widget.selectedValue = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
