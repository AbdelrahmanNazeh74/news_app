import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/home/settings/bloc/settings_state.dart';
import 'package:news_app/home/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(
              state.language == "en" ? 'en' : 'ar',
            ),
            title: 'News App',
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              SettingsScreen.routeName: (context) => SettingsScreen()
            },
            initialRoute: HomeScreen.routeName,
            theme: state.theme == ThemeOption.Light
                ? ThemeData.light()
                : ThemeData.dark(),
          );
        },
      ),
    );
  }
}
