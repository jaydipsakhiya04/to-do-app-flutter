import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/analystic_data_model.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';


class AnalysticController extends GetxController{
  
  RxList<AnalysticDataModel> analysticData=<AnalysticDataModel>[
    AnalysticDataModel(title: AppString.totalProfit, image: IconAsset.profit, amount: AppString.amount),
    AnalysticDataModel(title: AppString.totalOrders, image: IconAsset.orders, amount: AppString.amount),
    AnalysticDataModel(title: AppString.totalCalls, image: IconAsset.calls, amount: AppString.amount),
    AnalysticDataModel(title: AppString.totalMessages, image: IconAsset.messages, amount: AppString.amount),
    AnalysticDataModel(title: AppString.totalBookings, image: IconAsset.bookings, amount: AppString.amount),
    AnalysticDataModel(title: AppString.totalDirections, image: IconAsset.directions, amount: AppString.amount),
    AnalysticDataModel(title: AppString.totalWebsiteClicks, image: IconAsset.website, amount: AppString.amount),
  ].obs;



  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  Future<void> selectDateRange(DateTime? start, DateTime? end) async {
    startDate.value = start;
    endDate.value = end;

    // final picked = await showDateRangePicker(
    //   context: context,
    //   firstDate: DateTime(2022),
    //   lastDate: DateTime(2025),
    //   initialDateRange:
    //   startDate.value != null && endDate.value != null
    //       ? DateTimeRange(
    //     start: startDate.value!,
    //     end: endDate.value!,)
    //       : null,
    // );
    //
    // if (picked != null) {
    //   selectDateRange(picked.start, picked.end,context);
    // }
  }
}