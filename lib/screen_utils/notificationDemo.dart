import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationDemo extends StatelessWidget {
  const NotificationDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF1A1A1A)),   ///   COde mate COlor(0XFF and code)

            ),
            16.h.verticalSpace,
            Container(
              height: 124.h,
              width: 327.w,
              decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFF000000).withOpacity(0.10),
                    blurRadius: 30.r,
                    // offset: Offset(4,5),     Offset(x,y)

                  )
                ]
              ),

            ),
          ],
        ),
      ),
    );
  }
}
