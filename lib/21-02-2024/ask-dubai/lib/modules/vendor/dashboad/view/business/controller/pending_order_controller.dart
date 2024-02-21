import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/business/model/pending_orders_model.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';


class PendingOrderController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;


  // RxBool isSetAlert = true.obs;

  RxList<PendingOrdersDataModel> pendingOrders = <PendingOrdersDataModel>[].obs;
  RxList<PendingOrdersDataModel> acceptedOrders = <PendingOrdersDataModel>[].obs;
  RxList<PendingOrdersDataModel> rejectedOrders = <PendingOrdersDataModel>[].obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    pendingOrders.add(
      PendingOrdersDataModel(
        profile: ImagesAsset.girlImage,
        userName: "AppString.carolyn",
        time: AppString.orderTime,
        date: AppString.orderDate,
        people: AppString.orderpeople,
        isSetAlert: true.obs,
        orderType: OrderType.pending,
      ),
    );
    pendingOrders.add(
      PendingOrdersDataModel(
        profile: ImagesAsset.girlImage,
        userName: "carolyn 1",
        time: AppString.orderTime,
        date: AppString.orderDate,
        people: AppString.orderpeople,
        orderType: OrderType.pending,
        isSetAlert: true.obs,
      ),
    );
    pendingOrders.add(
      PendingOrdersDataModel(
        profile: ImagesAsset.girlImage,
        userName: "carolyn 2",
        time: AppString.orderTime,
        date: AppString.orderDate,
        people: AppString.orderpeople,
        orderType: OrderType.pending,
        isSetAlert: true.obs,
      ),
    );
    pendingOrders.add(
      PendingOrdersDataModel(
        profile: ImagesAsset.girlImage,
        userName: "carolyn 3",
        time: AppString.orderTime,
        date: AppString.orderDate,
        people: AppString.orderpeople,
        isSetAlert: true.obs,
        orderType: OrderType.pending,
      ),
    );
    pendingOrders.add(
      PendingOrdersDataModel(
        profile: ImagesAsset.girlImage,
        userName: "carolyn 4",
        time: AppString.orderTime,
        date: AppString.orderDate,
        people: AppString.orderpeople,
        isSetAlert: true.obs,
        orderType: OrderType.pending,
      ),
    );
    pendingOrders.add(
      PendingOrdersDataModel(
        profile: ImagesAsset.girlImage,
        userName: AppString.carolyn,
        time: AppString.orderTime,
        date: AppString.orderDate,
        people: AppString.orderpeople,
        isSetAlert: true.obs,
        orderType: OrderType.pending,
      ),
    );
    pendingOrders.add(
      PendingOrdersDataModel(
        profile: ImagesAsset.girlImage,
        userName: AppString.carolyn,
        time: AppString.orderTime,
        date: AppString.orderDate,
        people: AppString.orderpeople,
        isSetAlert: true.obs,
        orderType: OrderType.pending,
      ),
    );
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    tabIndex.refresh();
  }
//
// RxList<PendingOrdersDataModel> pendingOrders=<PendingOrdersDataModel>[
//
//
// ].obs;
}
