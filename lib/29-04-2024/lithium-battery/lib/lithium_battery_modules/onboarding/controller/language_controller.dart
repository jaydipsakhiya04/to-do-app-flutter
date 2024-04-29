import 'dart:developer';
import 'dart:ui';

import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:get/get.dart';

import '../../../utils/app_preferences.dart';

class LanguageController extends GetxController {

  final AppPreference appPreference = AppPreference();

  var selectedLanguageIndex = RxInt(-1);
  RxBool isLoading = false.obs;

  void setSelectedLanguageIndex(int index) {
    selectedLanguageIndex.value = index;
  }

  List languageList=[
    LanguageData(image: ImageAsset.english, name: AppString.english, code: "en"),
    LanguageData(image: ImageAsset.germany, name: AppString.germany, code: "ge"),
    LanguageData(image: ImageAsset.france, name: AppString.france, code: "fr"),
    LanguageData(image:ImageAsset.netherland, name: AppString.netherlands, code: "ne"),
    LanguageData(image: ImageAsset.spain, name: AppString.spain, code: "sp"),
    LanguageData(image: ImageAsset.sweden, name: AppString.sweden, code: "sw"),
    LanguageData(image: ImageAsset.denmark, name: AppString.denmark, code: "de"),
    LanguageData(image: ImageAsset.norway, name: AppString.norway, code: "no"),
    LanguageData(image: ImageAsset.italy, name: AppString.italy, code: "it"),
    LanguageData(image: ImageAsset.poland, name: AppString.poland, code: "po"),
  ];

  void setSelectedLanguagex(int index) {
    selectedLanguageIndex.value = index;
    String selectedLanguageCode = languageList[index].code;
    AppPreference.setString('selectedLanguageCode', selectedLanguageCode);
  }




}

class LanguageData{
  String image;
  String name;
  String code;

  LanguageData({required this.image,required this.name,required this.code});
}
