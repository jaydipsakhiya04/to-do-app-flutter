import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_hub/constants/utitls/app_images.dart';
import 'package:event_hub/constants/utitls/date_time_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/utitls/app_colors.dart';
import '../../constants/utitls/app_icons.dart';
import '../../constants/utitls/app_strings.dart';
import '../../constants/utitls/snack_bar.dart';
import '../../navigation_utiles/routes.dart';
import '../../widgets/common_container_button_widget.dart';
import '../../widgets/common_text_widget.dart';
import '../model/event_data_model.dart';

class UpComingScreen extends StatelessWidget {
  UpComingScreen({Key? key}) : super(key: key);

  final Rx<Stream<QuerySnapshot<Map<String, dynamic>>>> eventsQuery =
      FirebaseFirestore.instance.collection("events").orderBy('eventName').snapshots().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: Icon(Icons.arrow_back, color: AppColors.white),
        leadingWidth: 14,
        title: CustomTextWidget(
          text: AppStrings.events,
          color: AppColors.blackBlue,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.addEventScreen, arguments: {
                "isUpdate": false,
                "validUser": true,
                "image": [],
                "time": '',
                "eventName": '',
                "eventAddress": '',
              });
            },
            icon: Icon(
              Icons.add,
              color: AppColors.blackBlue,
              size: 27,
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.sort,
              color: Colors.black,
              size: 27,
            ),
            onSelected: (String value) {
              if (value == 'A-Z') {
                eventsQuery.value = FirebaseFirestore.instance.collection("events").orderBy('eventName').snapshots();
              } else if (value == 'Z-A') {
                eventsQuery.value =
                    FirebaseFirestore.instance.collection("events").orderBy('eventName', descending: true).snapshots();
              } else if (value == 'Time(Ascending Order)') {
                eventsQuery.value = FirebaseFirestore.instance.collection("events").orderBy('eventTime').snapshots();
              } else if (value == 'Time(Descending Order)') {
                eventsQuery.value =
                    FirebaseFirestore.instance.collection("events").orderBy('eventTime', descending: true).snapshots();
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'A-Z',
                  child: Text('A-Z'),
                ),
                const PopupMenuItem<String>(
                  value: 'Z-A',
                  child: Text('Z-A'),
                ),
                const PopupMenuItem<String>(
                  value: 'Time(Ascending Order)',
                  child: Text('Time(Ascending Order)'),
                ),
                const PopupMenuItem<String>(
                  value: 'Time(Descending Order)',
                  child: Text('Time(Descending Order)'),
                ),
              ];
            },
          ),
        ],
      ),
      body: eventTabs(),
    );
  }

  Widget noUpComingEvent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.whiteblue,
          radius: 200.r,
          child: Image.asset(AppImages.upcomingEvent),
        ),
        25.h.verticalSpace,
        CustomTextWidget(
          color: AppColors.blackBlue,
          text: AppStrings.noUpComingEvent,
          fontWeight: FontWeight.w600,
          fontSize: 48.sp,
        ),
        15.h.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 170.w),
          child: CustomTextWidget(
            color: AppColors.grey,
            softWrap: true,
            textAlign: TextAlign.center,
            text: AppStrings.loremIpsum,
            fontWeight: FontWeight.w500,
            fontSize: 32.sp,
          ),
        ),
        90.h.verticalSpace,
        CommonContainerButton(
          margin: EdgeInsets.symmetric(horizontal: 120.w),
          fontSize: 32.sp,
          title: AppStrings.exploreEventsWord,
          color: AppColors.theme,
        ),
        40.h.verticalSpace,
      ],
    );
  }

  Widget eventTabs() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          30.h.verticalSpace,
          Container(
            width: 0.8.sw,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.r),
              color: AppColors.greyWhite,
            ),
            child: TabBar(
              indicatorPadding: EdgeInsets.zero,
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: AppColors.white),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.white,
              isScrollable: true,
              automaticIndicatorColorAdjustment: true,
              labelPadding: EdgeInsets.zero,
              tabs: [
                CustomTextWidget(
                  text: AppStrings.upcoming,
                  fontSize: 30.sp,
                ).paddingSymmetric(vertical: 10.h, horizontal: 60.w),
                CustomTextWidget(
                  text: AppStrings.pastEvents,
                  fontSize: 30.sp,
                ).paddingSymmetric(vertical: 6.h, horizontal: 60.w),
              ],
              labelColor: AppColors.theme,
              unselectedLabelColor: AppColors.grey,
            ),
          ),
          20.h.verticalSpace,
          Expanded(
            child: TabBarView(
              children: [
                eventStream(),
                noUpComingEvent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget upcomingEventsData(EventDataModel eventDataModel, {void Function()? onTap, void Function()? onLongPress,}) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: 1.sw - 30,
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: AppColors.white,
        ),
        padding: EdgeInsets.all(15.r),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image.network(
                  eventDataModel.image,
                  fit: BoxFit.cover,
                  height: 100.h,
                  width: 150.w,
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 40.0.w, right: 23.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomTextWidget(
                          maxLines: 4,
                          textOverFlow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          text: DateTimeUtils.millisecondToDate(millisecond: (int.tryParse(eventDataModel.time) ?? 0)),
                          // text: eventDataModel.time,
                          color: AppColors.theme,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.sp,
                        ),
                        // const Spacer(),
                        // SvgPicture.asset(
                        //   AppIcons.save,
                        //   width: 44.w,
                        //   height: 36.h,
                        // ),
                      ],
                    ),
                    CustomTextWidget(
                      text: eventDataModel.eventName,
                      maxLines: 4,
                      softWrap: true,
                      textOverFlow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      color: AppColors.blackBlue,
                      fontWeight: FontWeight.w600,
                      fontSize: 34.sp,
                    ),
                    6.h.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppIcons.mapPin),
                        15.w.horizontalSpace,
                        Expanded(
                          child: CustomTextWidget(
                            text: eventDataModel.eventAddress,
                            color: AppColors.grey,
                            softWrap: true,
                            textAlign: TextAlign.start,
                            maxLines: 4,
                            fontWeight: FontWeight.w600,
                            fontSize: 28.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String oneHourAgo(){
    final DateTime dateTime = DateTime.now();
    final oneHourAgo = dateTime.subtract(Duration(hours: 1));
    final millisecond =oneHourAgo.millisecondsSinceEpoch.toString();
    print("millisecond ${millisecond}");
    return oneHourAgo.millisecondsSinceEpoch.toString();
  }

  Widget eventStream() {
    DateTime currentTime = DateTime.now();
    int currentTimeMillis = currentTime.millisecondsSinceEpoch;

    DateTime oneHourAgo = currentTime.subtract(Duration(hours: 1));
    int oneHourAgoMillis = oneHourAgo.millisecondsSinceEpoch;

    DateTime oneHourLater = currentTime.add(Duration(hours: 1));
    int oneHourLaterMillis = oneHourLater.millisecondsSinceEpoch;


    // String formatTime(TimeOfDay time) {
    //   return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    // }


    // String formatTime(TimeOfDay time) {
    //   int hour = time.hourOfPeriod;
    //   String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    //   return '${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
    // }

    print('oneHourAgo: ${(oneHourAgoMillis)}');
    print('oneHourLater: ${(oneHourLaterMillis)}');

    return Obx(
          () => Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream:  FirebaseFirestore.instance
                .collection("events")
                .orderBy('eventTime')
                .startAt([oneHourAgoMillis])
                .endBefore([oneHourLaterMillis])
            // .where('eventTime', isGreaterThanOrEqualTo: formatTime(oneHourAgo))
            // .where('eventTime', isLessThan: formatTime(oneHourLater))
                .snapshots(),

            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                var events = snapshot.data?.docs;
                print('----timed data----$events');

                if (events == null || events.isEmpty) {
                  return const Text('No events within the specified time range.');
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                  child: Row(
                    children: events.map((event) {
                      var eventData = EventDataModel(
                        image: event['imageUrls'][0] ?? '',
                        time: event['eventTime'].toString() ?? '',
                        eventName: event['eventName'] ?? '',
                        eventAddress: event['eventAddress'] ?? '',
                      );
                      return Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60.r),
                              child: Image.network(
                                eventData.image,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              eventData.eventName,
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),



          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: eventsQuery.value,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  var events = snapshot.data?.docs;
                  print("event data ${events?.first.data()}");
                  return SingleChildScrollView(
                    child: Column(
                      children: events!.map((event) {
                        event.id;
                        return upcomingEventsData(
                            EventDataModel(
                              image: event['imageUrls'][0] ?? '',
                              time: event['eventTime'].toString() ?? '',
                              eventName: event['eventName'] ?? '',
                              eventAddress: event['eventAddress'] ?? '',
                            ),

                            onTap: () async {
                              // DateTime eventDateTime = DateTime.fromMillisecondsSinceEpoch((event['eventTime']) ?? 0);

                              // Format DateTime to 12-hour format
                              // String formattedTime = DateFormat('h:mm a').format(eventDateTime);
                              // var formattedTime= DateTimeUtils.millisecondToDate(millisecond: (event['eventTime']));
                              Get.toNamed(
                                Routes.addEventScreen,
                                arguments: {
                                  "image": event['imageUrls'] ?? '',
                                  "time": event['eventTime'].toString(),
                                  "eventName": event['eventName'] ?? '',
                                  "eventAddress": event['eventAddress'] ?? '',
                                  "isUpdate": true,
                                  'eventId': event.id,
                                  'uid': event['uid'] ?? '',
                                  'validUser': event['uid'] == FirebaseAuth.instance.currentUser?.uid,
                                },
                              );
                            }, onLongPress: () {
                          showMenu(
                            context: context,
                            // position: RelativeRect.fromDirectional(
                            //     textDirection: TextDirection.ltr, start: 150, top: 300, end: 300, bottom: 200),
                            position: RelativeRect.fill,
                            items: [
                              PopupMenuItem<String>(
                                child: FirebaseAuth.instance.currentUser?.uid == event['uid']
                                    ? GestureDetector(
                                  onTap: () {
                                    try {
                                      FirebaseFirestore.instance.collection("events").doc(event.id).delete();
                                      Get.back();
                                    } catch (e) {
                                      CustomSnackBar.commonSnackBar("Error", "Failed to delete", AppColors.red,
                                          AppColors.white, SnackPosition.BOTTOM);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40.r), color: AppColors.red),
                                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 25.w),
                                    child: CustomTextWidget(
                                      text: "delete",
                                      color: AppColors.white,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                )
                                    : null,
                              ),
                              PopupMenuItem<String>(
                                value: "cancel",
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.r), color: AppColors.whiteGrey),
                                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 25.w),
                                  child: CustomTextWidget(
                                    text: "cancel",
                                    color: AppColors.blackBlue1,
                                    fontSize: 30.sp,
                                  ),
                                ),
                              ),
                            ],
                          ).then((value) {
                            if (value == 'cancel') {
                              return null;
                            }
                          }
                          );
                        });
                      }).toList(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }


}