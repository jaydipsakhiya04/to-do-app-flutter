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
  List<XFile> images = [];

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedFiles =
        await picker.pickMultiImage(); // Set your desired maxImages limit

    if (pickedFiles != null) {
      setState(() {
        images.addAll(pickedFiles);
      });
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker App'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: images.length + 1,
              itemBuilder: (context, index) {
                if (index == images.length) {
                  // Last index, show button
                  return ElevatedButton(
                    onPressed: _pickImages,
                    child: Text('Pick Images'),
                  );
                } else {
                  return Image.file(
                    File(images[index].path),
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ageController,
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
                        name: nameController.text,
                        age: ageController.text,
                        image: images.first,
                      ));
                    },
                    child: Text("Next Page")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
