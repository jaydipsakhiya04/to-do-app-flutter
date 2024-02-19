import 'package:get/get.dart';
import 'package:local/modules/authentication/login/view/createnewpassword/create_new_password_screen.dart';
import 'package:local/modules/authentication/login/view/forgotpassword/forgot_password.dart';
import 'package:local/modules/authentication/login/view/login_screen.dart';
import 'package:local/modules/authentication/signup/view/emailotp/email_otp_screen.dart';
import 'package:local/modules/authentication/signup/view/getstart/get_start_screen.dart';
import 'package:local/modules/authentication/signup/view/phonelogin/phone_login_screen.dart';
import 'package:local/modules/authentication/signup/view/phonelogin/phoneotp/phone_otp_screen.dart';
import 'package:local/modules/authentication/signup/view/phonelogin/userdetails/enter_user_details_screen.dart';
import 'package:local/modules/authentication/signup/view/sign_up_screen.dart';
import 'package:local/modules/splash/view/splash_screen.dart';
import 'package:local/modules/user/birthdate/view/birthdate_screen.dart';
import 'package:local/modules/user/dashboad/view/home/home_screen.dart';
import 'package:local/modules/user/dashboad/view/user_dashBoard_screen.dart';
import 'package:local/modules/user/onboarding/presentation/first_intro_screen.dart';
import 'package:local/modules/user/onboarding/presentation/second_intro_screen.dart';
import 'package:local/modules/vendor/businessdetails/view/booking_price.dart';
import 'package:local/modules/vendor/businessdetails/view/business_account.dart';
import 'package:local/modules/vendor/businessdetails/view/business_address.dart';
import 'package:local/modules/vendor/businessdetails/view/business_categories_services.dart';
import 'package:local/modules/vendor/businessdetails/view/business_eco_friendly.dart';
import 'package:local/modules/vendor/businessdetails/view/business_features.dart';
import 'package:local/modules/vendor/businessdetails/view/business_hours.dart';
import 'package:local/modules/vendor/businessdetails/view/business_name.dart';
import 'package:local/modules/vendor/businessdetails/view/business_phone.dart';
import 'package:local/modules/vendor/businessdetails/view/business_website.dart';
import 'package:local/modules/vendor/businessdetails/view/busnies_service.dart';
import 'package:local/modules/vendor/businessdetails/view/what_kind_of_business.dart';
import 'package:local/modules/vendor/dashboad/view/home/presentation/vandor_home_chat_screen.dart';
import 'package:local/modules/vendor/dashboad/view/home/presentation/vandor_home_notification_screen.dart';
import 'package:local/modules/vendor/dashboad/view/home/presentation/vandor_home_screen.dart';
import 'package:local/modules/vendor/dashboad/view/vandor_dashBoard_screen.dart';
import 'package:local/modules/vendor/restaurant_details/accept_payment.dart';
import 'package:local/modules/vendor/restaurant_details/restaurant_menu.dart';
import 'package:local/modules/vendor/restaurant_details/restaurant_photos.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  // get started
  static const String splash = '/splash';
  static const String signUp = '/signUp';
  static const String forgotPass = '/forgotPass';
  static const String createNewPass = '/createNewPass';
  static const String createBusinessAccount = '/createBusinessAccount';
  static const String businessName = '/businessName';
  static const String businessPhone = '/businessPhone';
  static const String businessWebsite = '/businessWebsite';
  static const String whatKindOfBusiness = '/whatKindOfBusiness';
  static const String businessAddress = '/businessAddress';
  static const String getStart = '/getStart';
  static const String businessHours = '/businessHours';
  static const String businessCategoriesServices = '/businessCategoriesServices';
  static const String restaurantPhotos = '/restaurantPhotos';
  static const String restaurantMenu = '/restaurantMenu';
  static const String paymentAccept = '/paymentAccept';
  static const String businessFeatures = '/businessFeatures';
  static const String businessEcoFriendly = '/businessEcoFriendly';
  static const String businessService = '/businessService';
  static const String bookingPrice = '/bookingPrice';
  static const String firstIntro = '/firstIntro';
  static const String secondIntro = '/secondIntro';
  static const String signIn = '/signIn';
  static const String emailOTP = '/emailOTP';
  static const String phoneOTP = '/phoneOTP';
  static const String phoneNumber = '/phoneNumber';
  static const String enterUserDetails = '/enterUserDetails';
  static const String birthDate = '/birthDate';
  static const String userHome = '/userHome';


  static const String userDashBoard = '/userDashBoard';


  static const String vanDorDashBoard = '/vanDorDashBoard';
  static const String vandorHome = '/vandorHome';
  static const String vandorHomeChat = '/vandorHomeChat';
  static const String vandorNotification = '/vandorNotification';





  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splash,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: signIn,
      page: () => LoginScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: signUp,
      page: () => SignUpScreen(),
      transition: defaultTransition,
    ),

    GetPage<dynamic>(
      name: forgotPass,
      page: () => ForgotPassword(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: emailOTP,
      page: () => EmailOTPVefiedScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: phoneOTP,
      page: () => PhoneOTPVefiedScreen(),
      transition: defaultTransition,
    ),

    GetPage<dynamic>(
      name: createNewPass,
      page: () => CreateNewPasswordScreen(),
      transition: defaultTransition,
    ),

    GetPage<dynamic>(
      name: phoneNumber,
      page: () => PhoneNumberScreen(),
      transition: defaultTransition,
    ),

    ///-------UserSide------------------------------------->
    GetPage<dynamic>(
      name: firstIntro,
      page: () => FirstIntroScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: secondIntro,
      page: () => SecondIntroScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: enterUserDetails,
      page: () => EnterUserDetailsScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: userDashBoard,
      page: () => UserDashBoardScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: birthDate,
      page: () => BirthDateScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: userHome,
      page: () => UserHomeScreen(),
      transition: defaultTransition,
    ),

    ///-------VendorSide------------------------------------->
    GetPage<dynamic>(
      name: createBusinessAccount,
      page: () => CreateBusinessAccountScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessName,
      page: () => BusinessNameScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessPhone,
      page: () => BusinessPhoneScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessWebsite,
      page: () => BusinessWebsiteScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: whatKindOfBusiness,
      page: () => WhatKindOfBusinessScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessAddress,
      page: () => BusinessAddressScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: getStart,
      page: () => const GetStartScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessHours,
      page: () => BusinessHoursScreen(
        title: '',
      ),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessCategoriesServices,
      page: () => BusinessCategoriesServicesScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: restaurantPhotos,
      page: () => RestaurantPhotosScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: restaurantMenu,
      page: () => RestaurantMenuScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: paymentAccept,
      page: () => PaymentAcceptScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessFeatures,
      page: () => BusinessFeaturesScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessEcoFriendly,
      page: () => BusinessEcoFriendlyScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessService,
      page: () => BusinessServiceScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: bookingPrice,
      page: () => BookingPriceScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: vanDorDashBoard,
      page: () => VandorDashBoardScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: vandorHome,
      page: () => VandorHomeScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: vandorHomeChat,
      page: () => VandorHomeChatScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: vandorNotification,
      page: () => VandorNotificationScreen(),
      transition: defaultTransition,
    ),

    // GetPage<dynamic>(
    //   name: homeScreen,
    //   page: () => const HomeScreen(),
    //   transition: defaultTransition,
    // ),
  ];
}
