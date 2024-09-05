import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/AppColor.dart';
import 'package:news_app/screens/viewModel/CategoryViewModel.dart';
import 'package:news_app/screens/viewModel/cubit/states/category_state.dart';
import 'package:news_app/widget/news/NewsTabs.dart';

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
    return BlocBuilder<CategoryViewModel, CategoryStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is CategoryErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errMessage),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getSources(widget.categoryId);
                  },
                  child: const Text("Try Again.."),
                ),
              ],
            ),
          );
        } else if (state is CategoryLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryLightColor,
            ),
          );
        } else if (state is CategorySuccessState) {
          return NewsTabs(
            sourcesList: state.listSources,
          );
        }
        return Container();
      },
    );
  }
}
