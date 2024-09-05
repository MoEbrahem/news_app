import 'package:news_app/Model/newsSources.dart';

abstract class CategoryStates {}

class CategoryInitialState extends CategoryStates {}

class CategoryLoadingState extends CategoryStates {}

class CategoryErrorState extends CategoryStates {
  String errMessage;
  CategoryErrorState({required this.errMessage});
}

class CategorySuccessState extends CategoryStates {
  List<Sources> listSources;
  CategorySuccessState({required this.listSources});
}
