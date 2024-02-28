import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/analystic_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/booking_history_data_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/booking_history_data_model.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';

class BookingHistoryScreen extends StatelessWidget {
  BookingHistoryScreen({Key? key}) : super(key: key);

  final AnalysticController _analysticController = Get.find();
  final BookingDataController _bookingDataController = Get.put(BookingDataController());
  RxBool isSetAlert=false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.backGroundHome3,
          ),
        ),
        titleSpacing: -12,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: CommonText(text: AppString.bookingHistory, fontSize: 18.sp, fontWeight: FontWeight.w600),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Obx(
            () => Column(
              children: [
                Divider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(
                      text: AppString.dateRange,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacer(),
                    if (_analysticController.startDate.value != null)
                      CommonText(
                        text:
                            "${_analysticController.startDate.value!.day}-${_analysticController.startDate.value!.month}-${_analysticController.startDate.value!.year}",
                        color: AppColors.purple,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    if (_analysticController.startDate.value != null && _analysticController.endDate.value != null)
                      CommonText(
                        text: "--",
                        color: AppColors.purple,
                      ).marginSymmetric(horizontal: 8.w),
                    if (_analysticController.endDate.value != null)
                      CommonText(
                        text:
                            "${_analysticController.endDate.value!.day}/${_analysticController.endDate.value!.month}/${_analysticController.endDate.value!.year}",
                        color: AppColors.purple,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ).marginOnly(right: 12.w),
                    GestureDetector(
                      onTap: () async {
                        final picked = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2025),
                          initialDateRange:
                              _analysticController.startDate.value != null && _analysticController.endDate.value != null
                                  ? DateTimeRange(
                                      start: _analysticController.startDate.value!,
                                      end: _analysticController.endDate.value!,
                                    )
                                  : null,
                        );

                        if (picked != null) {
                          _analysticController.selectDateRange(picked.start, picked.end);
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.purple,
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: 10.h, left: 16.w, right: 16.w),
              ],
            ),
          ),
        ),
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
                automaticIndicatorColorAdjustment: true,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: CommonText(
                      text: "Pending",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Tab(
                    child: CommonText(
                      text: "Accepted",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Tab(
                    child: CommonText(
                      text: "Rejected",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
                labelColor: AppColors.titleDark,
                unselectedLabelColor: AppColors.green,
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
                              dotImage: IconAsset.redDot, status: AppString.rejectedLower, statusColor: AppColors.red,
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

  Future<void> customBottomSheet({String? status, String? dotImage, Color? statusColor, bool buttonsVisible=false, bool rejectButton =false, bool alertButton=false, required BookingHistoryDataModel bookingHistoryDataModel}) {
    return Get.bottomSheet(
      isScrollControlled: true,
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: AppColors.darkTheme,
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
                        CommonText(
                          text: AppString.orderDetails,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ).marginOnly(bottom: 20.h),
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
                                    text: bookingHistoryDataModel.date??"",
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
                                    text: bookingHistoryDataModel.time??"",
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
                                    text: bookingHistoryDataModel.people??"",
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
                if(alertButton==true)
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
                    title: Obx(()=> CommonText(
                        text: isSetAlert.value ? AppString.setAlert : AppString.activeAlert,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    trailing: Obx(() => InkWell(
                      onTap: () {
                        isSetAlert.value = !isSetAlert.value;
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48.r),
                          color: isSetAlert.value? AppColors.green : AppColors.darkRed,
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
                              text: isSetAlert.value
                                  ? AppString.startAlert
                                  : AppString.stopAlert,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                ),
                if(buttonsVisible==true)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.purple),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 14.h),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.close,
                                  size: 20.sp,
                                  color: AppColors.purple,
                                ),
                                2.w.horizontalSpace,
                                CommonText(
                                  text: AppString.reject,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: AppColors.purple,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      12.w.horizontalSpace,
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.purple,
                              border: Border.all(color: AppColors.darkTheme),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 14.h),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColors.titleDark,
                                  size: 20.sp,
                                ),
                                2.w.horizontalSpace,
                                CommonText(
                                  text: AppString.accept,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).marginOnly(bottom: 16.h,top: 16.h),
                ),
                if(rejectButton==true)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.purple
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 14.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.close_rounded,
                                  size: 17.sp,
                                  color: AppColors.titleDark,

                                ),
                                5.w.horizontalSpace,
                                CommonText(
                                  text: AppString.reject,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: AppColors.titleDark,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).marginOnly(bottom: 16.h).marginOnly(bottom: 16.h,top: 4.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
