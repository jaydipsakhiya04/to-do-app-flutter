import 'package:get/get.dart';
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
