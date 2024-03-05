import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/chat/model/user_chat_data_model.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';

class ChatDataController extends GetxController{

  final RxBool change=true.obs;
  RxList <ChatDataModel> chatUserlist =  <ChatDataModel>[
    ChatDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.userName,
      time: AppString.twoMinuteAgo,
      msg: AppString.chatMsg,
    ),
    ChatDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.userName,
      time: AppString.twoMinuteAgo,
      msg: AppString.chatMsg,
    ),
    ChatDataModel(
      profile: ImagesAsset.girlImage,
      userName: AppString.userName,
      time: AppString.twoMinuteAgo,
      msg: AppString.chatMsg,
    ),
  ].obs;
  TextEditingController  textEditingController=TextEditingController();

  RxList<ChatDataModel> messageList = <ChatDataModel>[
    ChatDataModel(msg: AppString.msg1, messageType: AppString.sender,),
    ChatDataModel(msg: AppString.msg2, messageType: AppString.sender, ),
    ChatDataModel(msg: AppString.msg3, messageType: AppString.receiver, ),
    ChatDataModel(msg: AppString.msg4, messageType: AppString.receiver, ),
    ChatDataModel(msg: AppString.msg5, messageType: AppString.sender, ),
    ChatDataModel(msg:AppString.msg6, messageType: AppString.sender,),
    ChatDataModel(msg: AppString.msg3, messageType: AppString.receiver, ),
    ChatDataModel(msg: AppString.msg4, messageType: AppString.receiver, ),

  ].obs;

  var isSearching = false.obs;
  TextEditingController searchController = TextEditingController();

  void toggleSearch() {
    isSearching.value = !isSearching.value;
    if (!isSearching.value) {
      searchController.clear();
    }
  }
  void setSearchText(String text) {
    searchController.text = text;
  }

  void clearSearch() {
    searchController.clear();
  }

}
