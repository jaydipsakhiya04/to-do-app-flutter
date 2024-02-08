import 'dart:developer';
import 'dart:io';

import 'package:event_hub/constants/utitls/app_strings.dart';
import 'package:event_hub/events/controller/add_events_controller.dart';
import 'package:event_hub/widgets/common_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/utitls/app_colors.dart';
import '../../constants/utitls/app_validations.dart';
import '../../constants/utitls/snack_bar.dart';
import '../../widgets/common_container_button_widget.dart';
import '../../widgets/common_textfield_widget.dart';

class AddEventScreen extends StatelessWidget {
  AddEventScreen({
    Key? key,
  }) : super(key: key);

  final AddEventController addEventController = Get.put(AddEventController());
  final _formKeyEvent = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blackBlue,
            size: 27,
          ),
        ),
        title: CustomTextWidget(
            text: addEventController.isUpdate.value ? AppStrings.updateEventHere : AppStrings.addEventHere,
            color: AppColors.blackBlue,
            fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20.h),
              child: Container(
                color: Colors.transparent,
                height: 130,
                child: ValueListenableBuilder(
                  valueListenable: addEventController.valueNotifier,
                  builder: (context, _, child) => ListView.builder(
                    padding: EdgeInsets.only(left: 30.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: addEventController.images.length + 1,
                    itemBuilder: (context, index) {
                      if (index == addEventController.images.length) {
                        return Container(
                          color: Colors.transparent,
                          width: 130,
                          child: GestureDetector(
                            onTap: () async {
                              await addEventController.pickImages();
                            },
                            child: addEventController.validUser.value
                                ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
                              decoration: BoxDecoration(
                                color: AppColors.whiteGrey,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Icon(Icons.add, color: AppColors.theme, size: 35),
                            )
                                : const SizedBox(),
                          ),
                        );
                      } else {
                        return Stack(
                          children: [
                            Container(
                              width: 100,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: addEventController.images[index].toString().contains("https://")
                                  ? Image.network(addEventController.images[index])
                                  : Image.file(
                                File(addEventController.images[index].path.toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  addEventController.removeImage(index);
                                },
                                child: addEventController.validUser.value
                                    ? CircleAvatar(
                                  radius: 12,
                                  backgroundColor: AppColors.red,
                                  child: Icon(Icons.close, color: AppColors.white, size: 16),
                                )
                                    : const SizedBox(),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKeyEvent,
                child: Column(
                  children: [
                    CustomTextField(
                      readOnly: addEventController.validUser.value ? false : true,
                      controller: addEventController.eventNameController,
                      validator: (value) => AppValidation.emptyFieldValidation(value),
                      hintText: AppStrings.eventName,
                      hintFontColor: AppColors.grey,
                      hintFontSize: 30.sp,
                      isShowBorder: true,
                      isFocusBorder: true,
                    ),
                    30.h.verticalSpace,
                    CustomTextField(
                      readOnly: addEventController.validUser.value ? false : true,
                      controller: addEventController.eventAddressController,
                      validator: (value) => AppValidation.emptyFieldValidation(value),
                      hintText: AppStrings.eventAddress,
                      hintFontColor: AppColors.grey,
                      hintFontSize: 30.sp,
                      isShowBorder: true,
                      isFocusBorder: true,
                    ),
                    30.h.verticalSpace,
                    Row(
                      children: [
                        GestureDetector(
                          onTap: addEventController.validUser.value?() async {
                            var selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now()
                            );
                            // var a=selectedTime?.format(context);
                            // print("a------$a");
                            if (selectedTime != null) {

                              addEventController.updateSelectedTime(selectedTime,context);
                            }


                          }:null,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: AppColors.whiteGrey)),
                            child: CustomTextWidget(
                              text: AppStrings.selectTime,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 30.sp,
                            ),
                          ),
                        ),
                        30.w.horizontalSpace,
                        Obx(() {
                          return Text(
                            " ${addEventController.selectedTime.value ?? ''}",
                            style: const TextStyle(fontSize: 16),
                          );
                        }),
                      ],
                    ),

                    40.h.verticalSpace,
                    Obx(
                          () =>
                      addEventController.isProcessing.value ? const CircularProgressIndicator() : const SizedBox(),
                    ),
                    80.h.verticalSpace,
                    Obx(
                          () => addEventController.validUser.value
                          ? CommonContainerButton(
                        margin: EdgeInsets.symmetric(horizontal: 120.w),
                        fontSize: 32.sp,
                        title: addEventController.isUpdate.value ? AppStrings.updateEvent : AppStrings.addEvent,
                        color: AppColors.theme,
                        onTap: () async {
                          if (_formKeyEvent.currentState?.validate() ?? false) {
                            addEventController.setIsProcessing(true);
                            List imageUrls = [];

                            if (addEventController.isImageAdd.value) {
                              imageUrls = await addEventController.uploadImagesToStorage();
                            } else {
                              imageUrls = addEventController.images;
                            }

                            log("image url--$imageUrls");

                            String eventId = Get.arguments["eventId"] ?? '';
                            // String uid = Get.arguments["uid"];
                            User? currentUser = FirebaseAuth.instance.currentUser;
                            String? currentUserId = currentUser?.uid;
                            String uid = Get.arguments["uid"] ?? "";

                            if (addEventController.isUpdate.value) {
                              print("currentUser---$currentUserId");
                              print("uid of event user---$uid");

                              if (currentUserId == uid) {
                                addEventController.updateEventInFirestore(imageUrls, eventId);
                              } else {
                                CustomSnackBar.commonSnackBar("", "Update process failed!", AppColors.red,
                                    AppColors.white, SnackPosition.TOP);

                                addEventController.isUpdateVisible(false);
                              }
                            } else if (!addEventController.isUpdate.value) {
                              addEventController.addEventToFirestore(imageUrls);
                            }

                            addEventController.setIsProcessing(false);
                            Get.back();
                          }
                        },
                      )
                          : const SizedBox(),
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
}