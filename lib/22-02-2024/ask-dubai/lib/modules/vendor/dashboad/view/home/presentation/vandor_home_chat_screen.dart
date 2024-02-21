import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/home/controller/vandor_home_chat_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

class VandorHomeChatScreen extends StatelessWidget {
  VandorHomeChatScreen({Key? key}) : super(key: key);

  final HomeChatController _homeChatController = Get.find();
  final argument = Get.arguments;
  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leadingWidth: 38.w,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
        ).marginOnly(left: 16.w),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            argument.profile ?? "",
            width: 36.w,
            height: 36.h,
          ),
          title: CommonText(text: argument.user ?? "", fontSize: 16.sp, fontWeight: FontWeight.w500),
          subtitle: CommonText(
              text: argument.time ?? "", fontSize: 10.sp, color: AppColors.middleGrey, fontWeight: FontWeight.w400),
          trailing: Icon(Icons.more_vert_outlined, color: AppColors.titleDark),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _controller,
                      // reverse: true,
                      child: Obx(
                        ()=> Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonText(text: argument.msg ?? "", fontSize: 16.sp, fontWeight: FontWeight.w500)
                                .marginOnly(left: 16.w, right: 16.w),
                            20.h.verticalSpace,
                            if (argument.replyList.isNotEmpty)
                             ListView.builder(
                                  // padding: EdgeInsets.only(bottom: 100.h),
                                  shrinkWrap: true,
                                  itemCount: argument.replyList.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 7),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(width: 2.w, color: AppColors.backGroundHome3)
                                                .marginOnly(left: 25.w, right: 15.w),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    contentPadding: EdgeInsets.zero,
                                                    leading: Image.asset(
                                                      argument.profile ?? "",
                                                      height: 35.h,
                                                      width: 35.w,
                                                    ),
                                                    title: CommonText(
                                                        text: argument.user ?? "",
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500),
                                                    subtitle: CommonText(
                                                      text: argument.time ?? "",
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColors.middleGrey,
                                                    ),
                                                  ),
                                                  CommonText(
                                                    text: argument.replyList[index],
                                                    color: AppColors.lightGrey2,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ).paddingOnly(bottom: 15.h, right: 38.w),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: messageField(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget messageField() {
    final focusNode = FocusNode();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: AppColors.darkBg,
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(ImagesAsset.girlImage),
              12.w.horizontalSpace,
              Expanded(
                child: TextField(
                  focusNode: focusNode,
                  style: TextStyle(color: AppColors.white),
                  controller: _homeChatController.replyController.value,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 7.w),
                    border: InputBorder.none,
                    isDense: true,
                    hintText: AppString.typeMessage,
                    hintStyle: TextStyle(color: AppColors.middleGrey, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              20.w.horizontalSpace,
              CircleAvatar(
                backgroundColor: AppColors.darkBg2,
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  color: AppColors.white,
                  onPressed: () {
                    // argument = _homeChatController.replyController.value.text;
                    argument.replyList.add(_homeChatController.replyController.value.text);
                    _homeChatController.replyController.value.clear();
                    _homeChatController.querydataList.refresh();
                    _scrollDown();
                    // Get.back();
                  },
                ),
              ).marginOnly(right: 20.w)
            ],
          ),
        ),
      ).marginOnly(bottom: 20.h),
    );
  }
}
