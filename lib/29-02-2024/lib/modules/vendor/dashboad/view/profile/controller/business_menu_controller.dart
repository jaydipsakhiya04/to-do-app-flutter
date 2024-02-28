import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/business_menu_model.dart';

class BusinessMenuController extends GetxController {
  RxBool switchButton = true.obs;

  RxList<BusinessMenuCardModel> businessMenuCardList =
      <BusinessMenuCardModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    businessMenuCardList.add(BusinessMenuCardModel(
        title: "My Box Pasta",
        price: "789",
        details: "Serves 1 | 1 Veg Pasta, 2 Pc Plain Garlic Bread",
        foodType: FoodType.veg,
        imageList: []));

    businessMenuCardList.add(BusinessMenuCardModel(
        title: "My Box Pizza",
        price: "649",
        details: "2 Pc Plain FarmVilla PizzaServes 2 | 2 Veg Pizza, 2 Pc Plain FarmVilla PizzaServes 2 | 2 Veg Pizza, 2 Pc Plain FarmVilla PizzaServes 2 | 2 Veg Pizza, 2 Pc Plain FarmVilla PizzaServes 2 | 2 Veg Pizza, 2 Pc Plain FarmVilla Pizza",
        foodType: FoodType.veg,
        imageList: []));
    super.onInit();
  }
}
