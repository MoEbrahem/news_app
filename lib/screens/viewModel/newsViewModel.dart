import 'package:bloc/bloc.dart';
import 'package:news_app/Model/newsResponse.dart';
import 'package:news_app/Model/newsSources.dart';
import 'package:news_app/screens/viewModel/cubit/states/NewsState.dart';
import 'package:news_app/webServices.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel() : super(NewsInitialState());

  int selectedIndex = 0;
  
  void onChangeIndex(int index, List<Sources> newsourcesList) {
    selectedIndex = index;
    emit(NewsChangeIndexState());
  }

  void getNews(String sourceId, [String page = "1"]) async {
    emit(NewsLoadingState());
    try {
      var response = await WebServices.getNewsByMySourceId(sourceId, page);
      if (response?.status == "error") {
        emit(NewsErrorState(errMessage: response!.message!));
      } else {
        emit(NewsSuccessState(newsList: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(errMessage: e.toString()));
    }
  }
}
