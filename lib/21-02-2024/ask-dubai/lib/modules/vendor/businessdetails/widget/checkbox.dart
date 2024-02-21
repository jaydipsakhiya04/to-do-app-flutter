import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/widget/common_text.dart';

class CustomCheckboxListTile extends StatelessWidget {
  final RxBool value;
  final String title;
  final Function(bool?) onChanged;
  final BorderSide side;

  const CustomCheckboxListTile({
    Key? key,
    required this.value,
    required this.title,
    required this.onChanged,
    this.side = const BorderSide(color: Colors.white, width: 1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CheckboxListTile(
          side: side,
          title: CommonText(
            text: title,
            fontWeight: FontWeight.w500,
            height: 2,
            fontSize: 14.sp,
            color: AppColors.whiteColor,
          ),
          checkColor: Colors.black,
          activeColor: Colors.white,
          controlAffinity: ListTileControlAffinity.leading,
          value: value.value,
          onChanged: onChanged,
        ));
  }
}
