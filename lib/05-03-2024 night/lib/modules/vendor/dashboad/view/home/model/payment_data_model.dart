import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ListpaymentoptionsItemModel {
  String? paymentText;
  String? creditCardImage;

  String? creditCardText;

  String? cashImage;

  String? cashText;

  String? id;
  void Function()? onTap;

  ListpaymentoptionsItemModel({
    this.paymentText,
    this.creditCardImage,
    this.creditCardText,
    this.cashImage,
    this.cashText,
    this.id,
    this.onTap
  });
}
