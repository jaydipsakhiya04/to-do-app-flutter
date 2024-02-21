// import 'package:flutter/material.dart';
// import 'package:local/utils/app_colors.dart';
// import 'package:local/utils/assets.dart';
// import 'package:local/utils/navigation_utils/routes.dart';
//
// import 'utils/navigation_utils/navigation.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     Future.delayed(const Duration(seconds: 3), () {
//       navigateFurther(context);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.appColor,
//       body: Center(
//         child: Image.asset(
//           IconAsset.appLogo,
//         ),
//       ),
//     );
//   }
//
//   Future<void> navigateFurther(BuildContext context) async {
//     Navigation.replace(Routes.login);
//   }
// }
