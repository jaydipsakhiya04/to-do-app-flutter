import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Details"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 90,
              alignment: Alignment.center,
              margin: EdgeInsets.all(15.r),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29.r),
                color: const Color(0XFFDE4040),
              ),
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
