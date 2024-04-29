// import 'package:flutter/material.dart';
// import 'package:flutter_template/generated/l10n.dart';
// import 'package:flutter_template/modules/authentication/controller/sign_up_controller.dart';
// import 'package:flutter_template/utils/app_colors.dart';
// import 'package:flutter_template/utils/navigation_utils/navigation.dart';
// import 'package:flutter_template/utils/navigation_utils/routes.dart';
// import 'package:flutter_template/utils/size_utils.dart';
// import 'package:flutter_template/utils/utils.dart';
// import 'package:flutter_template/widget/custom_button.dart';
// import 'package:flutter_template/widget/custom_textfeild.dart';
// import 'package:get/get.dart';
//
// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   final SignUpController _signUpController = Get.put(SignUpController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: SizeUtils.horizontalBlockSize * 3.36,
//           ),
//           child: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               LayoutBuilder(
//                 builder: (context, constraint) {
//                   return SingleChildScrollView(
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     child: ConstrainedBox(
//                       constraints: BoxConstraints(minHeight: constraint.maxHeight),
//                       child: IntrinsicHeight(
//                         child: Column(
//                           children: <Widget>[
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: SizeUtils.verticalBlockSize,
//                                   ),
//                                   _loginWidget(),
//                                   SizedBox(
//                                     height: SizeUtils.verticalBlockSize * 3,
//                                   ),
//                                   Center(
//                                     child: Text(
//                                       S.of(context).register,
//                                       style: TextStyle(
//                                         fontSize: SizeUtils.fSize_18(),
//                                         fontWeight: FontWeight.w600,
//                                         color: AppColors.textColor,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: SizeUtils.verticalBlockSize * 5,
//                                   ),
//                                   _emailTextField(),
//                                   SizedBox(
//                                     height: SizeUtils.verticalBlockSize * 2,
//                                   ),
//                                   _passwordTextField(),
//                                   SizedBox(
//                                     height: SizeUtils.verticalBlockSize,
//                                   ),
//                                   Text(
//                                     S.of(context).passwordValidationMsg,
//                                     style: TextStyle(
//                                       fontSize: SizeUtils.fSize_10(),
//                                       fontWeight: FontWeight.w400,
//                                       color: AppColors.textColor,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: SizeUtils.verticalBlockSize * 3.5,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // Spacer(),
//                             _agreeWidget(),
//                             SizedBox(
//                               height: SizeUtils.verticalBlockSize * 8.5,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Obx(
//                     () => Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: SizeUtils.verticalBlockSize,
//                       ),
//                       child: CustomButton(
//                         isLoader: _signUpController.isLoading.value,
//                         text: S.of(context).signUp,
//                         isDisabled: _signUpController.isDisable.value,
//                         onTap: () {
//                           onSubmit(context);
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: SizeUtils.verticalBlockSize,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onSubmit(BuildContext context) async {
//     Utils.hideKeyboardInApp(context);
//     if (_signUpController.checkError()) {
//       await _signUpController.signUp();
//     }
//   }
//
//   Widget _loginWidget() {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: InkWell(
//         onTap: () {
//           Navigation.replaceAll(Routes.signIn);
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: Text(
//             S.of(context).login,
//             style: TextStyle(
//               color: AppColors.appThemeColor,
//               fontWeight: FontWeight.w600,
//               fontSize: SizeUtils.fSize_15(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _emailTextField() {
//     return CustomTextField(
//       controller: _signUpController.controller,
//       hintText: S.of(context).enterEmailAddress,
//       keyboardType: TextInputType.emailAddress,
//       onChanged: (String? data) {
//         _signUpController.handleDisable();
//       },
//     );
//   }
//
//   Widget _agreeWidget() {
//     return Row(
//       children: [
//         Obx(() => Checkbox(
//               checkColor: Colors.white,
//               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//               value: _signUpController.isCheck.value,
//               shape: const CircleBorder(),
//               onChanged: (bool? val) {
//                 _signUpController.isCheck.value = val!;
//                 _signUpController.handleDisable();
//               },
//             )),
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               children: <TextSpan>[
//                 TextSpan(
//                   text: S.of(context).readAndAgreeMsg,
//                   style: TextStyle(
//                     fontSize: SizeUtils.fSize_12(),
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.textColor,
//                   ),
//                 ),
//                 TextSpan(
//                   text: S.of(context).appAgreement,
//                   style: TextStyle(
//                     fontSize: SizeUtils.fSize_12(),
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.appThemeColor,
//                   ),
//                 ),
//                 TextSpan(
//                   text: "${S.of(context).and} ",
//                   style: TextStyle(
//                     fontSize: SizeUtils.fSize_12(),
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.textColor,
//                   ),
//                 ),
//                 TextSpan(
//                   text: S.of(context).privacyNotice,
//                   style: TextStyle(
//                     fontSize: SizeUtils.fSize_12(),
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.appThemeColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _passwordTextField() {
//     return CustomTextField(
//       controller: _signUpController.passwordController,
//       hintText: S.of(context).password,
//       isPassword: true,
//       onChanged: (String? data) {
//         _signUpController.handleDisable();
//       },
//     );
//   }
// }
