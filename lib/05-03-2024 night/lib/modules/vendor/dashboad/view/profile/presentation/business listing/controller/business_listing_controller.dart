import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/home/model/payment_data_model.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';

class BusinessListingController extends GetxController {
  var pageIndex = 0.obs;

  void updatePageIndex(int index) {
    pageIndex.value = index;
  }

  RxList<ListpaymentoptionsItemModel> listpaymentoptionsItemList = [
    ListpaymentoptionsItemModel(
        paymentText: "Payments",
        creditCardImage: IconAsset.coin,
        creditCardText: "Accepts Credit Cards",
        cashImage: IconAsset.cash,
        cashText: "Accepts Cash",

    ),
    ListpaymentoptionsItemModel(
      paymentText: "Features",
      creditCardImage: IconAsset.coin,
      creditCardText: "Casual",
      cashImage: IconAsset.cash,
      cashText: "Offers Catering",
    ),
    ListpaymentoptionsItemModel(
      paymentText: "Eco-friendly",
      creditCardImage: IconAsset.coin,
      creditCardText: "Bike Parking",
      cashImage: IconAsset.cash,
      cashText: "Bring your own container allowed",
    ),
  ].obs;

  RxList<String> services = [
    AppString.commercialServices,
    AppString.electricalPanelRepair,
    AppString.lightingInstallation,
    AppString.electricalPanelInstallation,
    AppString.eVCharging,
  ].obs;

  RxList<String> weekDays = [
    AppString.monday,
    AppString.tuesday,
    AppString.wednesday,
    AppString.thursday,
    AppString.friday,
    AppString.saturday,
    AppString.sunday,
  ].obs;

  RxList<String> imageList = [
    ImagesAsset.hotel,
    ImagesAsset.pizza,
    ImagesAsset.pizza1,
    ImagesAsset.pizza2,
  ].obs;

  var showAllImages = false.obs;

  void showAll() {
    showAllImages.value = true;
  }

  RxList image = [].obs;
}
