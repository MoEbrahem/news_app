import 'package:flutter/material.dart';
import 'package:news_app/Model/categoryModel.dart';
import 'package:news_app/widget/itemCategoryFrag.dart';

class CategoryFragment extends StatelessWidget {
  Function onCategoryItemClick;
  CategoryFragment({super.key, required this.onCategoryItemClick});
  List<CategoryItemModel> listCategory = CategoryItemModel.getCategories();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Pick your category \nof interest",style: Theme.of(context).textTheme.headlineLarge,),
          SizedBox(
            height: height*0.03,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: height*0.237,
                crossAxisCount: 2,
                mainAxisSpacing: height*0.01,
                crossAxisSpacing: height*0.01,
              ),
              itemCount: listCategory.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(listCategory[index]);
                  },
                  child: CategoryItemFragment(
                    category: listCategory[index],
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
