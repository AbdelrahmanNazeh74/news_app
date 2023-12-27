import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/home/settings/bloc/settings_state.dart';
import 'package:news_app/home/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/home/text-bloc/text_bloc.dart';
import 'package:news_app/registration/auth_service.dart';
import 'package:news_app/registration/login_screen.dart';
import 'package:news_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final authService = AuthService(prefs);

  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService;

  MyApp({required this.authService});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingsCubit(),
        ),
        BlocProvider(
          create: (context) => TextBloc(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(
              state.language == "en" ? 'en' : 'ar',
            ),
            title: 'News App',
            home: SplashScreen(authService: authService),
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              SettingsScreen.routeName: (context) => SettingsScreen(),
              LoginScreen.routeName: (context) =>
                  LoginScreen(authService: authService),
            },
            theme: state.theme == ThemeOption.Light
                ? ThemeData.light()
                : ThemeData.dark(),
          );
        },
      ),
    );
  }
}
