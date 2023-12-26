part of 'text_bloc.dart';

@immutable
sealed class TextEvent {}

class UpdateTextEvent extends TextEvent {
  final String text;

  UpdateTextEvent(this.text);
}
