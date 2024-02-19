import 'package:get/get.dart';

class AcceptPaymentController extends GetxController {
  var acceptCash = false.obs;
  var acceptCreditCards = false.obs;

  void toggleAcceptCash(bool newValue) {
    acceptCash.value = newValue;
  }

  void toggleAcceptCreditCards(bool newValue) {
    acceptCreditCards.value = newValue;
  }
}
