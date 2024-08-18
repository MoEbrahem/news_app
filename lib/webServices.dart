import "dart:convert";
import "package:http/http.dart" as http;
import "package:news_app/Model/newsResponse.dart";
import "package:news_app/Model/newsSources.dart";
import "package:news_app/constants/ApiConstants.dart";

class WebServices {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=1ebaf8be932f485c88598535c05b8803

// https://newsapi.org/v2/top-headlines?category=sports&page=3&apiKey=1ebaf8be932f485c88598535c05b8803

// page = 1
  static Future<NewsSources?> getSources(String categoryId) async {
    Uri url = Uri.https(
      ApiConstants.baseurl,
      ApiConstants.unencodepath,
      {
        'apiKey': '1ebaf8be932f485c88598535c05b8803',
        "category":categoryId,
        },
    );
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return NewsSources.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
  static Future<NewsResponse?> getMySourceId(String sourceId,[String page='1']) async {
    Uri url = Uri.https(
      ApiConstants.baseurl,
      ApiConstants.newsApi,
      {
        'apiKey': '1ebaf8be932f485c88598535c05b8803',
        'sources': sourceId,
        "page":page,
        "pageSize":"20",

      },
    );
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
