import 'package:flutter/cupertino.dart';

class ProfileFeatureModel{
  final String title;
  final String leadingImage;
  Widget? trailing;
  void Function()? onTap;

  ProfileFeatureModel({
    required this.title,
    required this.leadingImage,
    this.trailing,
    this.onTap,
});
}