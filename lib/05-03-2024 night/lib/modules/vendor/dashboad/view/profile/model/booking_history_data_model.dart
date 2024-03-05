import 'package:get/get.dart';
enum OrderType { pending, accepted, rejected }

class BookingHistoryDataModel{
  String? profile;
  String? userName;
  String? date;
  String? time;
  String? people;
  RxBool? isSetAlert = false.obs;


  BookingHistoryDataModel({
    this.profile,
    this.userName,
    this.time,
    this.date,
    this.people,
    this.isSetAlert,
  });

}