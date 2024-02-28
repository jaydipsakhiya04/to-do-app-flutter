
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/controller/business_menu_controller.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/business_menu_model.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/custom_button.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_string.dart';
import '../../../../../../utils/navigation_utils/navigation.dart';
import '../../../../../../utils/navigation_utils/routes.dart';
import '../../../../../../widget/common_text.dart';
import '../../../../../../widget/read_more_text.dart';

class BusinessMenuScreen extends StatelessWidget {
  BusinessMenuScreen({super.key});

  final BusinessMenuController controller = Get.put(BusinessMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundHome,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundHome3,
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
          text: "Menu",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ).paddingSymmetric(vertical: 16.h),
      ),
      body: Obx(
         ( ) {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return businessMenuCard(
                    businessMenuCardModel:
                        controller.businessMenuCardList[index], onTap: () {
                      Map<String,dynamic> args = {};
                      args["data"] = controller.businessMenuCardList[index];
                      args["isAdd"] = false;
                    Navigation.pushNamed(Routes.businessMenuUpdate,arg: args).then((value) {
                      controller.businessMenuCardList[index] = value;
                      controller.businessMenuCardList.refresh();
                    });

                        },);
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 6.h,
                  color: AppColors.dividerColor2,
                );
              },
              itemCount: controller.businessMenuCardList.length);
        }
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(onTap: () {
            Map<String,dynamic> args = {};
            args["data"] = "";
             args["isAdd"] = true;

            Navigation.pushNamed(Routes.businessMenuUpdate,arg: args);
          },

            width: 0.26.sw,
            text: "+  Add",
          ),
        ],
      ),
    );
  }

  Widget businessMenuCard(
      {required BusinessMenuCardModel businessMenuCardModel ,  void Function()?  onTap}) {
    return Container(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15.r,
                      width: 15.r,
                      padding: EdgeInsets.all(1.3.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.r),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          )),
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    7.h.verticalSpace,
                    CommonText(
                      text: businessMenuCardModel.title,
                      fontSize: 22.h,
                      fontWeight: FontWeight.w600,
                    ),
                    5.h.verticalSpace,
                    CommonText(
                      text: "\$ ${businessMenuCardModel.price}",
                      fontSize: 22.h,
                      fontWeight: FontWeight.w600,
                    ),
                    5.h.verticalSpace,
                    /// aanu customWidget me banay nakhyu chhe
                    /// ee joi leje but ema kai changes na karti badhe aa niche chhe je rite ee rite use kari nakhje

                    ReadMoreText(
                      (businessMenuCardModel.details ?? ""),
                      trimLines: 2,
                      colorClickableText: AppColors.blackColor,
                      trimMode: TrimMode.Line,
                      /// more ni jagya ee biju kai lakhvu hoy to  eg.. show more
                      trimCollapsedText: 'more',
                      /// less ni jagya ee biju kai lakhvu hoy to  eg.. show less
                      trimExpandedText: '   less',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                      /// less vala text ne je rite text style apvi hoy ee
                      lessStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                      /// more vala text ne jevi text style apvi hoy ee
                      moreStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    )
                    // CommonText(
                    //   // text: "Serves 1 | 1 Veg Pasta, 2 Pc Plain Garlic Bread",
                    //   text: businessMenuCardModel.details,
                    //   maxLine: 2,
                    // )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      ImagesAsset.pizza2,
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            height: 2.h,
            color: AppColors.dividerColor2,
          ),
          Row(
            children: [
              const CommonText(text: "Show Business On Profile"),
              5.w.horizontalSpace,
              Obx(() {
                return SizedBox(
                    height: 35,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                        value: controller.switchButton.value,
                        onChanged: (value) {
                          controller.switchButton.value = value;
                        },
                      ),
                    ));
              }),
              Spacer(),
              InkWell(
                onTap: onTap ?? (){},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      IconAsset.edit,
                      color: Colors.white,
                    ),
                    10.w.horizontalSpace,
                    CommonText(text: "Edit"),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
