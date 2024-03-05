import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/login/view/login_screen.dart';
import 'package:local/modules/user/dashboad/presentation/profile/presentation/profile_screen.dart';
import 'package:local/modules/vendor/dashboad/view/business/presentation/order_status_detail.dart';
import 'package:local/modules/vendor/dashboad/view/chat/presentation/vandor_chat_screen.dart';
import 'package:local/modules/vendor/dashboad/view/home/presentation/vandor_home_chat_screen.dart';
import 'package:local/modules/vendor/dashboad/view/home/presentation/vandor_home_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/profile_screen.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';


class VandorDashBoardScreen extends StatelessWidget {
  VandorDashBoardScreen({Key? key}) : super(key: key);

  DashBoardScreenController dashBoardScreenController = Get.put(DashBoardScreenController());
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
          body: Obx(() => dashBoardScreenController.widgetOptions[dashBoardScreenController.selectedIndex.value]),
          bottomNavigationBar: Obx(() => Theme(
                data: ThemeData(splashColor: Colors.transparent, shadowColor: Colors.transparent),
                child: BottomNavigationBar(
                  currentIndex: dashBoardScreenController.selectedIndex.value,
                  onTap: dashBoardScreenController.onItemTapped,
                  elevation: 0, // Background color
                  backgroundColor: Color(0xFF120C1C),
                  selectedItemColor: AppColors.whiteColor,
                  type: BottomNavigationBarType.fixed,
                  selectedIconTheme: IconThemeData(color: Colors.white),
                  unselectedItemColor: AppColors.bodyDark, // Unselected item color
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      label: 'Home',
                      backgroundColor: Colors.transparent,
                      activeIcon: Container(child: Image.asset(ImagesAsset.activeHome, height: 24.h).paddingOnly(bottom: 4.h)),
                      icon: Image.asset(ImagesAsset.home, height: 24.h).paddingOnly(bottom: 4.h),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Container(child: Image.asset(ImagesAsset.activeBusiness, height: 24.h).paddingOnly(bottom: 4.h)),
                      backgroundColor: Color(0xFF120C1C),
                      icon: Image.asset(ImagesAsset.business, height: 24.h).paddingOnly(bottom: 4.h),
                      label: AppString.business,
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

class DashBoardScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final RxList<Widget> widgetOptions = RxList<Widget>.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    // Initialize widgetOptions with screens
    widgetOptions.assignAll([
      VandorHomeScreen(),
      OrderStatusDetailScreen(),
      VendorChatScreen(),
      VendorprofileScreen(),
    ]);
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
