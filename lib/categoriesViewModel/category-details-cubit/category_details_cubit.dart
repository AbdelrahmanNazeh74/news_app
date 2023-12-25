import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apiManager/api_manager.dart';
import 'package:news_app/categoriesViewModel/category-details-cubit/category_details_state.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  CategoryDetailsViewModel() : super(LoadingState("loading..."));
  void loadSources(String categoryId) async {
    emit(LoadingState('Loading...'));
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        emit(ErrorState(response.message ?? ""));
      } else {
        emit(SuccessState(response.sources));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
