// import 'package:firebase_analytics/firebase_analytics.dart';
//
// class FirebaseAnalyticsUtils {
//   static late FirebaseAnalytics analytics;
//   static late FirebaseAnalyticsObserver observer;
//
//   static const String signIn = 'signIn';
//   static const String signUp = 'signUp';
//
//   void init() {
//     analytics = FirebaseAnalytics.instance;
//     observer = FirebaseAnalyticsObserver(analytics: analytics);
//   }
//
//   void sendCurrentScreen(String screenName) async {
//     await analytics.setCurrentScreen(
//       screenName: screenName,
//       screenClassOverride: screenName,
//     );
//   }
//
//   void sendAnalyticsEvent(String buttonClick) async {
//     await analytics.logEvent(
//       name: buttonClick,
//     );
//   }
// }
//
// ///TODO:- init
// // FirebaseAnalyticsUtils().sendCurrentScreen(FirebaseAnalyticsUtils.createTeamScreen);
// ///TODO:- onTap
// // FirebaseAnalyticsUtils().sendAnalyticsEvent(FirebaseAnalyticsUtils.termsAndConditionsScreen);
