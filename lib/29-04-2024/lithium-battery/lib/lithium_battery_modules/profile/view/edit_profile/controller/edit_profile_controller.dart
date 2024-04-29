import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_template/lithium_battery_modules/authentication/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  Rx<File?> image = Rx<File?>(null);

  final AuthController authController=Get.find();
  TextEditingController nameEditController=TextEditingController();
  TextEditingController emailEditController=TextEditingController();

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxBool isLoading =false.obs;

  String get selectedDateFormatted => selectedDate.value != null ? DateFormat('yyyy-MM-dd').format(selectedDate.value!) : '';


}
