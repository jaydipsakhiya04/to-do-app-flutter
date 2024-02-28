import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/login/view/forgotpassword/forgot_password.dart';
import 'package:local/modules/authentication/login/view/login_screen.dart';
import 'package:local/modules/user/dashboad/view/home/home_screen.dart';

class UserDashBoardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final RxList<Widget> widgetOptions = RxList<Widget>.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    // Initialize widgetOptions with screens
    widgetOptions.assignAll([
      UserHomeScreen(),
      ForgotPassword(),
      LoginScreen(),
      Text('Profile Page'),
    ]);
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
