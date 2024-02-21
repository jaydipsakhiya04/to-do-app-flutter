import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/profile_data_model.dart';

import '../../../../../../utils/app_string.dart';
import '../../../../../../utils/assets.dart';
import '../../../../../../utils/navigation_utils/routes.dart';
import '../model/profile_feature_model.dart';

class ProfileDataController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    accountSettingList.add(
      ProfileFeatureModel(
          title: AppString.analytics, leadingImage: IconAsset.analystic,onTap: () {
Get.toNamed(Routes.analystic);
          },),
    );
    accountSettingList.add(
      ProfileFeatureModel(
          title: AppString.bookingHistory, leadingImage: IconAsset.booking),
    );
    accountSettingList.add(
      ProfileFeatureModel(
          title: AppString.payment, leadingImage: IconAsset.payment),
    );
    accountSettingList.add(
      ProfileFeatureModel(
          title: AppString.notification,
          leadingImage: IconAsset.notification,
          trailing: Obx(() {
            return Switch(
              value: notificationOn.value,
              onChanged: (value) {
                notificationOn.value = value;
              },
            );
          })),
    );
    accountSettingList.add(
      ProfileFeatureModel(
          title: AppString.darkMode,
          leadingImage: IconAsset.moon,
          trailing: Obx(() {
            return Switch(
              value: darkModeOn.value,
              onChanged: (value) {
                darkModeOn.value = value;
              },
            );
          })),
    );

    businessSettingList.add(
      ProfileFeatureModel(
          title: "Business Listing", leadingImage: IconAsset.booking),
    );
    businessSettingList.add(
      ProfileFeatureModel(
          title: "Business Menu", leadingImage: IconAsset.booking),
    );
    businessSettingList.add(
      ProfileFeatureModel(title: "Review", leadingImage: IconAsset.booking),
    );
    businessSettingList.add(
      ProfileFeatureModel(title: "Queries", leadingImage: IconAsset.booking),
    );

    othersSettingList.add(
      ProfileFeatureModel(
          title: "Help Center", leadingImage: IconAsset.payment),
    );
    othersSettingList.add(
      ProfileFeatureModel(
          title: "Privacy Policy", leadingImage: IconAsset.payment),
    );
    othersSettingList.add(
      ProfileFeatureModel(
          title: "Terms & Conditions", leadingImage: IconAsset.payment),
    );

    loginSettingList.add(
      ProfileFeatureModel(
          title: "User Login", leadingImage: IconAsset.notification),
    );
    loginSettingList.add(
      ProfileFeatureModel(
          title: "Logout", leadingImage: IconAsset.notification),
    );
  }

  RxList<ProfileDataModel> profileData = <ProfileDataModel>[].obs;

  RxBool notificationOn = true.obs;
  RxBool darkModeOn = true.obs;
  RxList<ProfileFeatureModel> accountSettingList = <ProfileFeatureModel>[].obs;
  RxList<ProfileFeatureModel> businessSettingList = <ProfileFeatureModel>[].obs;
  RxList<ProfileFeatureModel> othersSettingList = <ProfileFeatureModel>[].obs;
  RxList<ProfileFeatureModel> loginSettingList = <ProfileFeatureModel>[].obs;
}
