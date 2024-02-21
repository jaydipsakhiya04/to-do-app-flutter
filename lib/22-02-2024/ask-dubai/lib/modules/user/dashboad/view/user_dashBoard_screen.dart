import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/login/view/forgotpassword/forgot_password.dart';
import 'package:local/modules/authentication/login/view/login_screen.dart';
import 'package:local/modules/user/dashboad/controller/user_dashboard_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/assets.dart';

import 'home/home_screen.dart';

class UserDashBoardScreen extends StatelessWidget {
  UserDashBoardScreen({Key? key}) : super(key: key);

  UserDashBoardController userDashBoardController = Get.put(UserDashBoardController());
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImagesAsset.bgImage),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Obx(
            () => userDashBoardController.widgetOptions[userDashBoardController.selectedIndex.value],
          ),
          bottomNavigationBar: Obx(() => Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  currentIndex: userDashBoardController.selectedIndex.value,
                  onTap: userDashBoardController.onItemTapped,
                  elevation: 0, // Background color
                  backgroundColor: Color(0xFF120C1C),
                  selectedItemColor: AppColors.whiteColor,
                  type: BottomNavigationBarType.fixed,
                  selectedIconTheme: IconThemeData(color: Colors.white),
                  unselectedItemColor: AppColors.bodyDark, // Unselected item color
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      label: 'Home',
                      backgroundColor: Color(0xFF120C1C),
                      activeIcon: Container(child: Image.asset(ImagesAsset.searchW, height: 24.h).paddingOnly(bottom: 4.h)),
                      icon: Image.asset(ImagesAsset.search, height: 24.h).paddingOnly(bottom: 4.h),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Container(child: Image.asset(ImagesAsset.mapW, height: 24.h).paddingOnly(bottom: 4.h)),
                      backgroundColor: Color(0xFF120C1C),
                      icon: Image.asset(ImagesAsset.map, height: 24.h).paddingOnly(bottom: 4.h),
                      label: 'Map',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Container(child: Image.asset(ImagesAsset.chatW, height: 24.h).paddingOnly(bottom: 4.h)),
                      backgroundColor: Color(0xFF120C1C),
                      icon: Image.asset(ImagesAsset.chat, height: 24.h).paddingOnly(bottom: 4.h),
                      label: 'Chat',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Container(child: Image.asset(ImagesAsset.userProfileW, height: 24.h).paddingOnly(bottom: 4.h)),
                      backgroundColor: Color(0xFF120C1C),
                      icon: Image.asset(ImagesAsset.userProfile, height: 24.h).paddingOnly(bottom: 4.h),
                      label: 'Profile',
                    ),
                  ],
                ),
              )),
        ));
  }
}
