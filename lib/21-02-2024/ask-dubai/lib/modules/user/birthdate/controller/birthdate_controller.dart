import 'package:get/get.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';

class BirthDateController extends GetxController {
  Rx<DateTime> selectedDate = DateTime(DateTime.now().year - 1, DateTime.now().month, DateTime.now().day).obs;
  RxInt age = 0.obs;
  RxString message = ''.obs;

  void calculateAge() {
    final today = DateTime.now();
    age.value = today.year -
        selectedDate.value.year -
        (today.month > selectedDate.value.month || (today.month == selectedDate.value.month && today.day >= selectedDate.value.day) ? 0 : 1);
  }

  void setMessage() {
    if (age.value < 18) {
      message.value = "Age must be 18 or older.";
    } else {
      message.value = "";
      Navigation.pushNamed(Routes.createNewPass);
    }
  }
}