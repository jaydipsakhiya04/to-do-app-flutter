import 'package:get/get.dart';

class QueryDataModel{
  String? profile;
  String? user;
  String? time;
  String? msg;
  RxList<String>? replyList = <String>[].obs;
  QueryDataModel({
    this.profile,
    this.user,
    this.time,
    this.msg,
    this.replyList ,

  });

}