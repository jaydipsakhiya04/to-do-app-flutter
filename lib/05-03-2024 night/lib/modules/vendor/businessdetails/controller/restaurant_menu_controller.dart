import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RestaurantMenuController extends GetxController {
  RxBool isAddMenuPhoto = false.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailsController = TextEditingController();


  List<String> list = <String>["Marketing", "Legal Services", "Financial Services", "Human Resources", "Business Consulting"];
  RxString? dropdownValue;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isAddMenuPhoto.value = false;
  }

  List<String> _imagePaths = [];
  List<String> get imagePaths => _imagePaths;
  Future<void> pickImage() async {
    final List<String> pickedFiles = [];
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      for (var image in images) {
        pickedFiles.add(image.path);
      }
    }
    _imagePaths.addAll(pickedFiles);
    update();
  }

  void removeImage(int index) {
    _imagePaths.removeAt(index);
    update();
  }
}
