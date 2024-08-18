// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:news_app/constants/AppColor.dart';

class CategoryItemModel {
  String id;
  String imageurl;
  String title;
  Color color;
  CategoryItemModel({
    required this.id,
    required this.imageurl,
    required this.title,
    required this.color,
  });
  static List<CategoryItemModel> getCategories()  {
  return [
    CategoryItemModel(
      id: "sports",
      imageurl: "assets/images/sports.png",
      title: "Sports",
      color: AppColor.redColor,
    ),
    CategoryItemModel(
      id: "general",
      imageurl: "assets/images/Politics.png",
      title: "Politics",
      color: AppColor.darkBlueColor,
    ),
    CategoryItemModel(
      id: "health",
      imageurl: "assets/images/health.png",
      title: "Health",
      color: AppColor.binkColor,
    ),
    CategoryItemModel(
      id: "business",
      imageurl: "assets/images/bussines.png",
      title: "Business",
      color: AppColor.brownColor,
    ),
    CategoryItemModel(
      id: "entertainment",
      imageurl: "assets/images/environment.png",
      title: "Entertainment",
      color: AppColor.lightBlueColor,
    ),
    CategoryItemModel(
      id: "science",
      imageurl: "assets/images/science.png",
      title: "science",
      color: AppColor.yellowColor,
    ),
  ];
  } 
}
