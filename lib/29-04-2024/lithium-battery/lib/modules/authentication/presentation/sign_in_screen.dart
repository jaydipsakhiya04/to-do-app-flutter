// import 'package:flutter/material.dart';
// import 'package:flutter_template/generated/l10n.dart';
// import 'package:flutter_template/modules/authentication/controller/sign_in_controller.dart';
// import 'package:flutter_template/utils/app_colors.dart';
// import 'package:flutter_template/utils/app_country_picker.dart';
// import 'package:flutter_template/utils/navigation_utils/navigation.dart';
// import 'package:flutter_template/utils/navigation_utils/routes.dart';
// import 'package:flutter_template/utils/size_utils.dart';
// import 'package:flutter_template/utils/utils.dart';
// import 'package:flutter_template/widget/annotated_region.dart';
// import 'package:flutter_template/widget/custom_button.dart';
// import 'package:flutter_template/widget/custom_textfeild.dart';
// import 'package:get/get.dart';
//
// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   final SignInController _signInController = Get.put(SignInController());
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomAnnotatedRegions(
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: SizeUtils.horizontalBlockSize * 3.36,
//             ),
//             child: Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 LayoutBuilder(
//                   builder: (context, constraint) {
//                     return SingleChildScrollView(
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(minHeight: constraint.maxHeight),
//                         child: IntrinsicHeight(
//                           child: Column(
//                             children: <Widget>[
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     SizedBox(
//                                       height: SizeUtils.verticalBlockSize * 1,
//                                     ),
//                                     _createAccountWidget(),
//                                     SizedBox(
//                                       height: SizeUtils.verticalBlockSize * 3.5,
//                                     ),
//                                     Center(
//                                       child: Text(
//                                         S.of(context).login,
//                                         style: TextStyle(
//                                           fontSize: SizeUtils.fSize_18(),
//                                           fontWeight: FontWeight.w600,
//                                           color: AppColors.textColor,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: SizeUtils.verticalBlockSize * 3,
//                                     ),
//                                     Obx(() => Column(
//                                           crossAxisAlignment: CrossAxisAlignment.end,
//                                           children: [
//                                             _loginWithEmailWidget(_signInController.isEmail.value),
//                                             if (_signInController.isEmail.value)
//                                               Hero(
//                                                 tag: "animateSignIn",
//                                                 child: _emailTextField(),
//                                               )
//                                             else
//                                               Hero(
//                                                 tag: "animateSignIn",
//                                                 child: _phoneTextField(),
//                                               ),
//                                           ],
//                                         )),
//                                     SizedBox(
//                                       height: SizeUtils.verticalBlockSize * 2,
//                                     ),
//                                     _passwordTextField(),
//                                     SizedBox(
//                                       height: SizeUtils.verticalBlockSize * 0.5,
//                                     ),
//                                     _forgetPasswordWidget(),
//                                     SizedBox(
//                                       height: SizeUtils.verticalBlockSize * 1.5,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Obx(() => Padding(
//                           padding: EdgeInsets.symmetric(
//                             vertical: SizeUtils.verticalBlockSize,
//                           ),
//                           child: CustomButton(
//                             isLoader: _signInController.isLoading.value,
//                             text: S.of(context).login,
//                             isDisabled: _signInController.isDisable.value,
//                             onTap: () {
//                               onSubmit(context);
//                             },
//                           ),
//                         )),
//                     SizedBox(
//                       height: SizeUtils.verticalBlockSize,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onSubmit(BuildContext context) async {
//     Utils.hideKeyboardInApp(context);
//     if (_signInController.checkError()) {
//       await _signInController.signIn();
//     }
//   }
//
//   Widget _forgetPasswordWidget() {
//     return InkWell(
//       onTap: () {},
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Text(
//           S.of(context).forgotPassword,
//           style: TextStyle(
//             color: AppColors.appThemeColor,
//             fontWeight: FontWeight.w500,
//             fontSize: SizeUtils.fSize_13(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _createAccountWidget() {
//     return InkWell(
//       onTap: () {
//         Navigation.replaceAll(Routes.signUp);
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Text(
//           S.of(context).register,
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             color: AppColors.appThemeColor,
//             fontSize: SizeUtils.fSize_15(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _loginWithEmailWidget(bool value) {
//     return InkWell(
//       onTap: () {
//         _signInController.isEmail.value = !_signInController.isEmail.value;
//         _signInController.controller.clear();
//       },
//       child: AnimatedContainer(
//         padding: const EdgeInsets.all(8),
//         duration: const Duration(milliseconds: 200),
//         child: Text(
//           value ? S.of(context).logInWithMobile : S.of(context).logInWithEmail,
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: SizeUtils.fSize_13(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _passwordTextField() {
//     return CustomTextField(
//       controller: _signInController.passwordController,
//       hintText: S.of(context).password,
//       isPassword: true,
//       onChanged: (String? data) {
//         _signInController.handleButtonDisable();
//       },
//     );
//   }
//
//   Widget _phoneTextField() {
//     return CustomTextField(
//       controller: _signInController.controller,
//       hintText: S.of(context).enterMobileNumber,
//       keyboardType: TextInputType.phone,
//       onChanged: (String? data) {
//         _signInController.handleButtonDisable();
//       },
//       prefix: CountryPickerWidget(
//         selectedDialogCountry: _signInController.selectedDialogCountry,
//       ),
//     );
//   }
//
//   Widget _emailTextField() {
//     return CustomTextField(
//       controller: _signInController.controller,
//       hintText: S.of(context).enterEmailAddress,
//       keyboardType: TextInputType.emailAddress,
//       onChanged: (String? data) {
//         _signInController.handleButtonDisable();
//       },
//     );
//   }
// }
