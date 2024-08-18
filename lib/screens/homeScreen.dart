import 'package:flutter/material.dart';
import 'package:news_app/Model/categoryModel.dart';
import 'package:news_app/constants/AppColor.dart';
import 'package:news_app/screens/CategoryFragment.dart';
import 'package:news_app/screens/setting.dart';
import 'package:news_app/widget/homeNewsDrawer.dart';
import 'package:news_app/widget/news/category_Details.dart';

class HomeScreen extends StatefulWidget {
  static const String route_Name = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        SafeArea(
          child: Scaffold(
            drawer: HomeNewsDrawer(
              onDrawerclicked: onDrawerClicked,
            ),
            appBar: AppBar(
              title: Text(
                selecteditem == HomeNewsDrawer.settings? "Settings" :
                selectedCategory == null
                    ? "News App"
                    : selectedCategory!.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              leading: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: AppColor.whiteColor,
                  ),
                );
              }),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: AppColor.whiteColor,
                  ),
                )
              ],
            ),
            body: selecteditem == HomeNewsDrawer.settings
                    ? const Settings()
                    :
            selectedCategory == null
                ?  CategoryFragment(
                        onCategoryItemClick: onCategoryItemClick,
                      )
                : CategoryDetails(
                    categoryId: selectedCategory!.id,
                  ),
          ),
        ),
      ],
    );
  }

  CategoryItemModel? selectedCategory;

  onCategoryItemClick(CategoryItemModel newcategory) {
    selectedCategory = newcategory;
    setState(() {});
  }

  int selecteditem = HomeNewsDrawer.categories;
  onDrawerClicked(int newItemSelect) {
    selecteditem = newItemSelect;
    selectedCategory = null;
    setState(() {});
    Navigator.pop(context);
  }
}
