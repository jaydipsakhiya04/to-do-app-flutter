import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/profile_data_model.dart';
import 'package:local/utils/navigation_utils/navigation.dart';

import '../../../../../../utils/app_string.dart';
import '../../../../../../utils/assets.dart';
import '../../../../../../utils/navigation_utils/routes.dart';

class ProfileDataController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    ///account list
    accountSettingList.add(
      ProfileFeatureModel(
        title: AppString.analytics,
        leadingImage: IconAsset.analystic,
        onTap: () {
          Navigation.pushNamed(Routes.analystic);
        },
      ),
    );
    accountSettingList.add(
      ProfileFeatureModel(
          title: AppString.bookingHistory,
          leadingImage: IconAsset.booking,
          onTap: () {
            Navigation.pushNamed(Routes.bookingHistory);
          }),
    );
    accountSettingList.add(
      ProfileFeatureModel(
          title: AppString.payment,
          leadingImage: IconAsset.payment,
          onTap: () {
            Navigation.pushNamed(Routes.payment);
          }),
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

    ///business list
    businessSettingList.add(
      ProfileFeatureModel(
        title: AppString.businessListing,
        leadingImage: IconAsset.listing,
        onTap: () {
          Navigation.pushNamed(Routes.businessListing);
        },
      ),
    );
    businessSettingList.add(
      ProfileFeatureModel(
        title: AppString.businessMenu,
        leadingImage: IconAsset.menu,
        onTap: () {
          Navigation.pushNamed(Routes.menu);
        },
      ),
    );
    businessSettingList.add(
      ProfileFeatureModel(title: AppString.review, leadingImage: IconAsset.review,
        onTap: () {
          Navigation.pushNamed(Routes.review);
        },
      ),
    );
    businessSettingList.add(
      ProfileFeatureModel(
          title: AppString.queries,
          leadingImage: IconAsset.queries,
          onTap: () {
            Navigation.pushNamed(Routes.queries);
          }),
    );

    ///other list
    othersSettingList.add(
      ProfileFeatureModel(
        title: AppString.helpCenter,
        leadingImage: IconAsset.help,
        onTap: () {
          Navigation.pushNamed(Routes.helpCenter);
        },
      ),
    );
    othersSettingList.add(
      ProfileFeatureModel(title: AppString.privacyPolicyCamelCase, leadingImage: IconAsset.policy,
        onTap: () {
          Navigation.pushNamed(Routes.privacyPolicy);
        },
      ),
    );
    othersSettingList.add(
      ProfileFeatureModel(title: AppString.termsConditionsCamelCase, leadingImage: IconAsset.terms,
        onTap: () {
          Navigation.pushNamed(Routes.termsAndCondition);
        },
      ),
    );

    ///login list
    loginSettingList.add(
      ProfileFeatureModel(title: AppString.userLogin, leadingImage: IconAsset.logOut),
    );
    loginSettingList.add(
      ProfileFeatureModel(title: AppString.logOut, leadingImage: IconAsset.logOut),
    );
  }

  RxList<ProfileFeatureModel> profileData = <ProfileFeatureModel>[].obs;

  RxBool notificationOn = true.obs;
  RxBool darkModeOn = true.obs;
  RxList<ProfileFeatureModel> accountSettingList = <ProfileFeatureModel>[].obs;
  RxList<ProfileFeatureModel> businessSettingList = <ProfileFeatureModel>[].obs;
  RxList<ProfileFeatureModel> othersSettingList = <ProfileFeatureModel>[].obs;
  RxList<ProfileFeatureModel> loginSettingList = <ProfileFeatureModel>[].obs;
}
