import 'package:flutter/material.dart';
import 'package:news_app/Model/newsResponse.dart';
import 'package:news_app/webServices.dart';

class NewsViewModel extends ChangeNotifier {
  List<News>? sourcesList;
  String? errMessage;

  getNews(String sourceId, [String pageSize="20"]) async {
    sourcesList = null;
    errMessage = null;
    notifyListeners();
    try {
      var response = await WebServices.getMySourceId(sourceId,pageSize);
      if (response!.status == "error") {
        errMessage = response.message!;
      } else {
        sourcesList = response.articles;
      }
    } catch (e) {
      errMessage = e.toString();
    }
    notifyListeners();
  }
}
