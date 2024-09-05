import 'package:flutter/material.dart';
import 'package:news_app/Model/newsResponse.dart';
import 'package:news_app/Model/newsSources.dart';
import 'package:news_app/webServices.dart';

class NewsViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errMessage;
  List<Sources>? sourcesList;
  int selectedIndex = 0;

  void onChangeIndex(int index, List<Sources> newsourcesList) {
    selectedIndex = index;
    notifyListeners();
  }

  void getNews(String sourceId, [String page = "1"]) async {
    newsList = null;
    errMessage = null;
    notifyListeners();
    try {
      var response = await WebServices.getNewsByMySourceId(sourceId, page);
      if (response?.status == "error") {
        errMessage = response!.message!;
      } else {
        newsList = response!.articles;
      }
    } catch (e) {
      errMessage = e.toString();
    }
    notifyListeners();
  }
}
