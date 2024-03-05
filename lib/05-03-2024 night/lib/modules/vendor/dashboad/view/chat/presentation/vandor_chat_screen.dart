import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/chat/controller/user_chat_data_controller.dart';
import 'package:local/modules/vendor/dashboad/view/chat/model/user_chat_data_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_textfeild.dart';

class VendorChatScreen extends StatelessWidget {
  VendorChatScreen({Key? key}) : super(key: key);

  ChatDataController _userChatDataController = Get.put(ChatDataController());
  RxBool textEnter = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.darkTheme,
        // appBar: AppBar(
        //   titleSpacing: -12,
        //   backgroundColor: AppColors.backGroundHome,
        //   leading: Row(
        //     children: [
        //       SvgPicture.asset(
        //         IconAsset.comment,
        //         height: 24.h,
        //         width: 24.w,
        //       ).marginOnly(left: 16.w),
        //     ],
        //   ),
        //   title: CommonText(text: AppString.chats, fontSize: 18.sp, fontWeight: FontWeight.w600),
        //   actions: [
        //     GestureDetector(
        //       onTap: ,
        //       child: Container(
        //           color: Colors.transparent,
        //           child: SvgPicture.asset(
        //             IconAsset.search,
        //             height: 26.h,
        //             width: 26.w,
        //           ).marginOnly(right: 16.w)),
        //     ),
        //   ],
        // ),
        appBar: AppBar(
          backgroundColor: AppColors.backGroundHome,
          automaticallyImplyLeading: true,
          title: Obx(
            () => _userChatDataController.isSearching.value
                ? CustomTextField(
                    prefix: GestureDetector(
                      onTap: () {
                        _userChatDataController.toggleSearch();
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(12.r),
                        child: Image.asset(
                          ImagesAsset.backarrow,
                          height: 5.h,
                          width: 5.w,
                        ),
                      ),
                    ),
                    controller: _userChatDataController.searchController,
                    hintText: 'Search...',
                    color: AppColors.whiteColor,
                    contentPadding: EdgeInsets.only(
                      left: 16.w,
                    ),
                    onChanged: (value) {
                      _userChatDataController.setSearchText(value);
                      if (value.isEmpty) {
                        textEnter.value = false;
                      } else {
                        textEnter.value = true;
                      }
                    },
                    suffix: Obx(
                      () => textEnter.value
                          ? GestureDetector(
                              onTap: () {
                                _userChatDataController.clearSearch();
                                textEnter.value = !textEnter.value;
                              },
                              child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.all(12.r),
                                child: Image.asset(
                                  ImagesAsset.cross,
                                  height: 5.h,
                                  width: 5.w,
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  )
                : Row(
                    children: [
                      SvgPicture.asset(
                        IconAsset.comment,
                        height: 24.h,
                        width: 24.w,
                      ).marginOnly(left: 16.w, right: 8.w),
                      CommonText(
                        text: AppString.chats,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: _userChatDataController.toggleSearch,
              child: Obx(
                () => Visibility(
                  visible: !_userChatDataController.isSearching.value,
                  child: Container(
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                      IconAsset.search,
                      height: 26.h,
                      width: 26.w,
                    ).marginOnly(right: 16.w),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _userChatDataController.chatUserlist.length,
          itemBuilder: (context, index) {
            return chatUsers(
                chatDataModel: _userChatDataController.chatUserlist[index],
                onTap: () {
                  Get.toNamed(Routes.chatView, arguments: _userChatDataController.chatUserlist[index]);
                });
          },
        ));
  }

  Widget chatUsers({
    required ChatDataModel chatDataModel,
    void Function()? onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 48.w,
                    width: 48.w,
                    child: Image.asset(
                      chatDataModel.profile ?? "",
                      height: 48.w,
                      width: 48.w,
                    )),
                10.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: chatDataModel.userName ?? "",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    CommonText(
                      text: chatDataModel.msg ?? "",
                      fontSize: 14.sp,
                      color: AppColors.middleGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: chatDataModel.time ?? "",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.middleGrey,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                  ],
                ),
              ],
            ).paddingOnly(top: 16.h, bottom: 12.h),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: AppColors.dividerColor2,
        )
      ],
    ).marginSymmetric(horizontal: 16.w);
  }
}
