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
import 'package:local/modules/user/dashboad/presentation/profile/presentation/profile_screen.dart';
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
import 'package:local/modules/vendor/dashboad/view/business/presentation/order_status_detail.dart';
import 'package:local/modules/vendor/dashboad/view/chat/presentation/chat_view_screen.dart';
import 'package:local/modules/vendor/dashboad/view/chat/presentation/vandor_chat_screen.dart';
import 'package:local/modules/vendor/dashboad/view/home/presentation/vandor_home_chat_screen.dart';
import 'package:local/modules/vendor/dashboad/view/home/presentation/vandor_home_notification_screen.dart';
import 'package:local/modules/vendor/dashboad/view/home/presentation/vandor_home_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/presentation/more/presentation/add_bank_detail_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/analytics/presentation/analystic_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/booking%20history/presentation/booking_history_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/business_listing_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/update%20business%20details/presentation/update%20business%20categories/presentation/categories_edit_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/presentation/deposit/presentation/deposit_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/update%20business%20details/presentation/eco%20friendly/presenatation/eco_friendly_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/edit%20profile/presentation/edit_profile_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/update%20business%20details/presentation/features/presentation/features_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/help%20center/presentation/help_center_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20menu/presentation/menu_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/presentation/more/presentation/more_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/update%20business%20details/presentation/payment%20method/presentation/payment_method_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/presentation/payment_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/presentation/more/presentation/phone_number_verification_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/privacy%20policy/presentation/privacy_policy_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/profile_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/queries/presentation/queries_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/review/presentation/review_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/update%20business%20details/presentation/business%20services/presentation/service_edit_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/terms%20and%20conditions/presenatation/terms_conditions_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/presentation/transfers/presentation/transfers_history_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/update%20business%20details/presentation/update%20business%20address/presentation/update_business_address.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/update%20business%20details/presentation/update_business_detail.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/update%20business%20details/presentation/update%20business%20time/presentation/update_business_time.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20listing/presentation/update%20business%20details/presentation/update%20business%20image/presentation/update_image_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20menu/presentation/update%20menu/presentation/update_menu_screen.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/payment/presentation/withdraw/presentation/withdraw_screen.dart';
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
  static const String orderStatusDetail = '/pendingOrder';
  static const String vandorChat = '/vandorChat';
  static const String chatView = '/chatView';
  static const String vandorprofile = '/vandorProfile';
  static const String editProfile = '/editProfile';
  static const String analystic = '/analystic';
  static const String bookingHistory = '/bookingHistory';
  static const String payment = '/payment';
  static const String deposite = '/deposite';
  static const String transferHistory = '/transferHistory';
  static const String withDraw = '/withDraw';
  static const String more = '/more';
  static const String addBankDetail = '/addBankDetail';
  static const String phoneNumberVerification = '/phoneNumberVerification';
  static const String businessListing = '/businessListing';
  static const String updateBusinessDetail = '/updateBusiness';
  static const String updateBusinessAddress = '/updateBusinessAddress';
  static const String updateBusinessTime = '/updateBusinessTime';
  static const String updateImage = '/updateImage';
  static const String paymentMethod = '/paymentMethod';
  static const String features = '/features';
  static const String ecoFriendly = '/ecoFriendly';
  static const String servicesEdit = '/servicesEdit';
  static const String categoriesEdit = '/categoriesEdit';
  static const String queries = '/queries';
  static const String menu = '/menu';
  static const String addAndUpdateMenu = '/addAndUpdateMenu';
  static const String helpCenter = '/helpCenter';
  static const String privacyPolicy = '/privacyPolicy';
  static const String termsAndCondition = '/termsAndCondition';
  static const String review = '/review';



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
    GetPage<dynamic>(
      name: orderStatusDetail,
      page: () => OrderStatusDetailScreen(),
      transition: defaultTransition,
    ),  GetPage<dynamic>(
      name: vandorChat,
      page: () => VendorChatScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: chatView,
      page: () => ChatViewScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: vandorprofile,
      page: () => VendorprofileScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: editProfile,
      page: () =>  EditProfileScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: analystic,
      page: () => AnalysticScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: bookingHistory,
      page: () => BookingHistoryScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: payment,
      page: () => PaymentScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: deposite,
      page: () => DepositScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: transferHistory,
      page: () => TransferHistoryScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: withDraw,
      page: () => const WithDrawScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: more,
      page: () =>  MoreScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: addBankDetail,
      page: () =>  AddBankDetailScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: phoneNumberVerification,
      page: () =>  PhoneNumberVerificationScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: businessListing,
      page: () =>  BusinessListingScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: updateBusinessDetail,
      page: () =>  UpdateBusinessDetail(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: updateBusinessAddress,
      page: () =>  UpdateBusinessAddress(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: updateBusinessTime,
      page: () =>  UpdateBusinessTime(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: updateImage,
      page: () =>  UpdateImageScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: paymentMethod,
      page: () =>  PaymentMethodScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: features,
      page: () =>  FeaturesScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: ecoFriendly,
      page: () =>  EcoFriendlyScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: servicesEdit,
      page: () =>  ServicesEditScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: categoriesEdit,
      page: () =>  CategoriesEditScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: queries,
      page: () =>  QueriesScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: menu,
      page: () =>  MenuScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: addAndUpdateMenu,
      page: () =>  UpdateAndAddScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: helpCenter,
      page: () =>  HelpCenterScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: privacyPolicy,
      page: () =>  PrivacyPolicyScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: termsAndCondition,
      page: () =>  TermsAndConditionScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: review,
      page: () =>  ReviewScreen(),
      transition: defaultTransition,
    ),
    // GetPage<dynamic>(
    //   name: homeScreen,
    //   page: () => const HomeScreen(),
    //   transition: defaultTransition,
    // ),
  ];
}
