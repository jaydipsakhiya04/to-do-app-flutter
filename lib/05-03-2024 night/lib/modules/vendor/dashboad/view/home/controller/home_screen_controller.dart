import 'package:get/get.dart';
import 'package:local/utils/app_string.dart';

class HomeScreenController extends GetxController{
  RxInt index=0.obs;
  RxList<String> orderTimeList=[
    AppString.todaysRevenue,
    AppString.weekSoFar,
    AppString.yesterDay,
  ].obs;
  RxList orderPriceList=[
    AppString.firstOrderPrice,
    AppString.secondOrderPrice,
    AppString.secondOrderPrice,

  ].obs;

  RxList orderQuantityList=[
    AppString.twentyOneOrder,
    AppString.seventyorder,
    AppString.seventyorder,

  ].obs;

  RxList queryMsgList=[
    AppString.queryFirst,
    AppString.querySecond,
    AppString.queryThird,
    AppString.queryFirst,
    AppString.querySecond,
    AppString.queryThird,
  ].obs;




}