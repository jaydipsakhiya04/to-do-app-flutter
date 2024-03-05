
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/booking_history_data_model.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/booking%20history/controller/booking_history_data_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/custom_textfield.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/app_bar_widget.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class BookingHistoryScreen extends StatelessWidget {
  BookingHistoryScreen({Key? key}) : super(key: key);

  final BookingDataController _bookingDataController = Get.put(BookingDataController());
  RxBool isSetAlert = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: const AppBarwidget(
        title: AppString.bookingHistory,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            22.h.verticalSpace,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: AppColors.darkBackGroundHome,
              ),
              child: TabBar(
                indicatorPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 4.w),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.purple,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: false,
                labelColor: AppColors.whiteColor,
                // unselectedLabelStyle: TextStyle(color: AppColors.redColor),
                automaticIndicatorColorAdjustment: true,
                dividerColor: Colors.transparent,
                labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                unselectedLabelColor: AppColors.bodyDark,
                tabs: const [
                  Tab(
                    text: AppString.pendingLowerCase,
                  ),
                  Tab(
                    text: AppString.acceptedLower,
                  ),
                  Tab(
                    text: AppString.rejectedLower,
                  ),
                ],
              ),
            ),
            20.h.verticalSpace,
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: _bookingDataController.bookingData.length,
                    itemBuilder: (context, index) {
                      return bookingData(
                        bookingHistoryDataModel: _bookingDataController.bookingData[index],
                        onTap: () {
                          customBottomSheet(
                            bookingHistoryDataModel: _bookingDataController.bookingData[index],
                            buttonsVisible: true,
                            dotImage: IconAsset.greenDot,
                            statusColor: AppColors.lightGreen,
                            status: AppString.pendingLowerCase,
                          );
                        },
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: _bookingDataController.bookingData.length,
                    itemBuilder: (context, index) {
                      return bookingData(
                        bookingHistoryDataModel: _bookingDataController.bookingData[index],
                        onTap: () {
                          customBottomSheet(
                            bookingHistoryDataModel: _bookingDataController.bookingData[index],
                            alertButton: true,
                            dotImage: IconAsset.yellowDot,
                            status: AppString.acceptedLower,
                            statusColor: AppColors.yellow,
                            rejectButton: true,
                          );
                        },
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: _bookingDataController.bookingData.length,
                    itemBuilder: (context, index) {
                      return bookingData(
                        bookingHistoryDataModel: _bookingDataController.bookingData[index],
                        onTap: () {
                          customBottomSheet(
                            bookingHistoryDataModel: _bookingDataController.bookingData[index],
                            dotImage: IconAsset.redDot,
                            status: AppString.rejectedLower,
                            statusColor: AppColors.red,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookingData({void Function()? onTap, required BookingHistoryDataModel bookingHistoryDataModel}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(
                bookingHistoryDataModel.profile ?? "",
                height: 35.h,
                width: 35.w,
              ),
              title: CommonText(
                  text: bookingHistoryDataModel.userName ?? "", fontSize: 16.sp, fontWeight: FontWeight.w500),
              subtitle: CommonText(
                text: bookingHistoryDataModel.people ?? "",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.middleGrey,
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: bookingHistoryDataModel.time ?? "",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.middleGrey,
                  ),
                  CommonText(
                    text: bookingHistoryDataModel.date ?? "",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.middleGrey,
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          height: 3.h,
          color: AppColors.backGroundHome3,
          thickness: 1,
        ),
      ],
    ).marginSymmetric(horizontal: 16.w);
  }

  Future<void> customBottomSheet(
      {String? status,
      String? dotImage,
      Color? statusColor,
      bool buttonsVisible = false,
      bool rejectButton = false,
      bool alertButton = false,
      required BookingHistoryDataModel bookingHistoryDataModel}) {
    return Get.bottomSheet(
      isScrollControlled: true,
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkTheme,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.titleDark,
                          ),
                          width: double.infinity,
                        ).marginSymmetric(horizontal: 130.w).marginSymmetric(vertical: 20.h),
                        if (rejectButton == false)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonText(
                              text: AppString.orderDetails,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ).marginOnly(bottom: 20.h,),
                        if (rejectButton == true)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CommonText(
                                textAlign: TextAlign.right,
                                text: AppString.orderDetails,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ).paddingOnly(right: 80.w),
                            ),
                            // const Spacer(),
                              PopupMenuButton<String>(
                                icon:SvgPicture.asset(
                                  IconAsset.verticalMore,
                                  height: 22.w,
                                  width: 24.w,
                                ).paddingOnly(right: 16.w),
                                onSelected: (String value) {
                                  if (value == 'Report') {
                                    Get.bottomSheet(
                                      isScrollControlled: true,
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.darkTheme,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15.r),
                                                  topRight: Radius.circular(15.r),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(20.r),
                                                        topRight: Radius.circular(20.r),
                                                      ),
                                                    ),
                                                    width: double.infinity,
                                                    child: Center(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              CommonText(
                                                                text: AppString.reportUser,
                                                                fontSize: 18.sp,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                              const Spacer(),
                                                              80.w.horizontalSpace,
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child: Container(
                                                                  padding: EdgeInsets.all(5.r),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(120.r),
                                                                    color: AppColors.lightBg,
                                                                  ),
                                                                  child: Image.asset(
                                                                    ImagesAsset.cross,
                                                                    height: 20.w,
                                                                    width: 20.w,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ).marginOnly(bottom: 20.h, top: 20.h, left: 16.w, right: 16.w),
                                                          Divider(
                                                            height: 1,
                                                            color: AppColors.lightBg,
                                                            thickness: 1,
                                                          ),
                                                          Column(
                                                            children: [
                                                              CommonTextField(
                                                                hintText: "Select Reason",
                                                                textColor: AppColors.bodyDark,
                                                                label: "",
                                                                suffix: IconButton(
                                                                  icon: Icon(Icons.arrow_drop_down,color: AppColors.bodyDark,),
                                                                  onPressed: () {
                                                                    _bookingDataController.openDropdown();
                                                                  },

                                                                ),
                                                                onTap: () {},
                                                              ),
                                                              CommonTextField(
                                                                minLines: 4,
                                                                maxLines: null,
                                                                keyboardType: TextInputType.multiline,
                                                                hintText: "Add your comments..",
                                                                textColor: AppColors.bodyDark,
                                                                label: "Describe the issue",
                                                                suffix: SizedBox(),
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(4.r),
                                                                  color: AppColors.darkBackGroundHome,
                                                                ),
                                                                child:  RichText(
                                                                  text: TextSpan(
                                                                    text: "Note:",
                                                                    style: TextStyle(
                                                                        color: AppColors.red,
                                                                        fontSize: 14.sp,
                                                                        fontWeight: FontWeight.w400
                                                                    ),
                                                                    children: [
                                                                      TextSpan(
                                                                        text: AppString.reportMsg,
                                                                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp, color: AppColors.bodyDark),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ).paddingAll(16.r),
                                                              ),
                                                              24.h.verticalSpace,
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: CustomButton(
                                                                      borderRadius: BorderRadius.circular(10.r),
                                                                      width: 165.w,
                                                                      height: 50.h,
                                                                      buttonBorderColor: AppColors.primaryDefaultColor,
                                                                      buttonColor: AppColors.primaryDefaultColor,
                                                                      textColor: AppColors.whiteColor,
                                                                      text: AppString.submit,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ).paddingOnly(left: 16.w, right: 16.w, bottom: 20.h),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else if (value == 'Cancel') {
                                    
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return <PopupMenuEntry<String>>[
                                    const PopupMenuItem<String>(
                                      value: "Report",
                                      child: Text('Report'),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'Cancel',
                                      child: Text('Cancel'),
                                    ),
                                  ];
                                },
                              ),
                          ],
                        ).marginOnly(bottom: 20.h,),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.darkBackGroundHome,
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          ImagesAsset.girlImage,
                          height: 50.h,
                          width: 50.h,
                        ),
                        CommonText(
                          text: AppString.carolyn,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                          margin: EdgeInsets.only(
                            top: 8.h,
                            bottom: 16.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.lightBg,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                dotImage ?? "",
                              ),
                              CommonText(
                                      text: status ?? "",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: statusColor)
                                  .marginOnly(right: 8.w, left: 2.w),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.r),
                          margin: EdgeInsets.only(top: 8.h, bottom: 16.h, left: 16.w, right: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.darkTheme,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: AppString.dateLower,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: AppColors.bodyDark,
                                  ),
                                  CommonText(
                                    text: bookingHistoryDataModel.date ?? "",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ],
                              ).marginOnly(bottom: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: AppString.timeLower,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: AppColors.bodyDark,
                                  ),
                                  CommonText(
                                    text: bookingHistoryDataModel.time ?? "",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ],
                              ).marginOnly(bottom: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: AppString.peopleLower,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: AppColors.bodyDark,
                                  ),
                                  CommonText(
                                    text: bookingHistoryDataModel.people ?? "",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ],
                              ).marginOnly(bottom: 8.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (alertButton == true)
                  Container(
                    padding: EdgeInsets.all(12.r),
                    margin: EdgeInsets.only(top: 20.h, bottom: 16.h, left: 16.w, right: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.darkBackGroundHome,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        color: AppColors.darkTheme,
                        padding: EdgeInsets.all(12.r),
                        child: Image.asset(ImagesAsset.yellowbell),
                      ),
                      title: Obx(
                        () => CommonText(
                          text: isSetAlert.value ? AppString.setAlert : AppString.activeAlert,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      trailing: Obx(
                        () => InkWell(
                          onTap: () {
                            isSetAlert.value = !isSetAlert.value;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48.r),
                              color: isSetAlert.value ? AppColors.green : AppColors.darkRed,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  isSetAlert.value ? ImagesAsset.play : ImagesAsset.stop,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                3.w.horizontalSpace,
                                CommonText(
                                  text: isSetAlert.value ? AppString.startAlert : AppString.stopAlert,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (buttonsVisible == true)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomButton(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10.r),
                          width: 165.w,
                          height: 50.h,
                          buttonBorderColor: AppColors.primaryDefaultColor,
                          buttonColor: Colors.transparent,
                          svgColor: AppColors.primaryDefaultColor,
                          textColor: AppColors.primaryDefaultColor,
                          svg: ImagesAsset.cross,
                          text: "Reject",
                        ),
                        12.w.horizontalSpace,
                        CustomButton(
                          onTap: () {},
                          width: 165.w,
                          height: 50.h,
                          svg: ImagesAsset.donecheck,
                          text: "Accept",
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ],
                    ),
                  ),
                if (rejectButton == true)
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(10.r),
                          width: 165.w,
                          height: 50.h,
                          buttonBorderColor: AppColors.primaryDefaultColor,
                          buttonColor: AppColors.primaryDefaultColor,
                          svgColor: AppColors.whiteColor,
                          textColor: AppColors.whiteColor,
                          svg: ImagesAsset.cross,
                          text: "Reject",
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 16.w, right: 16.w, top: 4.h, bottom: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
