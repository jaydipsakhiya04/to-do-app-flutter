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
}