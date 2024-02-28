import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:local/modules/vendor/dashboad/view/chat/controller/user_chat_data_controller.dart';
import 'package:local/modules/vendor/dashboad/view/chat/model/user_chat_data_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

import '../../../../../../utils/app_string.dart';

class ChatViewScreen extends StatelessWidget {
   ChatViewScreen({Key? key}) : super(key: key);

   final ChatDataController _chatDataController =Get.put(ChatDataController());


  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 12.h,top: 5.h),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(8.r),
      //     color: AppColors.darkBackGroundHome,
      //     border: Border.all(color: AppColors.backGroundHome4),
      //   ),
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Expanded(
      //         child: TextField(
      //           onChanged: (val){
      //             if(val.isEmpty){
      //               change.value=true;
      //             }else{
      //               change.value=false;
      //             }
      //           },
      //           style: TextStyle(color: AppColors.white),
      //           controller: _chatDataController.textEditingController,
      //           decoration: InputDecoration(
      //             contentPadding: EdgeInsets.only(left: 13.w,top: 19.h,bottom: 19.h),
      //             border: InputBorder.none,
      //             isDense: true,
      //             hintText: AppString.typeMessage,
      //             hintStyle: TextStyle(
      //                 color: AppColors.lightGrey2,
      //                 fontSize: 14.sp,
      //                 fontWeight: FontWeight.w500),
      //           ),
      //         ),
      //       ),
      //      Obx(()=> change.value? SvgPicture.asset(IconAsset.attachFile):SizedBox()),
      //      Obx(() => change.value? Container(
      //        width: 1,
      //        color: AppColors.purpleGrey,
      //        height: 30.h,
      //      ).marginSymmetric(horizontal: 12.w):const SizedBox(),),
      //       Obx(() => CircleAvatar(
      //         radius: 24.r,
      //         backgroundColor: AppColors.darkBg2,
      //         child: change.value?
      //         SvgPicture.asset(IconAsset.mic,height: 24.h,width: 24.w)
      //             : SvgPicture.asset(IconAsset.send,height: 24.h,width: 24.w),
      //       ).marginOnly(right: 10.w),)
      //     ],
      //   ),
      // ).marginOnly(bottom: 20.h),
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        leadingWidth: 38.w,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.titleDark),
        ).marginOnly(left: 16.w),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(argument.profile ?? "", width: 36.w, height: 36.h,),
          title: CommonText(text: argument.userName ?? "", fontSize: 16.sp, fontWeight: FontWeight.w500),
          subtitle: CommonText(text: "online", fontSize: 10.sp, color: AppColors.middleGrey, fontWeight: FontWeight.w400),
          trailing: Icon(Icons.more_vert_outlined, color: AppColors.titleDark),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(text: AppString.today,fontWeight: FontWeight.w600,fontSize: 12.sp),
                    ],
                  ),
                  chatList(),
                ],
              ).paddingAll(16.r),
            ),
          ),
          buildMessageTextField(),
        ],
      ),
    );
  }



  Widget chatContainer(ChatDataModel chatDataModel,bool show) {
    return Column(
      crossAxisAlignment: chatDataModel.messageType == AppString.receiver ?CrossAxisAlignment.end:CrossAxisAlignment.start,
      children: [
        if(show)
          CommonText(
            text: chatDataModel.messageType == AppString.receiver ?
            AppString.me :
            AppString.resturantnameUpper,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.lightPurple,
          ),
        6.h.verticalSpace,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: chatDataModel.messageType == AppString.receiver ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 0.6.sw,
                maxHeight: double.infinity,
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
              margin: chatDataModel.messageType == AppString.receiver
                  ? EdgeInsets.only(left: 25.w)
                  : EdgeInsets.only(right: 25.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: (chatDataModel.messageType == AppString.receiver ? AppColors.purple : AppColors.darkBackGroundHome),
              ),
              child: Text(
                chatDataModel.msg??"",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: chatDataModel.messageType == AppString.receiver ? AppColors.titleDark : AppColors.bodyDark),
              ),
            ),
          ],
        ),
      ],
    );
  }

   Widget chatList() {
     return ListView.builder(
       shrinkWrap: true,
       physics: NeverScrollableScrollPhysics(),
       padding: EdgeInsets.only(bottom: 5.h.h,top: 16.h),
       itemCount: _chatDataController.messageList.length,
       itemBuilder: (context, index) {
         RxBool show=true.obs;
         if(index!=0){
           show.value=_chatDataController.messageList[index].messageType!=_chatDataController.messageList[index-1].messageType;
         }

         return GestureDetector(
           child:
               chatContainer(_chatDataController.messageList[index],show.value),
         );
       },
     );
   }

   Widget buildMessageTextField() {
     final focusNode = FocusNode();
     return Align(
       alignment: Alignment.bottomCenter,
       child: Container(
         margin: EdgeInsets.only(left: 16.w,right: 16.w,top: 5.h),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8.r),
           color: AppColors.darkBackGroundHome,
           border: Border.all(color: AppColors.backGroundHome4),
         ),
         child: Row(
           mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Expanded(
               child: TextField(
                 focusNode: focusNode,
                 onChanged: (val){
                   if(val.isEmpty){
                     _chatDataController.change.value=true;
                   }else{
                     _chatDataController.change.value=false;
                   }
                 },
                 style: TextStyle(color: AppColors.titleDark),
                 controller: _chatDataController.textEditingController,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(left: 13.w,top: 19.h,bottom: 19.h),
                   border: InputBorder.none,
                   isDense: true,
                   hintText: AppString.typeMessage,
                   hintStyle: TextStyle(
                       color: AppColors.bodyDark,
                       fontSize: 14.sp,
                       fontWeight: FontWeight.w500),
                 ),
               ),
             ),
             Obx(()=> _chatDataController.change.value? SvgPicture.asset(IconAsset.attachFile):SizedBox()),
             Obx(() => _chatDataController.change.value? Container(
               width: 1,
               color: AppColors.purpleGrey,
               height: 30.h,
             ).marginSymmetric(horizontal: 12.w):const SizedBox(),),
             Obx(() => CircleAvatar(
               radius: 24.r,
               backgroundColor: AppColors.darkBg2,
               child: _chatDataController.change.value?
               SvgPicture.asset(IconAsset.mic,height: 24.h,width: 24.w)
                   : SvgPicture.asset(IconAsset.send,height: 24.h,width: 24.w),
             ).marginOnly(right: 10.w),)
           ],
         ),
       ).marginOnly(bottom: 20.h),
     );
   }
}
