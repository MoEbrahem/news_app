import 'package:flutter/material.dart';
import 'package:news_app/Model/newsSources.dart';
import 'package:news_app/webServices.dart';

class CategoryViewModel extends ChangeNotifier {
  List<Sources>? listSources;
  String? errMessage;

  getSources(String categoryId) async {
    listSources = null;
    errMessage = null;
    notifyListeners();
    try {
      var resonse = await WebServices.getSources(categoryId);
      if (resonse?.status != "error") {
        listSources = resonse!.sources;
      } else {
        errMessage = resonse!.message;
      }
    } catch (e) {
      errMessage = e.toString();
    }
    notifyListeners();
  }
}
