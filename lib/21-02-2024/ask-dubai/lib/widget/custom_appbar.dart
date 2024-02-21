// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:local/utils/app_colors.dart';
// import 'package:local/utils/navigation_utils/navigation.dart';
//
// class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CommonAppBar({
//     super.key,
//     this.title,
//     this.action,
//     this.showBackButton = true,
//     this.dividerColor,
//   });
//
//   final String? title;
//   final List<Widget>? action;
//   final bool showBackButton;
//   final Color? dividerColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: false,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       backgroundColor: AppColors.bgPrimaryColor,
//       title: Padding(
//         padding: EdgeInsets.only(left: 10.w, top: 16.h, bottom: 4.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             showBackButton
//                 ? GestureDetector(
//                     onTap: () {
//                       Navigation.pop();
//                     },
//                     child: FittedBox(
//                       fit: BoxFit.scaleDown,
//                       child: Container(
//                         height: 40.h,
//                         width: 40.h,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: AppColors.secondaryDefaultColor, // Set the border color
//                             width: 2.0, // Set the border width
//                           ),
//                           borderRadius: BorderRadius.circular(8.0), // Set the border radius
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: SvgPicture.asset(
//                             IconAsset.backArrow,
//                             height: 24.h,
//                             width: 24.w,
//                             alignment: Alignment.center,
//                             colorFilter: ColorFilter.mode(
//                               AppColors.primaryColor,
//                               BlendMode.srcIn,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 : const SizedBox.shrink(),
//             title != null
//                 ? Padding(
//                     padding: EdgeInsets.only(left: 16.w),
//                     child: Center(
//                       child: Text(
//                         title!,
//                         style: AppTextStyle().SansMidF16W5Primary,
//                       ),
//                     ),
//                   )
//                 : const SizedBox.shrink(),
//           ],
//         ),
//       ),
//
//       actions: [
//         Padding(
//           padding: EdgeInsets.only(top: 14.h),
//           child: Row(
//             children: action ?? [],
//           ),
//         ),
//       ],
//       // bottom: PreferredSize(
//       //   preferredSize: const Size.fromHeight(1),
//       //   child: Container(
//       //     color: dividerColor ?? AppColors.bgSecondaryColor,
//       //     height: 1.h,
//       //   ),
//       // ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(kTextTabBarHeight + 8.h);
// }
