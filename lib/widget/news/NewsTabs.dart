// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/Model/newsSources.dart';
import 'package:news_app/constants/AppColor.dart';
import 'package:news_app/screens/news/news_widget.dart';
import 'package:news_app/screens/viewModel/newsViewModel.dart';
import 'package:news_app/widget/news/itemsListSources.dart';

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
  int selectedIndex = 0;

  // final scrollController = ScrollController();
  NewsViewModel viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourcesList[selectedIndex].id ?? '');
    return DefaultTabController(
      // initialIndex: currentIndex,
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (value) {
              selectedIndex = value;
              setState(() {

              });
            },
            // tabAlignment: TabAlignment.start,
            // physics: const AlwaysScrollableScrollPhysics(),

            isScrollable: true,
            dividerColor: AppColor.transparentColor,
            indicatorColor: AppColor.transparentColor,
            tabs: widget.sourcesList
                .map(
                  (source) => Itemslistsources(
                    sources: source,
                    isSelected:
                        selectedIndex == widget.sourcesList.indexOf(source)
                            
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: NewsWidget(
              source: widget.sourcesList[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
