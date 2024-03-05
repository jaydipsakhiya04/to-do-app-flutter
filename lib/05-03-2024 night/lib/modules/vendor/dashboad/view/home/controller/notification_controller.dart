import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/home/model/notificationDataModel.dart';
import 'package:local/utils/app_string.dart';


class NotificationController extends GetxController{

  RxList<NotificationDataModel> todayNotification = <NotificationDataModel>[
    NotificationDataModel(time: AppString.oneHour, msg: AppString.queryFirst,name: AppString.restaurantsName),
    NotificationDataModel(time: AppString.oneHour, msg: AppString.secondNotification,name: AppString.restaurantsName),
    NotificationDataModel(time: AppString.oneHour, msg: AppString.secondNotification,name: AppString.restaurantsName),
  ].obs;

  RxList<NotificationDataModel> yesterDayNotifications = <NotificationDataModel>[
    NotificationDataModel(time: AppString.oneHour, msg: AppString.queryFirst,name: AppString.restaurantsName),
    NotificationDataModel(time: AppString.oneHour, msg: AppString.queryFirst,name: AppString.restaurantsName),
    NotificationDataModel(time: AppString.oneHour, msg: AppString.queryFirst,name: AppString.restaurantsName),
  ].obs;

}