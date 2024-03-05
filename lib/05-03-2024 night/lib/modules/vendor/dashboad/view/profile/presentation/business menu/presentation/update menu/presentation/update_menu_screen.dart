import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/businessdetails/controller/restaurant_menu_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/menu_card_data_model.dart';
import 'package:local/modules/vendor/dashboad/view/profile/presentation/business%20menu/controller/menu_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

import '../../../../../widget/custom_textfield.dart';

class UpdateAndAddScreen extends StatefulWidget {
  const UpdateAndAddScreen({super.key});

  @override
  State<UpdateAndAddScreen> createState() => _UpdateAndAddScreenState();
}

class _UpdateAndAddScreenState extends State<UpdateAndAddScreen> {
  dynamic data;
  dynamic args;
  late bool isAdd;
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    data = Get.arguments;
    isAdd = data["isAdd"];
    if(!isAdd){
      index = data["index"];
    }
    if (!isAdd) {
      args = data["data"];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BusinessMenuController _menuController = Get.find();
    TextEditingController titleController =
        TextEditingController(text: isAdd ? "" : args.title);
    TextEditingController priceController =
        TextEditingController(text: isAdd ? "" : args.price);
    TextEditingController detailController =
        TextEditingController(text: isAdd ? "" : args.details);
    TextEditingController categoreyController =
        TextEditingController(text: isAdd ? "veg" : "veg");
    // RestaurantMenuController restaurantMenuController = Get.find();
    // RestaurantMenuController restaurantMenuController = Get.put(RestaurantMenuController());

    return Scaffold(
      backgroundColor: AppColors.darkTheme,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.backGroundHome3,
          ),
        ),
        titleSpacing: 1,
        backgroundColor: AppColors.darkBackGroundHome,
        leading: IconButton(
            onPressed: () {
              Navigation.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: CommonText(
          text: isAdd ? "Add Menu" : "Update Menu",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                  text: AppString.addMenuPhotos,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
              8.h.verticalSpace,
              // DottedBorder(
              //   dashPattern: [
              //     6
              //   ],
              //   borderType: BorderType.Rect,
              //   borderPadding: EdgeInsets.all(5),
              //   padding: EdgeInsets.all(5),
              //   strokeCap: StrokeCap.butt,
              //   color: AppColors.grey,
              //   child: GestureDetector(
              //     onTap: _menuController.pickImage,
              //     child: Padding(
              //       padding: EdgeInsets.all(14.r),
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(8.r),
              //           color: AppColors.darkBackGroundHome,
              //         ),
              //         padding: EdgeInsets.symmetric(horizontal: 37.w,vertical: 33.w),
              //         child: Image.asset(
              //           ImagesAsset.plus,
              //           scale: 4.sp,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              DottedBorder(
                dashPattern: const [6, 3, 0, 5],
                color: AppColors.whiteColor.withOpacity(0.3),
                strokeWidth: 2,
                child: SizedBox(
                  width: 343.w,
                  height: 114.h,
                  child: Center(
                    child: (_menuController.isAddMenuPhoto.value)
                        ? GestureDetector(
                            onTap: () {},
                            child: CommonText(
                              text: "+ ${AppString.addMenuPhotos}",
                              color: AppColors.middleGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          )
                        :
                         isAdd ?  Obx(
                                 () {
                               return Row(
                                 children: [
                                   Container(
                                     color: Colors.transparent,
                                     width: _menuController.imagePaths.isEmpty
                                         ? 0
                                         : _menuController.imagePaths.length == 1
                                         ? 115.w
                                         : 220.w,
                                     child: SingleChildScrollView(
                                       scrollDirection: Axis.horizontal,
                                       physics:
                                       _menuController.imagePaths.length == 1
                                           ? const NeverScrollableScrollPhysics()
                                           : const BouncingScrollPhysics(),
                                       child: Row(
                                         children: [
                                           ...List.generate(
                                             _menuController.imagePaths.length,
                                                 (index) => Stack(
                                               children: [
                                                 GestureDetector(
                                                   onTap: () => print(
                                                       'Tapped image at index $index'),
                                                   child: AspectRatio(
                                                     aspectRatio: 1.0,
                                                     child: ClipRRect(
                                                       borderRadius:
                                                       BorderRadius.circular(8),
                                                       child: Image.file(
                                                         File(_menuController.imagePaths[index]),
                                                         fit: BoxFit.cover,
                                                       ),
                                                     ),
                                                   ),
                                                 ).paddingOnly(
                                                     top: 10.h,
                                                     bottom: 10.h,
                                                     left: 8.w,
                                                     right: 8.w),
                                                 Positioned(
                                                   top: 12.h,
                                                   right: 12.w,
                                                   child: GestureDetector(
                                                     onTap: () => _menuController
                                                         .removeImage(index,index),
                                                     child: Container(
                                                       height: 20.h,
                                                       width: 20.w,
                                                       padding:
                                                       const EdgeInsets.all(4),
                                                       decoration:
                                                       const BoxDecoration(
                                                         shape: BoxShape.circle,
                                                         color: Colors.redAccent,
                                                       ),
                                                       child: Image.asset(
                                                         ImagesAsset.delete,
                                                         width: 16.w,
                                                         height: 16.h,
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                   GestureDetector(
                                     onTap: (){
                                       _menuController.pickImage(index);
                                     },
                                     child: Padding(
                                       padding: EdgeInsets.only(
                                           top: 10.h,
                                           bottom: 10.h,
                                           left: 6.w,
                                           right: 6.w),
                                       child: Container(
                                         height: 98.h,
                                         width: 90.w,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(8.r),
                                           color: AppColors.darkBackGroundHome,
                                         ),
                                         child: Icon(
                                           Icons.add,
                                           color: AppColors.middleGrey,
                                         ),
                                       ),
                                     ),
                                   )
                                 ],
                               ).paddingOnly(left: 10.w);
                             }
                         ) :    Obx(
                             () {
                                 return Row(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: args.imageList.isEmpty
                                            ? 0
                                            : args.imageList.length == 1
                                                ? 115.w
                                                : 220.w,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              args.imageList.length == 1
                                                  ? const NeverScrollableScrollPhysics()
                                                  : const BouncingScrollPhysics(),
                                          child: Row(
                                            children: [
                                              ...List.generate(
                                              args.imageList.length,
                                                (index) => Stack(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => print(
                                                          'Tapped image at index $index'),
                                                      child: AspectRatio(
                                                        aspectRatio: 1.0,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(8),
                                                          child: Image.file(
                                                            File(args.imageList[index]),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ).paddingOnly(
                                                        top: 10.h,
                                                        bottom: 10.h,
                                                        left: 8.w,
                                                        right: 8.w),
                                                    Positioned(
                                                      top: 12.h,
                                                      right: 12.w,
                                                      child: GestureDetector(
                                                        onTap: () => _menuController
                                                            .removeImage(index,index),
                                                        child: Container(
                                                          height: 20.h,
                                                          width: 20.w,
                                                          padding:
                                                              const EdgeInsets.all(4),
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: Colors.redAccent,
                                                          ),
                                                          child: Image.asset(
                                                            ImagesAsset.delete,
                                                            width: 16.w,
                                                            height: 16.h,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          _menuController.pickImage(index);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.h,
                                              bottom: 10.h,
                                              left: 6.w,
                                              right: 6.w),
                                          child: Container(
                                            height: 98.h,
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.r),
                                              color: AppColors.darkBackGroundHome,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: AppColors.middleGrey,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ).paddingOnly(left: 10.w);
                               }
                             ),

                  ),
                ),
              ).paddingOnly(bottom: 12.h),
              12.h.verticalSpace,
              CommonTextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                label: "Title",
                suffix: SizedBox(),
                hintText: '',
              ),
              CommonTextField(
                controller: priceController,
                keyboardType: const TextInputType.numberWithOptions(),
                label: "Price",
                suffix: const SizedBox(),
                hintText: '',
              ),
              CommonTextField(
                controller: categoreyController,
                hintText: "",
                label: "Category",
                suffix: const Icon(Icons.arrow_drop_down),
                onTap: () {},
              ),
              CommonTextField(
                controller: detailController,
                hintText: "",
                label: "Details",
                suffix: const SizedBox(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        children: [
          Expanded(
            child: CustomButton(
              onTap: () {
                if (isAdd) {
                  _menuController.businessMenuCardList.add(
                    BusinessMenuCardModel(
                      title: titleController.text,
                      price: priceController.text,
                      details: detailController.text,
                      foodType: FoodType.veg,
                      imageList: _menuController.imagePaths,
                    ),
                  );
                  _menuController.businessMenuCardList.refresh();
                  // _menuController.imagePaths.clear();
                  Navigation.pop();
                  log("listLength --->  ${_menuController.businessMenuCardList.length}");
                } else {
                  args.title = titleController.text;
                  args.price = priceController.text;

                  args.details = detailController.text;
                  // args.imageList = _menuController.imagePaths;

                  _menuController.businessMenuCardList.refresh();

                  Get.back(result: args);
                  log("list --->  ${_menuController.businessMenuCardList[0].title}");
                }
              },
              borderRadius: BorderRadius.circular(10.r),
              width: 165.w,
              height: 50.h,
              buttonBorderColor: AppColors.primaryDefaultColor,
              buttonColor: AppColors.primaryDefaultColor,
              svgColor: AppColors.whiteColor,
              textColor: AppColors.whiteColor,
              text: isAdd ? "Add Item" : "Save & continue",
            ),
          ),
        ],
      ).paddingOnly(left: 16.w, right: 16.w, top: 4.h, bottom: 16.h),
    );
  }
}
