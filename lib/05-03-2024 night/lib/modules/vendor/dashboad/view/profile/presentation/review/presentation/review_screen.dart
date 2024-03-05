import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/analytics/controller/analystic_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/widget/custom_rating_bar.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/app_bar_widget.dart';
import 'package:local/widget/common_text.dart';
import 'package:readmore/readmore.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({Key? key}) : super(key: key);
  final AnalysticController _analysticController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      // appBar: AppBar(
      //   leadingWidth: 4.w,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       color: AppColors.backGroundHome3,
      //     ),
      //   ),
      //   // titleSpacing: -6,
      //   backgroundColor: AppColors.darkBackGroundHome,
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios_new,
      //       color: AppColors.whiteColor,
      //       size: 19.sp,
      //     ),
      //   ),
      //   title: CommonText(
      //     text: AppString.review,
      //     fontSize: 16.sp,
      //     fontWeight: FontWeight.w400,
      //   ).paddingOnly(left: 12.w),
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(30),
      //     child: Obx(
      //       () => Column(
      //         children: [
      //           Divider(
      //             thickness: 2,
      //             color: AppColors.dividerColor,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               CommonText(
      //                 text: AppString.dateRange,
      //                 fontSize: 12.sp,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //               const Spacer(),
      //               if (_analysticController.startDate.value != null)
      //                 CommonText(
      //                   text:
      //                       "${_analysticController.startDate.value!.day}-${_analysticController.startDate.value!.month}-${_analysticController.startDate.value!.year}",
      //                   color: AppColors.purple,
      //                   fontWeight: FontWeight.w600,
      //                   fontSize: 12.sp,
      //                 ),
      //               if (_analysticController.startDate.value != null && _analysticController.endDate.value != null)
      //                 CommonText(
      //                   text: "--",
      //                   color: AppColors.purple,
      //                 ).marginSymmetric(horizontal: 8.w),
      //               if (_analysticController.endDate.value != null)
      //                 CommonText(
      //                   text:
      //                       "${_analysticController.endDate.value!.day}-${_analysticController.endDate.value!.month}-${_analysticController.endDate.value!.year}",
      //                   color: AppColors.purple,
      //                   fontWeight: FontWeight.w600,
      //                   fontSize: 12.sp,
      //                 ).marginOnly(right: 12.w),
      //               GestureDetector(
      //                 onTap: () async {
      //                   final picked = await showDateRangePicker(
      //                     context: context,
      //                     firstDate: DateTime(2022),
      //                     lastDate: DateTime(2025),
      //                     initialDateRange:
      //                         _analysticController.startDate.value != null && _analysticController.endDate.value != null
      //                             ? DateTimeRange(
      //                                 start: _analysticController.startDate.value!,
      //                                 end: _analysticController.endDate.value!,
      //                               )
      //                             : null,
      //                   );
      //
      //                   if (picked != null) {
      //                     _analysticController.selectDateRange(picked.start, picked.end);
      //                   }
      //                 },
      //                 child: Container(
      //                   color: Colors.transparent,
      //                   child: Image.asset(
      //                     ImagesAsset.calendar,
      //                     height: 22.h,
      //                     width: 22.h,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ).paddingOnly(bottom: 10.h, left: 16.w, right: 16.w),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBarwidget(title: AppString.review,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ratingLinesPortion(),
            Divider(
              height: 0.h,
              thickness: 2,
              color: AppColors.backGroundHome4,
            ),
            Column(
              children: [
                userRatingChatCard(),
                5.h.verticalSpace,
                replyCard(),
                Divider(
                  color: AppColors.backGroundHome4,
                  thickness: 1,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.backGroundHome4,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return  userRatingChatCard();
                  },
                )
              ],
            ).paddingAll(16.r),
          ],
        ),
      ),
    );
  }

  Widget ratingLinesPortion() {
    return Container(
      color: AppColors.appColor,
      padding: EdgeInsets.fromLTRB(16.h, 16.w, 16.h, 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Customers review summary",
            style: TextStyle(color: AppColors.titleDark, fontSize: 16.sp),
          ),
          SizedBox(height: 6.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.w),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("5", style: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp)),
                      Container(
                          height: 8.w,
                          width: 196.h,
                          margin: EdgeInsets.only(left: 8.h, top: 4.w, bottom: 3.w),
                          decoration:
                              BoxDecoration(color: AppColors.ratingColor, borderRadius: BorderRadius.circular(4.h)))
                    ]),
                    SizedBox(height: 1.w),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("4", style: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp)),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h, top: 4.w, bottom: 3.w),
                          child: Container(
                              height: 8.w,
                              width: 196.h,
                              decoration:
                                  BoxDecoration(color: AppColors.ratingColor, borderRadius: BorderRadius.circular(4.h)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.h),
                                  child: LinearProgressIndicator(
                                      value: 0.29,
                                      backgroundColor: AppColors.backGroundHome,
                                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.ratingColor)))))
                    ]),
                    SizedBox(height: 2.w),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("3", style: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp)),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h, top: 4.w, bottom: 3.w),
                          child: Container(
                              height: 8.w,
                              width: 196.h,
                              decoration: BoxDecoration(
                                  color: AppColors.backGroundHome, borderRadius: BorderRadius.circular(4.h)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.h),
                                  child: LinearProgressIndicator(
                                      value: 0.15,
                                      backgroundColor: AppColors.backGroundHome,
                                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.ratingColor)))))
                    ]),
                    SizedBox(height: 1.w),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("2", style: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp)),
                      Container(
                          height: 8.w,
                          width: 196.h,
                          margin: EdgeInsets.only(left: 8.h, top: 4.w, bottom: 3.w),
                          decoration:
                              BoxDecoration(color: AppColors.backGroundHome, borderRadius: BorderRadius.circular(4.h)))
                    ]),
                    SizedBox(height: 2.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("1", style: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp)),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h, top: 4.w, bottom: 3.w),
                          child: Container(
                            height: 8.w,
                            width: 196.h,
                            decoration: BoxDecoration(
                                color: AppColors.backGroundHome, borderRadius: BorderRadius.circular(4.h)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.h),
                              child: LinearProgressIndicator(
                                value: 0.1,
                                backgroundColor: AppColors.backGroundHome,
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.ratingColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                      height: 88.h,
                      width: 80.w,
                      child: Stack(alignment: Alignment.topLeft, children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Text("4.0", style: TextStyle(color: AppColors.titleDark, fontSize: 50.sp))),
                        CustomRatingBar(
                          alignment: Alignment.bottomCenter,
                          initialRating: 5,
                          padding: 0,
                        ),
                      ])),
                  SizedBox(height: 5.w),
                  Text("(1,162)".tr, style: TextStyle(color: AppColors.titleDark, fontSize: 12.sp))
                ],
              )
            ],
          ),
          SizedBox(height: 12.w),
        ],
      ),
    );
  }

  Widget userRatingChatCard(){
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            ImagesAsset.girlImage,
            height: 35.w,
            width: 35.w,
          ),
          title: CommonText(
            text: AppString.name,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          trailing: SvgPicture.asset(IconAsset.verticalMore, width: 20.w, height: 20.w),
        ),
        Row(
          children: [
            CustomRatingBar(
              alignment: Alignment.bottomCenter,
              initialRating: 5,
              padding: 0,
            ).marginOnly(right: 4.w),
            CommonText(
              text: AppString.aMonthAgo,
              fontSize: 10.sp,
              color: AppColors.middleGrey,
              fontWeight: FontWeight.w400,
            ),
          ],
        ).paddingOnly(bottom: 8.h),
        ReadMoreText(
          trimLength: 110,
          AppString.policy2,
          // trimLines: 3,
          colorClickableText: AppColors.blackColor,
          trimMode: TrimMode.Length,
          trimCollapsedText: 'more',
          trimExpandedText: '  ..less',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 14.sp, color: AppColors.lightGrey, fontWeight: FontWeight.w400),
          lessStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.whiteColor),
          moreStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.whiteColor),
        ),
      ],
    );
  }

  Widget replyCard(){
    return  Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                IntrinsicHeight(
                  child: Container(
                    width: 2.w,
                    height: 150.h,
                    color: AppColors.backGroundHome3,
                  ),
                ),
              ],
            ),
            10.h.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(
                      ImagesAsset.girlImage,
                      height: 35.h,
                      width: 35.w,
                    ),
                    title: CommonText(text: AppString.name, fontSize: 12.sp, fontWeight: FontWeight.w500),
                    subtitle: CommonText(
                      text: AppString.aMonthAgo,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.middleGrey,
                    ),
                  ),
                  // CommonText(
                  //   text: AppString.queryFirst,
                  //   color: AppColors.lightGrey,
                  //   fontSize: 14.sp,
                  //   fontWeight: FontWeight.w400,
                  // ).paddingOnly(bottom: 15.h, right: 12.w),
                  ReadMoreText(
                    AppString.queryFirst,
                    trimLength: 120,
                    colorClickableText: AppColors.blackColor,
                    trimMode: TrimMode.Length,
                    trimCollapsedText: 'more',
                    trimExpandedText: ' ..less',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14.sp, color: AppColors.lightGrey, fontWeight: FontWeight.w400),
                    lessStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.whiteColor),
                    moreStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.whiteColor),
                  ).paddingOnly(bottom: 16.h),

                ],
              ),
            ),
          ],
        ),
      ],
    ).paddingOnly(left: 16.w);
  }
}
