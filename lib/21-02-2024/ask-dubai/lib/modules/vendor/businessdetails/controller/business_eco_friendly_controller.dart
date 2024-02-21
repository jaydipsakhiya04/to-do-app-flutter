import 'package:get/get.dart';

class BusinessEcoFriendlyController extends GetxController {
  List<String> list = <String>["Marketing", "Legal Services", "Financial Services", "Human Resources", "Business Consulting"];
  RxString? dropdownValue;

  // String? dropdownValue;

  void addOption(String option) {
    if (!selectedOptions.contains(option)) {
      selectedOptions.add(option);
      update();
    }
  }

  void removeOption(String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
      update();
    }
  }

  RxList<String> selectedOptions = <String>[].obs;

  // Method to add selected option
  void addSelectedOption(String option) {
    selectedOptions.add(option);
  }

  void removeSelectedOption(String option) {
    selectedOptions.remove(option);
  }
}
