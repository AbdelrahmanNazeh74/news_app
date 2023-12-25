import 'package:news_app/home/settings/app_event_type.dart';

abstract class SettingsEvent {}

class ChangeLanguageEvent extends SettingsEvent {
  final String language;

  ChangeLanguageEvent(this.language);
}

class ChangeThemeEvent extends SettingsEvent {
  final ThemeOption theme;

  ChangeThemeEvent(this.theme);
}
