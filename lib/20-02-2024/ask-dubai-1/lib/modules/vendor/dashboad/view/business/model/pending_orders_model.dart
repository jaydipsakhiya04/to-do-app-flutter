import 'package:get/get.dart';

class PendingOrdersDataModel{
  String? profile;
  String? userName;
  String? date;
  String? time;
  String? people;
  RxBool isSetAlert = false.obs;

  PendingOrdersDataModel({
    this.profile,
    this.userName,
    this.time,
    this.date,
    this.people,
      required this.isSetAlert,
  });

}