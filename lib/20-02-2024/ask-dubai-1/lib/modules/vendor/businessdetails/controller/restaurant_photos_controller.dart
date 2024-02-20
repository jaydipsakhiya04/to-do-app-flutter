import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RestaurantPhotoController extends GetxController {
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

  RxBool isAddMenuPhoto = false.obs;
}
