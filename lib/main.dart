import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoflutter/27-12-2023/button_piyu.dart';
import 'package:todoflutter/28-12-2023/button_mike_send.dart';
import 'package:todoflutter/28-12-2023/chat_demo.dart';
import 'package:todoflutter/29-12-2023/text_chat.dart';
import 'package:todoflutter/comman_widget/validation_textfield.dart';
import 'CarParking/first.dart';
import 'CarParking/second.dart';
import 'CarParking/third.dart';
import 'car drive/fill_car_details.dart';
import 'car drive/welcome_screen1.dart';
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
          home: ButtonMikeSend(),
        );
      },
    );
  }
}
