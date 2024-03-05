import 'package:get/get.dart';

enum FoodType{
  veg,nonVeg
}

class BusinessMenuCardModel{
  String title,price,details;
  FoodType foodType;
  RxList<dynamic> imageList;

  BusinessMenuCardModel({
    required this.title,
    required this.price,
    required this.details,
    required this.foodType,
     required this.imageList,
  });
}