import 'package:news_app/home/settings/app_event_type.dart';

class SettingsState {
  final String language;
  final ThemeOption theme;

  SettingsState({required this.language, required this.theme});
  SettingsState copyWith({
    String? language,
    ThemeOption? theme,
  }) {
    return SettingsState(
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }
}
