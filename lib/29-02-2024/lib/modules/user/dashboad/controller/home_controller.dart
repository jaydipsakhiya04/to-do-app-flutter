import 'package:get/get.dart';
import 'package:local/modules/user/dashboad/view/home/home_screen.dart';
import 'package:local/utils/assets.dart';

class HomeController extends GetxController {
  List<String> servicesList = [
    "Restaurants",
    "Shopping",
    "Hotels & Accommodation",
    "Beauty & Wellness",
    "Automotive",
    "Health & Fitness",
    "Entertainment",
    "Health",
    "Home Services",
    "Education",
    "Nightlife",
    "Events & Occasions",
    "Medical Services",
    "Travel & Transportation",
    "Finance & Legal",
    "Sports & Recreation",
    "Pets",
    "Technology & Gadgets",
    "Real Estate",
    "Art & Culture",
    "Government Services",
    "Social & Community",
    "Professional Services",
  ];
  List<String> imagePath = [
    ImagesAsset.foodDining,
    ImagesAsset.foodDining,
    ImagesAsset.hotelsAccommodation,
    ImagesAsset.beautyWellness,
    ImagesAsset.automotive,
    ImagesAsset.healthFitness,
    ImagesAsset.entertainment,
    ImagesAsset.healthFitness,
    ImagesAsset.homeService,
    ImagesAsset.foodDining,
    ImagesAsset.foodDining,
    ImagesAsset.hotelsAccommodation,
    ImagesAsset.beautyWellness,
    ImagesAsset.automotive,
    ImagesAsset.healthFitness,
    ImagesAsset.entertainment,
    ImagesAsset.healthFitness,
    ImagesAsset.homeService,
    ImagesAsset.foodDining,
    ImagesAsset.foodDining,
    ImagesAsset.hotelsAccommodation,
    ImagesAsset.beautyWellness,
    ImagesAsset.automotive,
  ];

  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Restaurant A',
      location: '123 Main St',
      distance: 2.5,
      rating: 4.5,
      closingTime: '10:00 PM',
    ),
    Restaurant(
      name: 'Restaurant B',
      location: '456 Elm St',
      distance: 3.2,
      rating: 4.0,
      closingTime: '9:30 PM',
    ),
    Restaurant(
      name: 'Restaurant A',
      location: '123 Main St',
      distance: 2.5,
      rating: 4.5,
      closingTime: '10:00 PM',
    ),
    Restaurant(
      name: 'Restaurant B',
      location: '456 Elm St',
      distance: 3.2,
      rating: 4.0,
      closingTime: '9:30 PM',
    ),
    Restaurant(
      name: 'Restaurant A',
      location: '123 Main St',
      distance: 2.5,
      rating: 4.5,
      closingTime: '10:00 PM',
    ),
    Restaurant(
      name: 'Restaurant B',
      location: '456 Elm St',
      distance: 3.2,
      rating: 4.0,
      closingTime: '9:30 PM',
    ),
    // Add more restaurants here
  ];
}

class ServiceController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  var services = <Service>[].obs; // Make the list observable
  RxBool showMoreItems = false.obs;
  @override
  void onInit() {
    super.onInit();
    // Populate the services list using the provided data
    for (int i = 0; i < homeController.servicesList.length; i++) {
      services.add(Service(name: homeController.servicesList[i], imagePath: homeController.imagePath[i]));
    }
  }
}

class Service {
  final String name;
  final String imagePath;

  Service({required this.name, required this.imagePath});
}

/*
Widget _buildSenderMessage(CommentModel message) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String documentId = Get.arguments['docId'];
  return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: firestore.collection("users").doc(documentId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("if..");
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print("else if error..");
          print("snapshot.hasError${snapshot.hasError}");
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          print("else if..");
          DetailModel detailModel = DetailModel.fromJson(snapshot.data?.data() ?? {});
          print("detailModel==${snapshot.data?.data()}");
          print("comment*** ${detailModel.comment}");

          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 0.6.sw,
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: AppColors.skyColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    topLeft: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      // detailModel.comment.toString(),
                      message.title ?? '',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ).paddingOnly(top: 5.h, bottom: 14.h),
                  ],
                ).paddingSymmetric(vertical: 5.h, horizontal: 10.w),
              ),
            ],
          ).paddingSymmetric(vertical: 8.h);
        } else {
          print("else..");
          return const Center(child: CircularProgressIndicator());
        }
      });
}
*/
