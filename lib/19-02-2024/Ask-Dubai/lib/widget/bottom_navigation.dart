// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:local/modules/dashboad/controller/dashboard_controller.dart';
// import 'package:local/utils/app_colors.dart';
// import 'package:local/utils/app_string.dart';
// import 'package:local/utils/assets.dart';
//
// class BottomNavigation extends StatelessWidget {
//   final DashBoardController dashBoardController = Get.put(DashBoardController());
//   final BuildContext context;
//
//   BottomNavigation({Key? key, required this.context}) : super(key: key);
//
//   void _onItemTapped(int index) {
//     dashBoardController.pageIndex.value = index;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: dashBoardController.pageIndex,
//         builder: (context, int value, child) {
//           return Container(
//             decoration: BoxDecoration(border: Border.all(color: AppColors.appColor)),
//             child: Theme(
//               data: ThemeData(splashColor: Colors.transparent),
//               child: BottomNavigationBar(
//                 type: BottomNavigationBarType.fixed,
//                 backgroundColor: AppColors.appColor,
//                 currentIndex: value,
//                 onTap: _onItemTapped,
//                 selectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: AppColors.appColor),
//                 unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.appColor),
//                 unselectedItemColor: AppColors.appColor,
//                 iconSize: 3.5.h,
//                 selectedItemColor: AppColors.appColor,
//                 elevation: 0,
//                 items: [
//                   BottomNavigationBarItem(
//                     activeIcon: Image.asset(IconsAsset.discover, height: 27.h).paddingOnly(bottom: 3),
//                     label: AppString.home,
//                     icon: ImageIcon(const AssetImage(IconsAsset.discover), size: 27.h).paddingOnly(bottom: 3),
//                   ),
//                   BottomNavigationBarItem(
//                     activeIcon: Image.asset(IconsAsset.collection, height: 27.h).paddingOnly(bottom: 3),
//                     label: AppString.map,
//                     icon: ImageIcon(
//                       const AssetImage(IconsAsset.collection),
//                       size: 27.h,
//                     ).paddingOnly(bottom: 3),
//                   ),
//                   BottomNavigationBarItem(
//                     activeIcon: Image.asset(IconsAsset.collection, height: 27.h).paddingOnly(bottom: 3),
//                     label: AppString.chat,
//                     icon: ImageIcon(
//                       const AssetImage(IconsAsset.collection),
//                       size: 27.h,
//                     ).paddingOnly(bottom: 3),
//                   ),
//                   BottomNavigationBarItem(
//                     activeIcon: Image.asset(IconsAsset.collection, height: 27.h).paddingOnly(bottom: 3),
//                     label: AppString.profile,
//                     icon: ImageIcon(
//                       const AssetImage(IconsAsset.collection),
//                       size: 27.h,
//                     ).paddingOnly(bottom: 3),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
