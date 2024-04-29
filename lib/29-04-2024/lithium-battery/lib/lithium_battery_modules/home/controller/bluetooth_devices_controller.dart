import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BluetoothDevicesController extends GetxController {
  var selectedIndex = RxInt(-1);

  void setSelectedLanguageIndex(int index) {
    selectedIndex.value = index;
  }

  TextEditingController settingController = TextEditingController();
  TextEditingController profileController = TextEditingController();

}