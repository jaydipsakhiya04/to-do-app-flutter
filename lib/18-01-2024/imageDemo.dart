import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// image_pickr valu package add karavje

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: imageController.images.length + 1,
                  itemBuilder: (context, index) {
                    if (index == imageController.images.length) {
                      // Last index, show button
                      return ElevatedButton(
                        onPressed: imageController._pickImages,
                        child: Text('Pick Images'),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.file(
                          File(imageController.images[index].path),
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: imageController.nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: imageController.ageController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(Screen2(
                          name: imageController.nameController.text,
                          age: imageController.ageController.text,
                          image: imageController.images.first,
                        ));
                      },
                      child: Text("Next Page")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// aa biji file ma screen banavi nakhje
///
///
///
class Screen2 extends StatelessWidget {
  final String name;
  final String age;
  final XFile image;

  Screen2(
      {Key? key, required this.name, required this.age, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second scrn"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.file(
                height: 250,
                File(image.path),
                fit: BoxFit.cover,
              ),
              Text(name),
              Text(age),
            ],
          ),
        ),
      ),
    );
  }
}

/// AA Controller chhe Getx Nu
///
///
///

class ImageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  RxList<XFile> images = <XFile>[].obs;

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedFiles =
        await picker.pickMultiImage(); // Set your desired maxImages limit

    if (pickedFiles != null) {
      images.addAll(pickedFiles);
    }
  }
}
