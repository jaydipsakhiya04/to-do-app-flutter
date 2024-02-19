import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomGridViewWidget extends StatelessWidget {
  final int? itemCount;
  final int? index;
  final GestureTapCallback? onTap;
  final String image;

  const CustomGridViewWidget({super.key, this.itemCount, this.onTap, required this.image, this.index});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 3.w, mainAxisSpacing: 3.w),
      itemBuilder: (context, index) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 75.h,
          width: 75.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: Image.asset(image, fit: BoxFit.fitHeight),
        ),
      ),
    ).paddingOnly(left: 24.w, right: 24.w, bottom: 54.h);
  }
}
