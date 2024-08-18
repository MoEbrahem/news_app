import 'package:flutter/material.dart';
import 'package:news_app/Model/newsResponse.dart';
import 'package:news_app/constants/AppColor.dart';

class NewsDescriptionItem extends StatelessWidget {
  News news;
  NewsDescriptionItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: AppColor.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            news.description ?? '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                  fontSize: 15,
                ),
          ),
          Text(
            news.content ?? '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                  fontSize: 15,
                ),
          ),
        ],
      ),
    );
  }
}
