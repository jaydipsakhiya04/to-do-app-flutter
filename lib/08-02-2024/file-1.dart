import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_hub/constants/utitls/app_colors.dart';
import 'package:event_hub/constants/utitls/date_time_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

import '../../constants/utitls/snack_bar.dart';

class AddEventController extends GetxController {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventAddressController = TextEditingController();
  ValueNotifier valueNotifier = ValueNotifier(true);


  List images = [];

  final formKeyEvent = GlobalKey<FormState>();
  final RxBool isUpdate = false.obs;
  final RxBool validUser = false.obs;
  final RxBool isUpdateVisible = true.obs;

  @override
  void onInit() async {
    var arguments = Get.arguments;
    log("first call");
    if (arguments != null) {
      print(" arguments['time']++++${ arguments["time"]}");
      eventNameController.text = arguments["eventName"];
      eventAddressController.text = arguments["eventAddress"];
      images = arguments["image"];
      selectedTime.value = arguments["time"];
      isUpdate.value = arguments["isUpdate"];
      validUser.value = arguments["validUser"];
      print("validUser---$validUser");

      update();
    }
    super.onInit();
  }

  Rx<String?> selectedTime = Rx<String?>(null);

  void updateSelectedTime(TimeOfDay time, BuildContext context) {
    final now = DateTime.now();
    DateTime selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    // Convert selectedDateTime to milliseconds since epoch
    var millisecondsSinceEpoch = selectedDateTime.millisecondsSinceEpoch.toString();
    selectedTime.value = millisecondsSinceEpoch;
    print("selectedTime----$selectedTime");
  }



  void addEventToFirestore(List imageUrls) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      print('User not authenticated');
      return;
    }
    String uid = currentUser.uid;
    Map<String, dynamic> eventData = {
      'uid': uid,
      'eventName': eventNameController.text,
      'eventAddress': eventAddressController.text,
      'eventTime': DateTime.now().millisecondsSinceEpoch,
      'imageUrls': imageUrls,
    };
    try {
      await FirebaseFirestore.instance.collection('events').doc().set(eventData);
      CustomSnackBar.commonSnackBar(
          "", "Event added successfully!", AppColors.lightGreen, AppColors.white, SnackPosition.TOP);
      // Get.toNamed(Routes.upcomingEvents);
    } catch (error) {
      print('Error adding event to Firestore: $error');
    }
  }

  void updateEventInFirestore(List imageUrls, String eventId,) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser!;
      if (currentUser == null) {
        // print('User not authenticated');
        return;
      }
      String uid = currentUser.uid;
      String eventName = eventNameController.text.trim();
      String eventAddress = eventAddressController.text.trim();
      String eventTime = selectedTime.value ?? ''; // Get selected time

      if (eventName.isEmpty || eventAddress.isEmpty || eventTime.isEmpty) {
        print('Event data is incomplete');
        return;
      }

      DocumentSnapshot<Map<String, dynamic>> eventDoc = await FirebaseFirestore.instance.collection('events').doc(eventId).get();
      if (!eventDoc.exists) {
        print('Event not found');
        return;
      }

      // Update eventData with the new event time
      Map<String, dynamic> eventData = {
        'uid': uid,
        'eventName': eventName,
        'eventAddress': eventAddress,
        'eventTime': eventTime, // Update eventTime with the selected time
        'imageUrls': imageUrls.isNotEmpty ? imageUrls : eventDoc['imageUrls'],
      };

      // Update the event in Firestore
      await FirebaseFirestore.instance.collection('events').doc(eventId).update(eventData);

      // Show success message
      CustomSnackBar.commonSnackBar(
          "",
          "Event updated successfully!",
          AppColors.lightGreen,
          AppColors.white,
          SnackPosition.BOTTOM
      );
    } catch (error) {
      CustomSnackBar.commonSnackBar(
          "Error",
          "Failed to add/update event to Firestore",
          AppColors.red,
          AppColors.white,
          SnackPosition.BOTTOM
      );
    }
  }



  RxBool isImageAdd = false.obs;

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      isImageAdd.value = true;
      images.addAll(pickedFiles);
    }
    valueNotifier.notifyListeners();
  }



  void removeImage(int index) {
    if (index >= 0 && index < images.length) {
      images.removeAt(index);
      valueNotifier.value = !valueNotifier.value;
    }
  }



  Future<List<String>> uploadImagesToStorage() async {
    List<String> imageUrls = [];
    try {
      for (var image in images) {
        String fileName = basename(image.path);
        Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
        UploadTask uploadTask = storageReference.putFile(File(image.path));

        await uploadTask.whenComplete(() async {
          String imageUrl = await storageReference.getDownloadURL();
          print("imageData--$imageUrl");
          imageUrls.add(imageUrl);
        });
      }
    } on Exception catch (e) {
      print("catch$e--");
      // TODO
    }
    return imageUrls;
  }





  void reset() {
    eventNameController.clear();
    eventAddressController.clear();
    images.clear();
  }

  var isProcessing = false.obs;

  void setIsProcessing(bool value) {
    isProcessing.value = value;
  }

  Future<void> onTapProcess() async {
    if (formKeyEvent.currentState?.validate() ?? false) {
      setIsProcessing(true);

      List<String> imageUrls = await uploadImagesToStorage();

      addEventToFirestore(imageUrls);

      setIsProcessing(false);

      Get.back();
      reset();
    }
  }
}