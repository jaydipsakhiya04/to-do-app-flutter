import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoflutter/comman_widget/custom_textfield_widget.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({Key? key}) : super(key: key);

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validation"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              100.h.verticalSpace,
              CustomTextField(
                controller: controller1,
                isShowBorder: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "please enter data";
                  }
                },
                label: "Name",
              ),
              50.h.verticalSpace,
              ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      Get.snackbar(
                          backgroundColor: Colors.red.shade400,
                          margin: EdgeInsets.all(8),
                          snackPosition: SnackPosition.BOTTOM,
                          "Hey",
                          "Please fill all field");
                    } else {
                      Get.to("");
                    }
                  },
                  child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
