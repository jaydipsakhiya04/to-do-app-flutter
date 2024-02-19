import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/widget/common_text.dart';

import '../../../../../utils/assets.dart';
import '../home/model/query_data_model.dart';

class HomeChatController extends GetxController {
  Rx<TextEditingController> replyController = TextEditingController().obs;

  RxList<QueryDataModel> querydataList = <QueryDataModel>[
    QueryDataModel(
        user: 'Caryone K. Desker 1',
        reply: 'jskdghksdhbkshdbkshdkbhsgk',
        profile: ImagesAsset.girlImage,
        msg:
            'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
        time: '1 month ago'),
    QueryDataModel(
        user: 'Caryone K. Desker 2',
        profile: ImagesAsset.girlImage,
        msg:
            'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
        time: '1 month ago'),
    QueryDataModel(
        user: 'Caryone K. Desker 3',
        profile: ImagesAsset.girlImage,
        msg:
            'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
        time: '1 month ago'),
    QueryDataModel(
        user: 'Caryone K. Desker 4',
        profile: ImagesAsset.girlImage,
        msg:
            'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
        time: '1 month ago'),
  ].obs;
}
