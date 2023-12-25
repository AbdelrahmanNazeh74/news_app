import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/home/settings/languageBottomSheet.dart';
import 'package:news_app/home/settings/themeBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/home/ui/myThemeData.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings-screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: settingsCubit.state.theme == ThemeOption.Dark
                  ? Colors.white
                  : Colors.black,
            )),
        title: Text(AppLocalizations.of(context)!.settings),
        backgroundColor: settingsCubit.state.theme == ThemeOption.Dark
            ? Colors.black
            : MyThemeData.lightPrimary,
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.theme,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            InkWell(
              onTap: () {
                showThemeBottomSheet();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: settingsCubit.state.theme == ThemeOption.Dark
                          ? Colors.black
                          : MyThemeData.lightPrimary,
                      width: 1,
                    )),
                child: Text(
                  settingsCubit.state.theme == ThemeOption.Dark
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            InkWell(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: settingsCubit.state.theme == ThemeOption.Dark
                          ? Colors.black
                          : MyThemeData.lightPrimary,
                      width: 1,
                    )),
                child: Text(
                  settingsCubit.state.language == 'ar'
                      ? AppLocalizations.of(context)!.arabic
                      : AppLocalizations.of(context)!.english,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }
}
