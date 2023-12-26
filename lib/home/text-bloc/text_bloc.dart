import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_event.dart';
part 'text_state.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextState('')) {
    on<UpdateTextEvent>((event, emit) {
      emit(TextState(event.text));
    });
  }
}
