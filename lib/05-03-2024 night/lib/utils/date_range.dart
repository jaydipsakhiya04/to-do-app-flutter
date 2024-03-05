import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DateRange{



  static Future<void> selectDateRange(DateTime? start, DateTime? end,BuildContext context) async {
    Rx<DateTime?> startDate = Rx<DateTime?>(null);
    Rx<DateTime?> endDate = Rx<DateTime?>(null);
    startDate.value = start;
    endDate.value = end;

    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
      initialDateRange:
      startDate.value != null && endDate.value != null
          ? DateTimeRange(
        start: startDate.value!,
        end: endDate.value!,
      )
          : null,
    );
    if (picked != null) {
      selectDateRange(picked.start, picked.end,context);
    }
  }
}