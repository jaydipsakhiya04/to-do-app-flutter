import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_string.dart';
import '../../../../../../utils/assets.dart';
import '../../../../../../widget/common_text.dart';
import '../controller/business_menu_controller.dart';
import '../model/business_menu_model.dart';
import '../widget/custom_textfield.dart';

class BusinessMenuUpdateAndAddScreen extends StatefulWidget {
  BusinessMenuUpdateAndAddScreen({super.key});

  @override
  State<BusinessMenuUpdateAndAddScreen> createState() =>
      _BusinessMenuUpdateAndAddScreenState();
}

class _BusinessMenuUpdateAndAddScreenState extends State<BusinessMenuUpdateAndAddScreen> {
  dynamic data;
  dynamic args;
  late bool isAdd;

  @override
  void initState() {
    // TODO: implement initState
    data = Get.arguments;
    isAdd = data["isAdd"];

    if (!isAdd) {
      args = data["data"];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BusinessMenuController controller1 = Get.find();
    TextEditingController titleController =
    TextEditingController(text: isAdd ? "" : args.title);
    TextEditingController priceController =
    TextEditingController(text: isAdd ? "" : args.price);
    TextEditingController detailController =
    TextEditingController(text: isAdd ? "" : args.details);
    TextEditingController categoreyController =
    TextEditingController(text: isAdd ? "veg" : "veg");

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
              Get.back();
            },
            icon: Icon(
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
              CommonTextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                label: "TItle",
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
      floatingActionButton: InkWell(
        onTap: () {
          if (isAdd) {
            controller1.businessMenuCardList.add(BusinessMenuCardModel(
                title: titleController.text,
                price: priceController.text,
                details: detailController.text,
                foodType: FoodType.veg,
                imageList: []));
            controller1.businessMenuCardList.refresh();
            Get.back();
            log("listLength --->  ${controller1.businessMenuCardList.length}");


          } else {
            args.title = titleController.text;
            args.price = priceController.text;
            args.details = detailController.text;
            controller1.businessMenuCardList.refresh();
            Get.back(result: args);
            log("list --->  ${controller1.businessMenuCardList[0].title}");
          }
        },
        child: Container(
          margin: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.purple,
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                  text: isAdd ? "Add Item" : "Save And Continue",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
      ),
    );
  }
}
