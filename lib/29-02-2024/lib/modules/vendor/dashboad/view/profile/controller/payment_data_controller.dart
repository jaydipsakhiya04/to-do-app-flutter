import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/payment_data_model.dart';
import 'package:local/utils/app_string.dart';

class PaymentDataController extends GetxController{

  RxList<PaymentDataModel> todayDepositeList=<PaymentDataModel>[
    PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
  ].obs;

  RxList<PaymentDataModel> yesterDepositeList=<PaymentDataModel>[
    PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.deposit, date: AppString.transactionTime),
  ].obs;

  RxList<PaymentDataModel> todayWithDrawList=<PaymentDataModel>[
    PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
  ].obs;

  RxList<PaymentDataModel> yesterWithDrawList=<PaymentDataModel>[
    PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
    PaymentDataModel(title: AppString.withdraw, date: AppString.transactionTime),
  ].obs;
}