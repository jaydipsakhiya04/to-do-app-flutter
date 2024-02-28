import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:local/modules/vendor/dashboad/view/profile/model/data_passing_model.dart';

class BusinessAddressController extends GetxController {
  TextEditingController addressController = TextEditingController();
  TextEditingController aptSuiteOtherController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  RxList<DataPassingModel> data = <DataPassingModel>[].obs;

  Map<String, dynamic> getUserDetails() {
    return {
      'address': addressController.text,
      'suit': aptSuiteOtherController.text,
      'city': cityController.text,
      'zip': zipCodeController.text,
    };
  }

  List<String> list = <String>[
    'Male',
    'Female',
  ];
  RxString? dropdownValue;

  ///------Enter Zip code and fetch city, state, country-------
  // final city = ''.obs;
  // final state = ''.obs;
  // final country = ''.obs;

  void getLocationFromZip(String zip) async {
    try {
      List<Location> locations = await locationFromAddress(zip);

      if (locations.isNotEmpty) {
        final placemark = await placemarkFromCoordinates(locations.first.latitude, locations.first.longitude);
        city.value = placemark.first.locality ?? '';
        state.value = placemark.first.administrativeArea ?? '';
        country.value = placemark.first.country ?? '';

        // Update the UI after fetching the values
        update();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  RxString state = ''.obs;
  RxString city = ''.obs;
  RxString zipCode = ''.obs;

  // void setLocationFromPosition(Position position) async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  //
  //     Placemark place = placemarks[0];
  //
  //     // Update the address fields in the controller with location details
  //     addressController.text = "${place.name},${place.subLocality}";
  //     cityController.text = place.locality!;
  //     state.value = place.administrativeArea!;
  //     zipCodeController.text = place.postalCode!;
  //     country.value = place.country!;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  late Position _currentPosition;
  final RxString _name = ''.obs;
  final RxString _subLocality = ''.obs;
  final RxString _locality = ''.obs;
  final RxString _administrativeArea = ''.obs;
  final RxString _postalCode = ''.obs;
  final RxString _country = ''.obs;

  RxString get name => _name;

  RxString get subLocality => _subLocality;

  RxString get locality => _locality;

  RxString get administrativeArea => _administrativeArea;

  RxString get postalCode => _postalCode;

  RxString get country => _country;

  void setLocationFromPosition(Position position) async {
    _currentPosition = position;
    await _getAddressFromLatLng();
    update(); // Notify listeners about the updated current address
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(_currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      _name.value = place.name ?? '';
      _subLocality.value = place.subLocality ?? '';
      _locality.value = place.locality ?? '';
      _administrativeArea.value = place.administrativeArea ?? '';
      _postalCode.value = place.postalCode ?? '';
      _country.value = place.country ?? '';
    } catch (e) {
      print(e);
    }
  }
}
