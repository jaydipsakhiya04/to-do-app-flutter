import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:local/modules/splash/controller/splash_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/assets.dart';

import '../../../utils/navigation_utils/navigation.dart';
import '../../../utils/navigation_utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      navigateFurther(context);
    });
  }

  SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    // SizeUtils().init(context);
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Align(
        alignment: Alignment.center,
        child: Image.asset(
          ImagesAsset.logo,
          height: 417.h,
          width: 418.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Future<void> navigateFurther(BuildContext context) async {
    (splashController.isVandor.value) ? Navigation.replace(Routes.signIn) : Navigation.replace(Routes.firstIntro);
    print("vanDor Value ----> Splash to redirect ---> ${splashController.isVandor.value}");
    (splashController.isVandor.value) ? print("Splash to redirect ---> vanDor ---> signIn") : print("Splash to redirect ---> user ---> firstIntro");
  }
}
