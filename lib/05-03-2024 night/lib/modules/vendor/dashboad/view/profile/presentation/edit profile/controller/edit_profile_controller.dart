import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  Rx<File?> image = Rx<File?>(null);

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  String get selectedDateFormatted =>
      selectedDate.value != null ? DateFormat('yyyy-MM-dd').format(selectedDate.value!) : '';
}

