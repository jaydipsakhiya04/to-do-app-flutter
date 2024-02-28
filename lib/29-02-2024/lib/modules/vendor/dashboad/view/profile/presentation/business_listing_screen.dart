import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/business_listing_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessListingScreen extends StatelessWidget {
  BusinessListingScreen({Key? key}) : super(key: key);

  BusinessListingController _businessListingController = Get.put(BusinessListingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        titleSpacing: -8,
        title: CommonText(
          text: AppString.businessListing,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
        actions: [
          TextButton(
            onPressed: () {
              List.generate(8, (index) => _businessListingController.image.value.add(
                  ImagesAsset.hotel
              ));
              Navigation.pushNamed(Routes.updateBusinessDetail,arg: _businessListingController.image.value);
            },
            child: CommonText(
              text: AppString.editListing,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.purple,
            ),
          ),
          10.w.horizontalSpace,
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 0.35.sh,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Image.asset(ImagesAsset.hotel),
                          Positioned(
                            top: 8.h,
                            bottom: 8,
                            left: 0,
                            right: 10,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Text(
                                  '${index + 1}/8',
                                  style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                onPageChanged: (index) {
                  _businessListingController.updatePageIndex(index);
                },
              ),
            ),
            firstThreeRows(
              image: IconAsset.listing,
              color: AppColors.purple,
              title: AppString.restaurantsName,
            ),
            firstThreeRows(
              image: IconAsset.phoneCall,
              color: AppColors.purple,
              title: AppString.hotelNumber,
            ),
            firstThreeRows(
              image: IconAsset.globe,
              title: AppString.site,
            ),
            addressField(),
            hoursField(),
            businessCategories(),
            _buildListPaymentOptions(),
            businessServices(),
            bookingPrice(),
          ],
        ),
      ),
    );
  }

  Widget addressField() {
    return Container(
        color: AppColors.appColor,
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  IconAsset.location,
                  height: 24.w,
                  width: 24.w,
                ).paddingOnly(right: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                          text: AppString.addressMap,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightGrey),
                      4.h.verticalSpace,
                      CommonText(
                          text: "3.0 KM", fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.bodyDark),
                    ],
                  ).paddingOnly(right: 16.w),
                ),
                GestureDetector(
                  onTap: (){
                    _launchMap();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Image.asset(
                      ImagesAsset.mapView,
                      width: 96.h,
                      height: 96.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ).paddingSymmetric(vertical: 16.h, horizontal: 16.w),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.lightBrown,
            ),
          ],
        ));
  }

  _launchMap() async {
    const String address = AppString.addressMap;
    // const String address = "kargilchock surat 395010";
    final url = 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeFull(address)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget hoursField() {
    return GestureDetector(
      onTap: (){
        Get.bottomSheet(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: AppString.hours,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.r),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(120.r),
                                    color: AppColors.darkBackGroundHome,
                                    border: Border.all(color: AppColors.pinkPurple)
                                  ),
                                  child: Icon(Icons.close_rounded,color: AppColors.titleDark,size: 18.sp,),
                                ),
                              ],
                            ).paddingOnly(left: 16.w,right: 21.w,top: 20.h,bottom: 20.h),
                            Divider(
                              height: 3.h,
                              thickness: 1,
                              color: AppColors.lightBrown,
                            ),
                           Column(
                             children:  List.generate(_businessListingController.weekDays.length, (index) =>
                                 ListTile(
                                   contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                                   leading: CommonText(
                                     text: _businessListingController.weekDays[index],
                                     fontSize: 14.sp,
                                     fontWeight: FontWeight.w500,
                                     color: AppColors.lightGrey,
                                   ),
                                   trailing: Column(
                                     mainAxisSize: MainAxisSize.min,
                                     children: [
                                       CommonText(
                                         text: AppString.timeHour,
                                         fontSize: 14.sp,
                                         fontWeight: FontWeight.w500,
                                         color: AppColors.lightGrey,
                                       ),
                                       CommonText(
                                         text: AppString.timeHour,
                                         fontSize: 14.sp,
                                         fontWeight: FontWeight.w500,
                                         color: AppColors.lightGrey,
                                       ),
                                     ],
                                   ),
                                 ),),
                           ),
                          ],
                        ).marginOnly(bottom: 20.h),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        color: AppColors.appColor,
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconAsset.clock,
                  height: 24.w,
                  width: 24.w,
                ).paddingOnly(right: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hours".tr,
                      style: TextStyle(fontSize: 16.sp, color: AppColors.titleDark),
                    ),
                    SizedBox(height: 5.w),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(
                        "Closes now".tr,
                        style: TextStyle(fontSize: 12.sp, color: AppColors.red),
                      ),
                      Container(
                          height: 4.h,
                          width: 4.w,
                          margin: EdgeInsets.symmetric(horizontal: 7.w),
                          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(2.h))),
                      Text(
                        "11:30 am - 2:15 pm".tr,
                        style: TextStyle(fontSize: 12.sp, color: AppColors.titleDark),
                      )
                    ])
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.lightGrey,
                  size: 20.sp,
                ),
              ],
            ).paddingSymmetric(vertical: 16.h, horizontal: 16.w),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.lightBrown,
            ),
          ],
        ),
      ),
    );
  }

  Widget firstThreeRows({required String image, required String title, Color? color}) {
    return Container(
        color: AppColors.appColor,
        width: double.maxFinite,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  image,
                  color: color,
                  height: 24.w,
                  width: 24.w,
                ).paddingOnly(right: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(text: title, fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.lightGrey),
                  ],
                ).paddingOnly(right: 16.w),
              ],
            ).paddingSymmetric(vertical: 16.h, horizontal: 16.w),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.lightBrown,
            ),
          ],
        ));
  }

  Widget businessCategories() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.h.verticalSpace,
            CommonText(
              text: AppString.businessCategories,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            16.h.verticalSpace,
            innerCategories(
              first: AppString.restaurants,
              second: AppString.american,
            ),
            innerCategories(
              first: AppString.restaurants,
              second: AppString.american,
            ),
            innerCategories(
              first: AppString.restaurants,
              second: AppString.american,
            ),
          ],
        ).paddingOnly(left: 16.w,bottom: 6.h),
        Divider(
          height: 1,
          thickness: 1,
          color: AppColors.lightBrown,
        ),
      ],
    );
  }

  Widget innerCategories({
    required String first,
    required String second,
  }) {
    return Row(
      children: [
        CommonText(
          text: first,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.lightWhitegrey,
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.lightWhitegrey,
          size: 12.sp,
        ).paddingSymmetric(horizontal: 9.w),
        CommonText(
          text: second,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.lightWhitegrey,
        ),
      ],
    ).marginOnly(bottom: 10.h);
  }

  Widget _buildListPaymentOptions() {
    return Column(
      children: List.generate(3, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _businessListingController.listpaymentoptionsItemList.value[index].paymentText ?? "",
              style: TextStyle(fontSize: 14.sp, color: AppColors.titleDark),
            ).paddingOnly(top: 16.h,left: 16.w,bottom: 16.h),
            Row(
              children: [
                SvgPicture.asset(
                  _businessListingController.listpaymentoptionsItemList.value[index].creditCardImage?? "",
                  height: 24.w,
                  width: 24.w,
                ).paddingOnly(left: 16.w, right: 16.w),
                Text(
                  _businessListingController.listpaymentoptionsItemList.value[index].creditCardText ?? "",
                  style: TextStyle(fontSize: 14.sp, color: AppColors.lightGrey,fontWeight: FontWeight.w500),
                ),
              ],
            ).paddingOnly(bottom: 13.5.h),
            Row(
              children: [
                SvgPicture.asset(
                  _businessListingController.listpaymentoptionsItemList.value[index].cashImage ?? "",
                  height: 24.h,
                  width: 24.w,
                ).paddingOnly(
                  right: 16.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    _businessListingController.listpaymentoptionsItemList[index].cashText ?? "",
                    style: TextStyle(fontSize: 14.sp, color: AppColors.lightGrey,fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ).paddingOnly(bottom: 16.h, left: 16.w, right: 16.w),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.lightBrown,
            ),
            20.h.verticalSpace
          ],
        );
      }),
    );
  }

  Widget businessServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: AppString.services,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ).paddingOnly(bottom: 16.h,left: 16.w),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: List.generate(_businessListingController.services.length, (index) => CommonText(
               text: _businessListingController.services[index],
               fontSize: 14.sp,
               fontWeight: FontWeight.w500,
               color: AppColors.lightGrey,
             ).paddingOnly(bottom: 16.h,left: 16.w),),
           ),
          ],
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: AppColors.lightBrown,
        ),
      ],
    );
  }

  Widget bookingPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: AppString.bookingPrice,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ).paddingOnly(top: 16.h),
        CommonText(
          text: AppString.thousand,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ).paddingOnly(top: 16.h),
      ],
    ).paddingOnly(left: 16.w,bottom: 16.h);
  }
}
