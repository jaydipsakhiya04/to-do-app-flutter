import 'package:flutter_template/lithium_battery_modules/authentication/view/login/view/create_new_password/view/create_new_password_screen.dart';
import 'package:flutter_template/lithium_battery_modules/authentication/view/login/view/forgot_password/view/forgot_password_screen.dart';
import 'package:flutter_template/lithium_battery_modules/authentication/view/login/view/forgot_password/view/otp_verification.dart';
import 'package:flutter_template/lithium_battery_modules/authentication/view/login/view/login_screen.dart';
import 'package:flutter_template/lithium_battery_modules/authentication/view/signup/view/sign_up_screen.dart';
import 'package:flutter_template/lithium_battery_modules/home/view/battery_data_screen.dart';
import 'package:flutter_template/lithium_battery_modules/home/view/battery_detail_screen.dart';
import 'package:flutter_template/lithium_battery_modules/home/view/bluetooth_devices_screen.dart';
import 'package:flutter_template/lithium_battery_modules/home/view/parameter_setting_screen.dart';
import 'package:flutter_template/lithium_battery_modules/onboarding/view/languages_screen.dart';
import 'package:flutter_template/lithium_battery_modules/onboarding/view/onboarding_screen.dart';
import 'package:flutter_template/lithium_battery_modules/profile/view/edit_profile/view/edit_profile_screen.dart';
import 'package:flutter_template/lithium_battery_modules/profile/view/profile_screen.dart';
import 'package:flutter_template/modules/dashboad/home/home_screen.dart';
import 'package:flutter_template/splash_screen.dart';
import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  // get started

  static const String homeScreen = '/home';
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';

  //started
  static const String splash = '/splash';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String languageScreen = '/languageScreen';
  static const String loginScreen = '/loginScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String otpVerificationScreen = '/otpVerificationScreen';
  static const String createNewPasswordScreen = '/createNewPasswordScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String bluetoothDeviceScreen = '/bluetoothDeviceScreen';
  static const String batteryDataScreen = '/batteryDataScreen';
  static const String batteryDetailScreen = '/batteryDetailScreen';
  static const String parameterSettingScreen = '/parameterSettingScreen';
  static const String profileScreen = '/profileScreen';
  static const String editProfileScreen = '/editProfileScreen';


  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splash,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),
    // GetPage<dynamic>(
    //   name: signIn,
    //   page: () => const SignInScreen(),
    //   transition: defaultTransition,
    // ),
    // GetPage<dynamic>(
    //   name: signUp,
    //   page: () => const SignUp(),
    //   transition: defaultTransition,
    // ),
    GetPage<dynamic>(
      name: homeScreen,
      page: () => const HomeScreen(),
      transition: defaultTransition,
    ),
    //
    GetPage<dynamic>(
      name: onBoardingScreen,
      page: () => const OnBoardingScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: languageScreen,
      page: () =>  LanguageScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: loginScreen,
      page: () =>  LoginScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: forgotPasswordScreen,
      page: () =>  ForgotPassWordScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: otpVerificationScreen,
      page: () =>   OtpVerificationScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: createNewPasswordScreen,
      page: () =>  CreateNewPasswordScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: signUpScreen,
      page: () =>  SignUpScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: bluetoothDeviceScreen,
      page: () =>  BluetoothDevicesScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: batteryDataScreen,
      page: () =>  BatteryDataScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: batteryDetailScreen,
      page: () =>  BatteryDetailScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: parameterSettingScreen,
      page: () =>  ParameterSettingScreen(),
      transition: defaultTransition,
    ),

    GetPage<dynamic>(
      name: profileScreen,
      page: () =>  ProfileScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: editProfileScreen,
      page: () =>  EditProfileScreen(),
      transition: defaultTransition,
    ),
  ];
}
