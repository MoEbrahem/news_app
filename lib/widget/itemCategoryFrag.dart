import 'package:flutter/material.dart';
import 'package:news_app/Model/categoryModel.dart';

class CategoryItemFragment extends StatelessWidget {
  CategoryItemModel category;
  int index;
  CategoryItemFragment(
      {super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      // height: height*0.5,
      decoration: BoxDecoration(

          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft: index % 2 != 0
                ? const Radius.circular(25)
                : const Radius.circular(0),
            bottomRight: index % 2 == 0
                ? const Radius.circular(25)
                : const Radius.circular(0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            category.imageurl,
            height: height * 0.14,
            fit: BoxFit.fill,

          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
