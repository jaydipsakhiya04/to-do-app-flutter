import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:get/get.dart';

class BatteryDetailController extends GetxController {

  List<String> imagesList = [
    ImageAsset.calendar,
    ImageAsset.flash,
    ImageAsset.capacity,
    ImageAsset.cycleTime,
    ImageAsset.hVoltage,
    ImageAsset.downVoltage,
    ImageAsset.speedMeter,
  ];


List<String> titleList = [
    AppString.dateOfManufacturing,
    AppString.designVoltage,
    AppString.realCapacity,
    AppString.cycleTime,
    AppString.hVoltage,
    AppString.lVoltage,
    AppString.dv,

  ];

  List<String> amountList = [
   "2.4.2024",
   "14400mV",
   "10000mAh",
   "0",
   "3.281V",
   "3.561V",
   "0.007V",
  ];

  List chargeList = ['SOCC','OTC','UTC','COV','FC','CHG'];
  List alarmChargeList = ['OCC1','OTC','UTC1','DP','FC'];
  List dischargeStateList = ['SOCD','OTC','UTD','CUV','FD','ASCD','DSG'];
  List dischargeAlarmList = ['OCD1','OTD1','UTD1','DP','RTA','RCA','CUV','FD'];



  var chargeIndex = RxInt(-1);
  void setSelectedChargeIndex(int index) {
    chargeIndex.value = index;
  }

  var chargingAlarmIndex = RxInt(-1);
  void setSelectedChargingAlarmIndex(int index) {
    chargingAlarmIndex.value = index;
  }

  var dischargeIndex = RxInt(-1);
  void setSelectedDischargeIndex(int index) {
    dischargeIndex.value = index;
  }

  var dischargingAlarmIndex = RxInt(-1);
  void setSelectedDischargingAlarmIndex(int index) {
    dischargingAlarmIndex.value = index;
  }

  List cellsList = ['Cell 1','Cell 2','Cell 3','Cell 4'];
  List cellsVoltageList = ['3561mV','3568mV','3567mV','3561mV'];
}
