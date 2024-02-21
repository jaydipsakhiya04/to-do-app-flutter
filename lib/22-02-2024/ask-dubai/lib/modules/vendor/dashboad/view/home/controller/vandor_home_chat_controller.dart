import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/home/model/query_data_model.dart';

import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';



class HomeChatController extends GetxController {
 Rx<TextEditingController> replyController = TextEditingController().obs;

 RxList<QueryDataModel> querydataList = <QueryDataModel>[
  QueryDataModel(
   user: AppString.carolyn,
   profile: ImagesAsset.girlImage,
   msg:AppString.queryFirst,
   time: AppString.aMonthAgo,
   replyList: <String>[].obs,
  ),
  QueryDataModel(
   user: AppString.carolyn,
   profile: ImagesAsset.girlImage,
   msg:AppString.querySecond,
   time: AppString.aMonthAgo,
   replyList: <String>[].obs,

  ),
  QueryDataModel(
   user: AppString.carolyn,
   profile: ImagesAsset.girlImage,
   msg:AppString.queryThird,
   time: AppString.aMonthAgo,
   replyList: <String>[].obs,

  ),
  QueryDataModel(
   user: AppString.carolyn,
   profile: ImagesAsset.girlImage,
   msg:AppString.queryFirst,
   time: AppString.aMonthAgo,
   replyList: <String>[].obs,
  ),
  QueryDataModel(
   user: AppString.carolyn,
   profile: ImagesAsset.girlImage,
   msg:AppString.querySecond,
   time: AppString.aMonthAgo,
   replyList: <String>[].obs,

  ),
  QueryDataModel(
   user: AppString.carolyn,
   profile: ImagesAsset.girlImage,
   msg:AppString.queryThird,
   time: AppString.aMonthAgo,
   replyList: <String>[].obs,

  ),

 ].obs;
}