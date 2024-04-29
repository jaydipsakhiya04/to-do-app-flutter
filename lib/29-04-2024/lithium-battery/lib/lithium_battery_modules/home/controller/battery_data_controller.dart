import 'package:flutter/cupertino.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:get/get.dart';

class BatteryDataController extends GetxController {
  RxBool isActive = true.obs;


  void changeSwitchValue(bool value){
    isActive.value = value;
  }

  TextEditingController detailsController = TextEditingController();
  TextEditingController settingController = TextEditingController();
  TextEditingController profileController = TextEditingController();

  List<String> batteryFeaturesImages = [
    ImageAsset.voltage,
    ImageAsset.average,
    ImageAsset.capacity,
    ImageAsset.cycleTime,
  ];
  List<String> batteryFeaturesTitle = [
    AppString.voltage,
    AppString.currentAverage,
    AppString.ratedCapacity,
    AppString.cycleTime,
  ];

  List<String> batteryFeaturesAmount = [
   "14.262",
   "0.0",
   "10.00Ah",
   "0",
  ];

  String getBatterySVG(int level) {
    // Define the SVG path data for the battery
    String pathData = '''
      <svg width="323" height="201" viewBox="0 0 323 201" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g transform="translate(0, ${(100-level)})">
      <path d="M159.689 63C130.983 63 107.137 71.2037 107.137 81.2907C107.137 91.3778 107.137 182.451 107.137 182.451C107.137 190.91 130.983 201.189 159.689 200.997C191.262 200.806 211.689 190.91 211.689 182.451V81.2907C211.689 71.2037 188.395 63 159.689 63Z" fill="url(#paint0_linear_141_70)"/>
      <path d="M211.517 81.9801C211.517 92.4605 188.106 100.96 159.258 100.96C130.41 100.96 107 92.4605 107 81.9801C107 71.4996 130.41 63 159.258 63C188.106 63 211.517 71.4996 211.517 81.9801Z" fill="url(#paint1_linear_141_70)"/>
      </g>
      <defs>
      <linearGradient id="paint0_linear_141_70" x1="107.688" y1="159" x2="211.688" y2="160.5" gradientUnits="userSpaceOnUse">
      <stop stop-color="#2BD0B7"/>
      <stop offset="1" stop-color="#107272"/>
      </linearGradient>
      <linearGradient id="paint1_linear_141_70" x1="159.258" y1="63" x2="159.258" y2="100.96" gradientUnits="userSpaceOnUse">
      <stop stop-color="#24B5A8"/>
      <stop offset="1" stop-color="#5BE6CE"/>
      </linearGradient>
      </defs>
      </svg>
      ''';

    return pathData;
  }



}
