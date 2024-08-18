import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news_app/constants/AppColor.dart';
import 'package:news_app/screens/news/newsItem.dart';
import 'package:news_app/widget/news/NewsDescriptionItem.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class ItemNewsDetails extends StatelessWidget {
  static const String route_Name = "ItemNewsDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as NewsDetails;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              args.news.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            iconTheme: const IconThemeData(color: AppColor.whiteColor),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                top: height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: args.news.urlToImage ?? '',
                      width: double.infinity,
                      height: height * 0.3,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryLightColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: height * 0.016,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          args.news.author ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          args.news.title ?? "",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          //DateFormat.Hms().format(DateTime.parse(news.publishedAt ?? ''));
                          timeago.format(
                              DateTime.parse(args.news.publishedAt ?? '')),
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.end,
                        ),
                        NewsDescriptionItem(
                          news: args.news,
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(Uri.https(args.news.url!));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text("View Full Article"),
                                SizedBox(
                                  width: height * 0.015,
                                ),
                                const Icon(Icons.arrow_forward_ios_outlined)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
