import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'CarParking/first.dart';
import 'CarParking/second.dart';
import 'CarParking/third.dart';
import 'car drive/fill_car_details.dart';
import 'food app/ui_page_forth.dart';
import 'media_query/media_query.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: FillCarDetailsScreen(),);
      },
    );
  }
}
