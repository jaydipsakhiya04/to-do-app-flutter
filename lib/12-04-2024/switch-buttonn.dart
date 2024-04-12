import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CustomSwitchButton extends StatelessWidget {
  CustomSwitchButton({super.key});

  SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Button"),
      ),
      body: Center(
        child: Theme(
          data: ThemeData(
            useMaterial3: true,
          ).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(outline: Colors.transparent),
          ),
          child: SwitchTheme(
            data: SwitchThemeData(
                thumbIcon: MaterialStatePropertyAll(Icon(
                  Icons.add,
                  color: Colors.transparent,
                ))),
            child: Obx(
                    ( ) {
                  return Switch(
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: Colors.orange,
                    onChanged: (value) {
                      switchController.changeSwitchValue(value);
                    },
                    value:switchController. isSwitch.value,
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}

class SwitchController extends GetxController {
  RxBool isSwitch = false.obs;

  void changeSwitchValue(bool value){
    isSwitch.value = value;
  }

}
