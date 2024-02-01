import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeFormatDemoPiyu extends StatefulWidget {
  const TimeFormatDemoPiyu({super.key});

  @override
  _TimeFormatDemoPiyuState createState() => _TimeFormatDemoPiyuState();
}

class _TimeFormatDemoPiyuState extends State<TimeFormatDemoPiyu> {

  TimeDemoPiyuController controller = Get.put(TimeDemoPiyuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time demp"),),
      body: Obx(() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Selected Time: ${controller. formattedTime(controller._selectedTime.value)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller._selectTime(context);
              },
              child: const Text('Select Time'),
            ),
          ],
        ),
      ),)
    );
  }


}


/// GETX CONTROLLER

class TimeDemoPiyuController extends GetxController{
  final Rx<TimeOfDay> _selectedTime = TimeOfDay.now().obs;

  ///  TimeOfDay ne AMPM MA Convert karvani method chhe aa okkk

  String formattedTime(TimeOfDay time) {
    final now = DateTime.now();
    final DateTime dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final formattedTime = DateFormat.jm().format(dateTime);
    print("foramtt timmm ---- $formattedTime");
    return formattedTime;
  }

  /// TIme Picker Demo chhe aa
   
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime.value,
    );

    if (pickedTime != null && pickedTime != _selectedTime.value) {

        _selectedTime.value = pickedTime;
        print("selected TIme --- $_selectedTime");

    }
  }


}