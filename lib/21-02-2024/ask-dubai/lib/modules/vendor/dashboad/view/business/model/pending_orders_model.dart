import 'package:get/get.dart';
enum OrderType { pending, accepted, rejected }

class PendingOrdersDataModel{
  String? profile;
  String? userName;
  String? date;
  String? time;
  String? people;
  RxBool isSetAlert = false.obs;
  OrderType? orderType;

  PendingOrdersDataModel({
    this.profile,
    this.userName,
    this.time,
    this.date,
    this.people,
      required this.isSetAlert,
    this.orderType,
  });

}