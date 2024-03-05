import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/booking_history_data_model.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';

class BookingDataController extends GetxController{

  RxList<BookingHistoryDataModel> bookingData = <BookingHistoryDataModel>[
    BookingHistoryDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.carolyn,
      people: AppString.orderpeople,
      date: AppString.bookingDate,
      time: AppString.timeRange,
    ),
    BookingHistoryDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.carolyn,
      people: AppString.orderpeople,
      date: AppString.bookingDate,
      time: AppString.timeRange,
    ),BookingHistoryDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.carolyn,
      people: AppString.orderpeople,
      date: AppString.bookingDate,
      time: AppString.timeRange,
    ),
    BookingHistoryDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.carolyn,
      people: AppString.orderpeople,
      date: AppString.bookingDate,
      time: AppString.timeRange,
    ),
    BookingHistoryDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.carolyn,
      people: AppString.orderpeople,
      date: AppString.bookingDate,
      time: AppString.timeRange,
    ),
    BookingHistoryDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.carolyn,
      people: AppString.orderpeople,
      date: AppString.bookingDate,
      time: AppString.timeRange,
    ),
    BookingHistoryDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.carolyn,
      people: AppString.orderpeople,
      date: AppString.bookingDate,
      time: AppString.timeRange,
    ),
  ].obs;


  var selectedOption = "Option 1".obs;
  var isDropdownOpen = false.obs;
  void openDropdown() {
    Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedOption.value,
        items: [
          DropdownMenuItem(
            child: Text("Option 1"),
            value: "Option 1",
          ),
          DropdownMenuItem(
            child: Text("Option 2"),
            value: "Option 2",
          ),
          DropdownMenuItem(
            child: Text("Option 3"),
            value: "Option 3",
          ),
        ],
        onChanged: (String? value) {
         selectedOption.value = value??"";
        },
      ),
    );
  }
}

