import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/user/dashboad/controller/home_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({Key? key}) : super(key: key);
  final ServiceController serviceController = Get.put(ServiceController());
  final HomeController homeController = Get.put(HomeController());
  bool showMoreItems = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191127).withOpacity(0.8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF120C1C),
              height: Get.height / 2.6,
              child: Stack(
                children: [
                  Image.asset(
                    ImagesAsset.homeImage,
                    width: double.infinity,
                    height: 280.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0.w,
                    top: 64.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: Container(
                        width: 343.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: CommonText(
                          text: "Ready to dine\noutdoors?",
                          fontSize: 34.sp,
                          height: 1.2,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.w,
                    left: 0.w,
                    top: 158.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 199.w),
                      child: Container(
                        height: 38.h,
                        width: 343.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryDefaultColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                ImagesAsset.searchW,
                                fit: BoxFit.cover,
                                scale: 4,
                                color: AppColors.whiteColor,
                              ).paddingOnly(right: 2.w),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Outdoor dining',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: AppColors.titleDark,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      )),
                                  onChanged: (value) {
                                    // Perform search logic here
                                  },
                                ).paddingOnly(top: 16.h),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 252.h,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 56.h,
                        width: 343.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFF120C1C),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                ImagesAsset.searchW,
                                fit: BoxFit.cover,
                                scale: 3,
                                color: AppColors.whiteColor,
                              ).paddingOnly(right: 10.w),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Search for things to do', border: InputBorder.none, hintStyle: TextStyle(color: AppColors.bodyDark)),
                                  onChanged: (value) {
                                    // Perform search logic here
                                  },
                                ),
                              ),
                              Container(
                                width: 40.w,
                                height: 40.h,
                                padding: EdgeInsets.all(11.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: AppColors.whiteColor.withOpacity(0.10),
                                  border: Border.all(
                                    color: AppColors.whiteColor.withOpacity(0.10),
                                  ),
                                ),
                                child: Image.asset(
                                  ImagesAsset.mic,
                                  fit: BoxFit.cover,
                                  color: AppColors.bodyDark,
                                ),
                              ).paddingOnly(right: 10.w),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              List<Service> displayedServices =
                  serviceController.showMoreItems.value ? serviceController.services.toList() : serviceController.services.take(8).toList();
              return Container(
                color: const Color(0xFF120C1C),
                child: GridView.builder(
                  shrinkWrap: true, // Add this
                  physics: const NeverScrollableScrollPhysics(), // Add this
                  itemCount: displayedServices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final service = displayedServices[index];
                    if (index == (displayedServices.length - 1)) {
                      return GestureDetector(
                        onTap: () {
                          serviceController.showMoreItems.value = true;
                        },
                        child: const ProductItem(
                          image: ImagesAsset.more,
                          text: AppString.more,
                        ),
                      );
                    }
                    if (index == (displayedServices.last)) {
                      return GestureDetector(
                        onTap: () {
                          serviceController.showMoreItems.value = false;
                        },
                        child: const ProductItem(
                          image: ImagesAsset.more,
                          text: AppString.price,
                        ),
                      );
                    }
                    return SizedBox(
                      width: 75.w,
                      child: Column(
                        children: [ProductItem(image: service.imagePath, text: service.name)],
                      ),
                    );
                  },
                ),
              );
            }),
            Container(
              // color: const Color(0xFF191127),
              height: 226.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeController.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(restaurant: homeController.restaurants[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          serviceController.showMoreItems.toggle();
        },
        child: Icon(serviceController.showMoreItems.value ? Icons.arrow_upward : Icons.arrow_downward),
      ),
    );
  }
}

///
class Restaurant {
  final String name;
  final String location;
  final double distance;
  final double rating;
  final String closingTime;

  Restaurant({
    required this.name,
    required this.location,
    required this.distance,
    required this.rating,
    required this.closingTime,
  });
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF191127),
      height: 226,
      width: 158,
      child: Card(
        color: const Color(0xFF191127),
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // color: productDisplayContoller.isSelected(index) ? const Color(0xFF151026) : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)), // Image border
              child: Image.asset(
                ImagesAsset.homeImage,
                width: double.infinity,
                scale: 1,
                fit: BoxFit.cover,
              ),
            ),
            Stack(children: [
              Container(
                // color: const Color(0xFF191127),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("${restaurant.location}" ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImagesAsset.searchW,
                              fit: BoxFit.cover,
                              scale: 4,
                              color: AppColors.bodyDark,
                            ),
                            Text('${restaurant.distance} KM', style: TextStyle(fontSize: 12, color: AppColors.bodyDark)),
                          ],
                        ),
                        Text("⭐ ${restaurant.rating}" ?? "", style: TextStyle(fontSize: 12, color: AppColors.bodyDark)),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Image.asset(
                            ImagesAsset.searchW,
                            fit: BoxFit.cover,
                            scale: 4,
                            color: AppColors.bodyDark,
                          ),
                        ),
                        Text('Closes until \n5:00 PM tomorrow' ?? '', style: TextStyle(fontSize: 12, color: AppColors.bodyDark)),
                      ],
                    ),

                    ///------------------------------ Rating Star Function-------------------------------
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String image;
  final String? text;

  const ProductItem({
    Key? key,
    required this.image,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 75.w,
        child: Column(
          children: [
            Container(
              width: 42.w,
              height: 42.h,
              padding: EdgeInsets.all(11.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.whiteColor.withOpacity(0.10),
                border: Border.all(
                  color: AppColors.whiteColor.withOpacity(0.10),
                ),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.h), // Add some space between image and text
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Product {
//   final int id;
//   final String brand;
//   final String title;
//   final double price;
//   final String images;
//
//   Product({
//     required this.id,
//     required this.brand,
//     required this.title,
//     required this.price,
//     required this.images,
//   });
// }
//
// class CustomSliverGrid extends StatelessWidget {
//   CustomSliverGrid({
//     Key? key,
//     required this.products,
//   }) : super(key: key);
//
//   final List<Product> products = [
//     Product(id: 1, brand: 'Apple', title: 'iPhone 9', price: 549, images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
//     Product(id: 2, brand: 'Apple', title: 'iPhone 10', price: 459, images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
//     Product(id: 1, brand: 'Apple', title: 'iPhone 9', price: 549, images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
//     Product(id: 2, brand: 'Apple', title: 'iPhone 10', price: 459, images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
//     Product(id: 1, brand: 'Apple', title: 'iPhone 9', price: 549, images: 'https://i.dummyjson.com/data/products/2/1.jpg'),
//     Product(id: 2, brand: 'Apple', title: 'iPhone 10', price: 459, images: 'https://i.dummyjson.com/data/products/2/1.jpg')
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: const EdgeInsets.all(10),
//       sliver: SliverGrid(
//         delegate: SliverChildBuilderDelegate(((context, index) {
//           return ProductItem(product: products[index]);
//         }), childCount: products.length),
//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1 / 1.73, mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
//       ),
//     );
//   }
// }
