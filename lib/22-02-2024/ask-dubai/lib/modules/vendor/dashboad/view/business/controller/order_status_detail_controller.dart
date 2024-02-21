import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';

import '../model/order_status_detail_model.dart';


class OrderStatusDetailController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;

  RxList<OrderStatusDataModel> pendingOrders = <OrderStatusDataModel>[].obs;
  RxList<OrderStatusDataModel> acceptedOrders = <OrderStatusDataModel>[].obs;
  RxList<OrderStatusDataModel> rejectedOrders = <OrderStatusDataModel>[].obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    pendingOrders.add(
      OrderStatusDataModel(
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
      OrderStatusDataModel(
        profile: ImagesAsset.girlImage,
        userName: AppString.carolyn,
        time: AppString.orderTime,
        date: AppString.orderDate,
        people: AppString.orderpeople,
        orderType: OrderType.pending,
        isSetAlert: true.obs,
      ),
    );
    pendingOrders.add(
      OrderStatusDataModel(
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