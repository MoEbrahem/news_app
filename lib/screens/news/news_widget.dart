// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Model/newsSources.dart';
import 'package:news_app/constants/AppColor.dart';
import 'package:news_app/screens/news/newsItem.dart';
import 'package:news_app/screens/viewModel/cubit/states/NewsState.dart';
import 'package:news_app/screens/viewModel/newsViewModel.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({
    super.key,
    required this.source,
  });

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final scrollController = ScrollController();
  NewsViewModel viewModel = NewsViewModel();
  String pageSize = "1";

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.source.id ?? '');
    scrollController.addListener(scrollListener);
    return BlocBuilder<NewsViewModel, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errMessage),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getNews(widget.source.id!);
                  },
                  child: const Text("Try Again.."),
                ),
              ],
            ),
          );
        } else if (state is NewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryLightColor,
            ),
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: state.newsList.length,
            itemBuilder: (context, index) {
              return NewsItem(
                news: state.newsList[index],
              );
            },
          );
        }
        return Container();
      },
    );
  }

  void scrollListener() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      setState(
        () {
          int page = int.parse(pageSize) + 1;

          pageSize = page.toString();
          viewModel.getNews(
            widget.source.id ?? '',
            pageSize,
          );
        },
      );
    }
  }
}

  // FutureBuilder(
        //     future: WebServices.getMySourceId(
        //       widget.source.id ?? '',
        //       pageSize,
        //     ),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(
        //             color: AppColor.primaryLightColor,
        //           ),
        //         );
        //       } else if (snapshot.hasError) {
        //         return const Text("Try Again");
        //       } else {
        //         var newsList = snapshot.data!.articles!;
        //         return ListView.builder(
        //           controller: scrollController,
        //           physics: const BouncingScrollPhysics(),
        //           itemCount: newsList.length,
        //           itemBuilder: (context, index) {
        //             return NewsItem(
        //               news: newsList[index],
        //             );
        //           },
        //         );
        //       }
        //     });
