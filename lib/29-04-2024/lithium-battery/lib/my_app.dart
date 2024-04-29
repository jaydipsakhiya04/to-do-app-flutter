import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'package:flutter_template/language_change_provider.dart';
import 'package:flutter_template/lithium_battery_modules/authentication/controller/auth_controller.dart';
import 'package:flutter_template/lithium_battery_modules/onboarding/controller/language_controller.dart';
import 'package:flutter_template/translation/language_transalation.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/navigation_utils/routes.dart';
import 'package:flutter_template/utils/utils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'main.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        translations: Languages(),
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          fontFamily: "Outfit",

        ),
        debugShowCheckedModeBanner: false,
        locale: Locale(language),
        fallbackLocale: Locale('en'),
        // locale: Provider.of<LanguageChangeProvider>(context).currentLocal,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: AppString.appName,
        initialBinding: AppBidding(),
        initialRoute: Routes.splash,
        getPages: Routes.pages,
        builder: (context, child) {
          return Scaffold(
            body: GestureDetector(
              onTap: () {
                Utils.hideKeyboardInApp(context);
              },
              child: child,
            ),
          );
        },
      ),
    );
  }
}

class AppBidding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(LanguageController());
  }
}



