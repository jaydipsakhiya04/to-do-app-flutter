import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/businessdetails/controller/what_kindof_business_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class BusinessCategoriesServicesScreen extends StatelessWidget {
  BusinessCategoriesServicesScreen({Key? key}) : super(key: key);

  final WhatKindOfBusinessController whatKindOfBusinessController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImagesAsset.bgImage),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          isTrailing: true,
          trailingWidget: CustomTrailingWidget(
            onTap: () {
              Navigation.pushNamed(Routes.restaurantPhotos);
            },
            text: AppString.skip,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            imageAsset: ImagesAsset.rightArrow,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.categoriesServices,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 28.sp,
              ),
              CommonText(
                text: AppString.categoriesServicesDescription,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: 14.sp,
                color: AppColors.bodyDark,
              ).paddingOnly(top: 5.h, bottom: 16.h),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(bottom: 40.h),
              CommonText(
                text: AppString.businessCategories,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ).paddingOnly(top: 5.h, bottom: 16.h),

              ///   Categories Services section
              Container(
                height: 300.h,
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.whiteColor.withOpacity(0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 343.w,
                      child: Row(
                        children: [
                          // for (String key in whatKindOfBusinessController.selectedkey)
                          //   ..._buildSubcategories("", key),
                          // Use toString() to convert Key? to String, and handle null with null-aware operator
                          Text(
                            "Restaurants",
                            style: TextStyle(
                              color: AppColors.titleDark,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          Image.asset(
                            ImagesAsset.rightArrow,
                            scale: 3,
                          ),
                          Text(
                            "American",
                            style: TextStyle(
                              color: AppColors.titleDark,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          // for (String service in whatKindOfBusinessController.selectedServices)
                          //   ..._buildSubcategories(service, ""),
                        ],
                      ).paddingOnly(top: 12.5.h,),
                    ),
                    CommonText(
                      text: "Selected Service",
                      color: AppColors.bodyDark,
                    ).paddingOnly(top: 12.5.h, ),

                    Wrap(
                      spacing: 0.2,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Advertising services",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Brand Management",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Digital Marketing",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDefaultColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "American",
                                style: TextStyle(
                                  color: AppColors.titleDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.clear,
                                color: AppColors.titleDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Advertising services",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Brand Management",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      ],
                    ),

                    // Wrap(
                    //   children: [
                    //     Container(
                    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    //       decoration: BoxDecoration(
                    //         color: AppColors.primaryDefaultColor.withOpacity(0.2),
                    //         borderRadius: BorderRadius.circular(50),
                    //         border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                    //       ),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Text(
                    //             "Brand Management",
                    //             style: TextStyle(
                    //               color: AppColors.titleDark,
                    //               fontSize: 14.0,
                    //             ),
                    //           ),
                    //           SizedBox(width: 8.0),
                    //           Icon(
                    //             Icons.clear,
                    //             color: AppColors.titleDark,
                    //           ),
                    //         ],
                    //       ),
                    //     ).paddingOnly(bottom: 10, top: 5),
                    //     Wrap(
                    //       children: [
                    //         Row(
                    //           children: whatKindOfBusinessController.selectedServices.map((service) {
                    //             String key = whatKindOfBusinessController.services.keys
                    //                 .firstWhere((key) => whatKindOfBusinessController.services[key]!.contains(service), orElse: () => "");
                    //             return GestureDetector(
                    //               onTap: () => whatKindOfBusinessController.selectService(service, key),
                    //               child: Container(
                    //                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    //                 decoration: BoxDecoration(
                    //                   color: AppColors.primaryDefaultColor.withOpacity(0.2),
                    //                   borderRadius: BorderRadius.circular(50),
                    //                   border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                    //                 ),
                    //                 child: Row(
                    //                   mainAxisSize: MainAxisSize.min,
                    //                   children: [
                    //                     Text(
                    //                       service,
                    //                       style: TextStyle(
                    //                         color: AppColors.titleDark,
                    //                         fontSize: 14.0,
                    //                       ),
                    //                     ),
                    //                     SizedBox(width: 8.0),
                    //                     Icon(
                    //                       Icons.clear,
                    //                       color: AppColors.titleDark,
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ).paddingOnly(bottom: 10, top: 5),
                    //             );
                    //           }).toList(),
                    //         ).paddingOnly(top: 12.5.h, left: 12.w)
                    //       ],
                    //     ),
                    //     Wrap(
                    //       spacing: 8.0,
                    //       children: whatKindOfBusinessController.selectedServices.map((service) {
                    //         String key = whatKindOfBusinessController.services.keys
                    //             .firstWhere((key) => whatKindOfBusinessController.services[key]!.contains(service), orElse: () => "");
                    //         return GestureDetector(
                    //           onTap: () => whatKindOfBusinessController.selectService(service, key),
                    //           child: Container(
                    //             padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    //             decoration: BoxDecoration(
                    //               color: AppColors.primaryDefaultColor.withOpacity(0.2),
                    //               borderRadius: BorderRadius.circular(50),
                    //               border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                    //             ),
                    //             child: Row(
                    //               mainAxisSize: MainAxisSize.min,
                    //               children: [
                    //                 Text(
                    //                   "Brand Management",
                    //                   style: TextStyle(
                    //                     color: AppColors.titleDark,
                    //                     fontSize: 14.0,
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: 8.0),
                    //                 Icon(
                    //                   Icons.clear,
                    //                   color: AppColors.titleDark,
                    //                 ),
                    //               ],
                    //             ),
                    //           ).paddingOnly(bottom: 10, top: 5),
                    //         );
                    //       }).toList(),
                    //     ).paddingOnly(top: 12.5.h, left: 12.w),
                    //   ],
                    // ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: "Show More (07)",
                          color: AppColors.titleDark,
                        ),
                        CommonText(
                          text: "Remove",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent,
                        ),
                      ],
                    ).paddingOnly(top: 12.5.h,  bottom: 12.h),
                  ],
                ),
              ).paddingOnly(bottom: 28.h),
              Container(
                height: 300.h,
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.whiteColor.withOpacity(0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 343.w,
                      child: Row(
                        children: [
                          // for (String key in whatKindOfBusinessController.selectedkey)
                          //   ..._buildSubcategories("", key),
                          // Use toString() to convert Key? to String, and handle null with null-aware operator
                          Text(
                            "Restaurants",
                            style: TextStyle(
                              color: AppColors.titleDark,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          Image.asset(
                            ImagesAsset.rightArrow,
                            scale: 3,
                          ),
                          Text(
                            "American",
                            style: TextStyle(
                              color: AppColors.titleDark,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          // for (String service in whatKindOfBusinessController.selectedServices)
                          //   ..._buildSubcategories(service, ""),
                        ],
                      ).paddingOnly(top: 12.5.h,),
                    ),
                    CommonText(
                      text: "Selected Service",
                      color: AppColors.bodyDark,
                    ).paddingOnly(top: 12.5.h, ),

                    Wrap(
                      spacing: 0.2,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Advertising services",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Brand Management",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Digital Marketing",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDefaultColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "American",
                                style: TextStyle(
                                  color: AppColors.titleDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.clear,
                                color: AppColors.titleDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Advertising services",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.bodyDark),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Brand Management",
                                style: TextStyle(
                                  color: AppColors.bodyDark,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Icon(
                                Icons.add,
                                color: AppColors.bodyDark,
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10, top: 5, right: 8.w),
                      ],
                    ),

                    // Wrap(
                    //   children: [
                    //     Container(
                    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    //       decoration: BoxDecoration(
                    //         color: AppColors.primaryDefaultColor.withOpacity(0.2),
                    //         borderRadius: BorderRadius.circular(50),
                    //         border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                    //       ),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Text(
                    //             "Brand Management",
                    //             style: TextStyle(
                    //               color: AppColors.titleDark,
                    //               fontSize: 14.0,
                    //             ),
                    //           ),
                    //           SizedBox(width: 8.0),
                    //           Icon(
                    //             Icons.clear,
                    //             color: AppColors.titleDark,
                    //           ),
                    //         ],
                    //       ),
                    //     ).paddingOnly(bottom: 10, top: 5),
                    //     Wrap(
                    //       children: [
                    //         Row(
                    //           children: whatKindOfBusinessController.selectedServices.map((service) {
                    //             String key = whatKindOfBusinessController.services.keys
                    //                 .firstWhere((key) => whatKindOfBusinessController.services[key]!.contains(service), orElse: () => "");
                    //             return GestureDetector(
                    //               onTap: () => whatKindOfBusinessController.selectService(service, key),
                    //               child: Container(
                    //                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    //                 decoration: BoxDecoration(
                    //                   color: AppColors.primaryDefaultColor.withOpacity(0.2),
                    //                   borderRadius: BorderRadius.circular(50),
                    //                   border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                    //                 ),
                    //                 child: Row(
                    //                   mainAxisSize: MainAxisSize.min,
                    //                   children: [
                    //                     Text(
                    //                       service,
                    //                       style: TextStyle(
                    //                         color: AppColors.titleDark,
                    //                         fontSize: 14.0,
                    //                       ),
                    //                     ),
                    //                     SizedBox(width: 8.0),
                    //                     Icon(
                    //                       Icons.clear,
                    //                       color: AppColors.titleDark,
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ).paddingOnly(bottom: 10, top: 5),
                    //             );
                    //           }).toList(),
                    //         ).paddingOnly(top: 12.5.h, left: 12.w)
                    //       ],
                    //     ),
                    //     Wrap(
                    //       spacing: 8.0,
                    //       children: whatKindOfBusinessController.selectedServices.map((service) {
                    //         String key = whatKindOfBusinessController.services.keys
                    //             .firstWhere((key) => whatKindOfBusinessController.services[key]!.contains(service), orElse: () => "");
                    //         return GestureDetector(
                    //           onTap: () => whatKindOfBusinessController.selectService(service, key),
                    //           child: Container(
                    //             padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    //             decoration: BoxDecoration(
                    //               color: AppColors.primaryDefaultColor.withOpacity(0.2),
                    //               borderRadius: BorderRadius.circular(50),
                    //               border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
                    //             ),
                    //             child: Row(
                    //               mainAxisSize: MainAxisSize.min,
                    //               children: [
                    //                 Text(
                    //                   "Brand Management",
                    //                   style: TextStyle(
                    //                     color: AppColors.titleDark,
                    //                     fontSize: 14.0,
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: 8.0),
                    //                 Icon(
                    //                   Icons.clear,
                    //                   color: AppColors.titleDark,
                    //                 ),
                    //               ],
                    //             ),
                    //           ).paddingOnly(bottom: 10, top: 5),
                    //         );
                    //       }).toList(),
                    //     ).paddingOnly(top: 12.5.h, left: 12.w),
                    //   ],
                    // ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: "Show More (07)",
                          color: AppColors.titleDark,
                        ),
                        CommonText(
                          text: "Remove",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent,
                        ),
                      ],
                    ).paddingOnly(top: 12.5.h,  bottom: 12.h),
                  ],
                ),
              ).paddingOnly(bottom: 28.h),

              CustomButton(
                onTap: () {
                  Navigation.pushNamed(Routes.restaurantPhotos);
                },
                text: AppString.saveContinue,
              ).paddingOnly(bottom: 26.h),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
  }

  // Method to build subcategory widgets for a given service
  List<Widget> _buildSubcategories(String service, String key) {
    List<String> subcategories = whatKindOfBusinessController.services[service] ?? [];
    return [
      SizedBox(height: 20),
      Row(
        children: [
          Text(key, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.titleDark)),
          Text(service, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.titleDark)),
        ],
      ),
      SizedBox(height: 10),
      // Display subcategories for the service
      for (String subcategory in subcategories)
        GestureDetector(
          onTap: () {
            // Handle subcategory selection if needed
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryDefaultColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: AppColors.primaryDefaultColor.withOpacity(0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(subcategory, style: TextStyle(color: AppColors.titleDark, fontSize: 14.0)),
                SizedBox(width: 8.0),
                Icon(Icons.clear, color: AppColors.titleDark),
              ],
            ),
          ).paddingOnly(bottom: 10, top: 5),
        ),
    ];
  }
}
