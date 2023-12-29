import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/home/settings/bloc/settings_state.dart';
import 'package:news_app/home/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/home/text-bloc/text_bloc.dart';
import 'package:news_app/registration/login-bloc/user_login_bloc.dart';
import 'package:news_app/registration/login-bloc/user_login_state.dart';
import 'package:news_app/registration/login_screen.dart';
import 'package:news_app/registration/reposoitory/auth_repository.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = AuthRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingsCubit(),
        ),
        BlocProvider(
          create: (context) => TextBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(authRepository: authRepository),
        )
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
            home: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const CircularProgressIndicator();
                } else if (state is LoginSuccess) {
                  return HomeScreen();
                } else if (state is LoginFailure) {
                  return Text('Login failed: ${state.error}');
                } else {
                  return LoginScreen();
                }
              },
            ),
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              SettingsScreen.routeName: (context) => SettingsScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
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
