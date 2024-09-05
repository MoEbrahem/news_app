import 'package:flutter/material.dart';
import 'package:news_app/constants/AppColor.dart';
import 'package:news_app/screens/viewModel/CategoryViewModel.dart';
import 'package:news_app/screens/viewModel/newsViewModel.dart';
import 'package:news_app/widget/news/NewsTabs.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  String categoryId;
  CategoryDetails({
    super.key,
    required this.categoryId,
  });

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryViewModel viewModel = CategoryViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errMessage != null) {
            return Center(
              child: Column(
                children: [
                  Text(viewModel.errMessage!),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.categoryId);
                    },
                    child: const Text("Try Again.."),
                  ),
                ],
              ),
            );
          } else if (viewModel.listSources == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryLightColor,
              ),
            );
          } else {
            return ChangeNotifierProvider(
              create: (context) => NewsViewModel(),
              child: NewsTabs(
                sourcesList: viewModel.listSources!,
              ),
            );
          }
        },
      ),
    );
  }
}
