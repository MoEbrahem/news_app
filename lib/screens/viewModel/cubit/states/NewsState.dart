import 'package:news_app/Model/newsResponse.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsInitialState extends NewsState {}

class NewsErrorState extends NewsState {
  String errMessage;
  NewsErrorState({required this.errMessage});
}

class NewsSuccessState extends NewsState {
  List<News> newsList;
  NewsSuccessState({required this.newsList});
}

class NewsChangeIndexState extends NewsState {}
