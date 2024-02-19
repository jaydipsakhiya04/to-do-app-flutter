import 'package:get/get.dart';
import 'package:local/utils/app_string.dart';

import '../home/model/notificationDataModel.dart';

class NotificationController extends GetxController{

  RxList<NotificationDataModel> notificationList = <NotificationDataModel>[
    NotificationDataModel(time: "1h", msg: AppString.queryFirst,name: "Restaruants Name 1"),
    NotificationDataModel(time: "1h", msg: AppString.secondNotification,name: "Restaruants Name 2"),
    NotificationDataModel(time: "1h", msg: AppString.secondNotification,name: "Restaruants Name 3"),
  ].obs;


  RxList todayNotification=[
    AppString.queryFirst,
    AppString.secondNotification,
    AppString.secondNotification,

  ].obs;
}