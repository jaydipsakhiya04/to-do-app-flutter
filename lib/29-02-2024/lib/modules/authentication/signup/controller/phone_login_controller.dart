import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  Rx<Country> selectedCountry = countryList.first.obs;



  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
