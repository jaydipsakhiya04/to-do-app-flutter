import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatKindOfBusinessController extends GetxController {
  TextEditingController businessCategoriesController = TextEditingController();

  Map<String, List<String>> services = {
    "Restaurants": ["Non-Veg Restaurants", "Veg Restaurants", "Fast Food", "Fine Dining", "Food Trucks", "Cafes"],
    "Shopping": ["Clothing Stores", "Electronics", "Supermarkets", "Luxury Brands", "Specialty Shops"],
    "Hotels & Accommodation": ["Hotels", "Resorts", "Hostels", "Apartments", "Vacation Rentals"],
    "Beauty & Wellness": ["Salons", "Spas", "Beauty Clinics", "Fitness Centers", "Wellness Studios:"],
    "Automotive": ["Auto Repair:", "Car Dealerships", "Rental Services", "Service Centers", "Auto Parts"],
    "Health & Fitness": ["Gyms", "Yoga Studios", "Fitness Classes", "Wellness Centers", "Health Clinics"],
    "Entertainment": ["Gyms", "Yoga", "Fitness", "Wellness", "Health"],
    "Health": ["Cinemas", "Theaters", "Amusement Parks", "Concert Halls", "Events & Shows"],
    "Home Services": ["Plumbing", "Electrical Services", "Cleaning", "Pest Control", "Home Maintenance"],
    "Education": ["Schools", "Tutors", "Training Centers", "Language Schools", "Educational Resources"],
    "Nightlife": ["Bars", "Clubs", "Lounges", "Night Events", "Live Music Venues"],
    "Events & Occasions": ["Event Planners", "Catering Services", "Party Supplies", "Venues", "Photographers"],
    "Medical Services": ["Hospitals", "Clinics", "Pharmacies", "Dental Clinics", "Medical Specialists"],
    "Travel & Transportation": ["Travel Agencies", "Airlines", "Public Transportation", "Tour Operators", "Travel Resources"],
    "Finance & Legal": ["Banks", "Legal Services", "Financial Advisors", "Insurance", "Investment Firms"],
    "Sports & Recreation": ["Sports Clubs", "Outdoor Activities", "Fitness Centers", "Sports Events", "Recreation Centers"],
    "Pets": ["Pet Grooming", "Veterinarians", "Pet Stores", "Pet Boarding", "Pet Services"],
    "Technology & Gadgets": ["Electronic Stores", "IT Services", "Gadget Shops", "Tech Repair", "Software Services"],
    "Real Estate": ["Property Agents", "Developers", "Rental Services", "Home Inspections", "Real Estate Resources"],
    "Art & Culture": ["Galleries", "Museums", "Cultural Centers", "Art Studios", "Cultural Events"],
    "Government Services": ["Public Services", "Government Offices", "Civic Centers", "Municipal Services", "Legal Aid"],
    "Social & Community": ["Community Centers", "Volunteer Services", "Social Organizations", "Religious Institutions", "Non-Profit Organizations"],
    "Professional Services": ["Marketing", "Legal Services", "Financial Services", "Human Resources", "Business Consulting"],
  };

  RxList<String> selectedServices = <String>[].obs;
  RxList<String> selectedKey = <String>[].obs;
  TextEditingController searchController = TextEditingController();
  RxBool isDisplay = false.obs;

  // void selectService(String service, String key) {
  //   if (selectedServices.contains(service) && selectedkey.contains(key)) {
  //     selectedkey.remove(key);
  //     selectedServices.remove(service);
  //   } else {
  //     if (selectedServices.length < 3 && selectedkey.length < 3) {
  //       selectedkey.add(key);
  //       selectedServices.add(service);
  //     } else {
  //       // You can show a snackbar or some other notification here
  //       print("You can only select up to 3 services.");
  //     }
  //   }
  // }

  void selectService(String service, String key) {
    // Check if the selected service belongs to a category that already has a selection
    bool hasSelectedCategory = selectedKey.isNotEmpty && selectedKey.contains(key);

    if (selectedServices.contains(service) && hasSelectedCategory) {
      selectedKey.remove(key);
      selectedServices.remove(service);
    } else {
      if (selectedServices.length < 3 && selectedKey.length < 3) {
        if (selectedKey.isEmpty || selectedKey.contains(key)) {
          selectedKey.add(key);
          selectedServices.add(service);
        } else {
          // You can show a snackbar or some other notification here
          print("You can only select services from the same category.");
        }
      } else {
        // You can show a snackbar or some other notification here
        print("You can only select up to 3 services.");
      }
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
