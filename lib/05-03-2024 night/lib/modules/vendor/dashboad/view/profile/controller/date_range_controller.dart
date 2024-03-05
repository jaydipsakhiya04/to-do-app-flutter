import 'package:get/get.dart';

class DateRangeController extends GetxController {
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  Future<void> selectDateRange(DateTime? start, DateTime? end) async {
    startDate.value = start;
    endDate.value = end;
  }
}

final dateRangeController = Get.put(DateRangeController());
