import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/menu_card_data_model.dart';
import 'package:local/utils/assets.dart';

class BusinessMenuController extends GetxController {
  RxBool switchButton = true.obs;
  RxBool isAddMenuPhoto = false.obs;

  RxList<BusinessMenuCardModel> businessMenuCardList =
      <BusinessMenuCardModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    businessMenuCardList.add(BusinessMenuCardModel(
        title: "My Box Pasta",
        price: "789",
        details: "Serves 1 | 1 Veg Pasta, 2 Pc Plain Garlic Bread &  2 Pc Plain Garlic Bread &1 Veg Pasta, 2 Pc Plain Garlic Bread",
        foodType: FoodType.veg,
        imageList: <dynamic>[

        ].obs));

    businessMenuCardList.add(BusinessMenuCardModel(
        title: "My Box Pizza",
        price: "649",
        details: "2 Pc Plain FarmVilla PizzaServes 2 | 2 Veg Pizza, 2 Pc Plain FarmVilla PizzaServes 2 | 2 Veg Pizza, 2 Pc Plain FarmVilla PizzaServes 2 | 2 Veg Pizza, 2 Pc Plain FarmVilla PizzaServes 2 | 2 Veg Pizza, 2 Pc Plain FarmVilla Pizza",
        foodType: FoodType.veg,
        imageList: <dynamic>[

        ].obs));
    super.onInit();
  }

  RxList<String> imagePaths = <String>[].obs;
  // RxList<String> get imagePaths => _imagePaths.obs;
  Future<void> pickImage(int index) async {
    final List<String> pickedFiles = [];
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      for (var image in images) {
        pickedFiles.add(image.path);
      }
    }
    businessMenuCardList[index].imageList.addAll(pickedFiles);
    update();
  }
  void removeImage(int index,int modelIndex) {
    businessMenuCardList[modelIndex].imageList   .removeAt(index);
    update();
  }
}