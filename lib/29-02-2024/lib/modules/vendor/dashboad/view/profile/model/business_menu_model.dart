enum FoodType{
  veg,nonVeg
}

class BusinessMenuCardModel{
   String title,price,details;
   FoodType foodType;
   List<String> imageList;

  BusinessMenuCardModel({
    required this.title,
    required this.price,
    required this.details,
    required this.foodType,
    required this.imageList,
});
}