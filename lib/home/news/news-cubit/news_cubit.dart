import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apiManager/api_manager.dart';
import 'package:news_app/home/news/news-cubit/news_state.dart';

class NewsViewModel extends Cubit<NewsListState> {
  NewsViewModel() : super(LoadingState('Loading...'));
  void loadNews(String? sourceId) async {
    emit(LoadingState('Loading...'));
    try {
      var response = await ApiManager.getNews(sourceId!);
      if (response.status == 'error') {
        emit(ErrorState(response.message ?? ""));
      } else {
        emit(SuccessState(response.articles));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
