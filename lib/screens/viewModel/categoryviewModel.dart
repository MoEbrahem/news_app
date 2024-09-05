import 'package:bloc/bloc.dart';

import 'package:news_app/screens/viewModel/cubit/states/category_state.dart';
import 'package:news_app/webServices.dart';

class CategoryViewModel extends Cubit<CategoryStates> {
  CategoryViewModel() : super(CategoryInitialState());

  

  getSources(String categoryId) async {
    emit(CategoryLoadingState());
    try {
      var resonse = await WebServices.getSources(categoryId);
      if (resonse?.status != "error") {
         
        emit(CategorySuccessState(listSources: resonse!.sources!,));
      } else {
        
        emit(CategoryErrorState(errMessage:  resonse!.message!));
      }
    } catch (e) {
      emit(CategoryErrorState(errMessage: e.toString()));
    }
  }
}
