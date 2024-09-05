// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/newsSources.dart';
import 'package:news_app/constants/AppColor.dart';
import 'package:news_app/screens/news/news_widget.dart';
import 'package:news_app/screens/viewModel/cubit/states/NewsState.dart';
import 'package:news_app/screens/viewModel/newsViewModel.dart';
import 'package:news_app/widget/news/itemsListSources.dart';
import 'package:provider/provider.dart';

class NewsTabs extends StatefulWidget {
  List<Sources> sourcesList;

  NewsTabs({
    super.key,
    required this.sourcesList,
  });

  @override
  State<NewsTabs> createState() => _NewsTabsState();
}

class _NewsTabsState extends State<NewsTabs> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        return DefaultTabController(
          length: widget.sourcesList.length,
          child: Column(
            children: [
              TabBar(
                onTap: (value) =>
                    viewModel.onChangeIndex(value, widget.sourcesList),
                isScrollable: true,
                dividerColor: AppColor.transparentColor,
                indicatorColor: AppColor.transparentColor,
                tabs: widget.sourcesList
                    .map(
                      (source) => Itemslistsources(
                        sources: source,
                        isSelected: viewModel.selectedIndex ==
                            widget.sourcesList.indexOf(source),
                      ),
                    )
                    .toList(),
              ),
              Expanded(
                child: NewsWidget(
                  source: widget.sourcesList[viewModel.selectedIndex],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
