import 'package:news_app/model/NewsResponse.dart';

sealed class NewsListState {}

class SuccessState extends NewsListState {
  List<News>? newsList;
  SuccessState(this.newsList);
}

class ErrorState extends NewsListState {
  String message;
  ErrorState(this.message);
}

class LoadingState extends NewsListState {
  String errorMessage;
  LoadingState(this.errorMessage);
}
