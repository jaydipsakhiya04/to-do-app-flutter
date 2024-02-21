import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessHourController extends GetxController {
  Map<String, Rx<TimeOfDay?>> openingTimes = {
    'Monday': Rx<TimeOfDay?>(null),
    'Tuesday': Rx<TimeOfDay?>(null),
    'Wednesday': Rx<TimeOfDay?>(null),
    'Thursday': Rx<TimeOfDay?>(null),
    'Friday': Rx<TimeOfDay?>(null),
    'Saturday': Rx<TimeOfDay?>(null),
    'Sunday': Rx<TimeOfDay?>(null),
  };

  Map<String, Rx<TimeOfDay?>> closingTimes = {
    'Monday': Rx<TimeOfDay?>(null),
    'Tuesday': Rx<TimeOfDay?>(null),
    'Wednesday': Rx<TimeOfDay?>(null),
    'Thursday': Rx<TimeOfDay?>(null),
    'Friday': Rx<TimeOfDay?>(null),
    'Saturday': Rx<TimeOfDay?>(null),
    'Sunday': Rx<TimeOfDay?>(null),
  };

  static Map<String, RxBool> showAddMore = {
    'Monday': RxBool(false),
    'Tuesday': RxBool(false),
    'Wednesday': RxBool(false),
    'Thursday': RxBool(false),
    'Friday': RxBool(false),
    'Saturday': RxBool(false),
    'Sunday': RxBool(false),
  };

  void setOpenTime(String day, TimeOfDay? time) {
    openingTimes[day]!.value = time;
    if (closingTimes[day]!.value != null && closingTimes[day]!.value!.hour < time!.hour) {
      closingTimes[day]!.value = null;
    }
  }

  void setClosingTime(String day, TimeOfDay? time) {
    if (openingTimes[day]!.value != null && time!.hour < openingTimes[day]!.value!.hour) {
      return; // Do not allow setting closing time before opening time
    }
    closingTimes[day]!.value = time;
  }

  void toggleAddMore(String day) {
    showAddMore[day]!.value = !showAddMore[day]!.value;
  }

  List<String> get daysOfWeek => ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  // void setOpenTime(String day, TimeOfDay time) {
  //   openingTimes[day]!.value = time;
  // }
  //
  // void setClosingTime(String day, TimeOfDay time) {
  //   closingTimes[day]!.value = time;
  // }
  //
  // void setAdditionalOpenTime(String day, TimeOfDay time) {
  //   additionalOpeningTimes[day]!.value = time;
  // }
  //
  // void setAdditionalClosingTime(String day, TimeOfDay time) {
  //   additionalClosingTimes[day]!.value = time;
  // }
}
