import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(language: 'en', theme: ThemeOption.Light));

  void changeLanguage(String language) {
    emit(state.copyWith(language: language));
  }

  void changeTheme(ThemeOption theme) {
    emit(state.copyWith(theme: theme));
  }
}
