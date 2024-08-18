import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/news/ItemNewsDetails.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_app/Model/newsResponse.dart';
import 'package:news_app/constants/AppColor.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ItemNewsDetails.route_Name,
          arguments: NewsDetails(news: news),
        );

      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                width: double.infinity,
                height: height * 0.26,
                fit: BoxFit.fill,
                imageUrl: news.urlToImage!,
                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryLightColor,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? "",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              news.title ?? "",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              //DateFormat.Hms().format(DateTime.parse(news.publishedAt ?? ''));
              timeago.format(DateTime.parse(news.publishedAt ?? '')),
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}

class NewsDetails {
  News news;
  NewsDetails({required this.news});
}
