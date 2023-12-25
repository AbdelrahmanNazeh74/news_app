import 'package:news_app/model/SourcesResponse.dart';

sealed class CategoryDetailsState {}

class SuccessState extends CategoryDetailsState {
  List<Sources>? sourcesList;
  SuccessState(this.sourcesList);
}

class LoadingState extends CategoryDetailsState {
  String message;
  LoadingState(this.message);
}

class ErrorState extends CategoryDetailsState {
  String errorMessage;
  ErrorState(this.errorMessage);
}
