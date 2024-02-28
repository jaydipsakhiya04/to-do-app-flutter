import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/login/controller/forgot_password_controller.dart';
import 'package:local/modules/splash/controller/splash_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/analystic_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/utils/utils.dart';

import 'modules/vendor/dashboad/view/profile/controller/payment_data_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appName,
        initialBinding: AppBidding(),
        initialRoute: Routes.vanDorDashBoard,
        getPages: Routes.pages,
        theme: ThemeData(
          buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          brightness: Brightness.light,
          disabledColor: Colors.transparent,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.whiteColor),
          canvasColor: Colors.white,
          fontFamily: AppString.fontName,
        ),
        builder: (context, child) {
          // return Scaffold(
          //   body: GestureDetector(
          //     onTap: () {
          //       Utils.hideKeyboardInApp(context);
          //     },
          //     child: child,
          //   ),
          // );
          return GestureDetector(
            onTap: () {
              Utils.hideKeyboardInApp(context);
            },
            child: child,
          );
        },
      ),
    );
  }
}

class AppBidding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(AnalysticController());
    Get.put(ForgotPasswordController());
    Get.put(PaymentDataController());
  }
}
