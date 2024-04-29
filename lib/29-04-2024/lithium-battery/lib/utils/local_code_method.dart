import 'package:flutter/material.dart';
import 'package:flutter_template/utils/app_preferences.dart';

 Locale getLocaleFromPreferences() {
  final String selectedLanguageCode = AppPreference.getString('selectedLanguageCode');
  if (selectedLanguageCode.isNotEmpty) {
    return Locale(selectedLanguageCode);
  } else {
    // If no language code is stored in shared preferences, set the default code to 'en'
    AppPreference.setString('selectedLanguageCode', 'en');
    return Locale('en');
  }
}
