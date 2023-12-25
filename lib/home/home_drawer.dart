import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/home/settings/settings_screen.dart';
import 'package:news_app/home/ui/myThemeData.dart';

// ignore: must_be_immutable
class HomeDrawer extends StatelessWidget {
  static const int SETTINGS = 1;
  static const int CATEGORIES = 1;
  Function onSideMenuItemCallBack;
  HomeDrawer(this.onSideMenuItemCallBack);
  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 64,
          ),
          width: double.infinity,
          color: settingsCubit.state.theme == ThemeOption.Dark
              ? Colors.black
              : MyThemeData.lightPrimary,
          child: Center(
              child: Text(
            AppLocalizations.of(context)!.app_name,
            style: TextStyle(color: Colors.white, fontSize: 32),
          )),
        ),
        InkWell(
          onTap: () {
            onSideMenuItemCallBack(CATEGORIES);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.list_alt,
                  color: settingsCubit.state.theme == ThemeOption.Dark
                      ? Colors.white
                      : Colors.black,
                ),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: TextStyle(fontSize: 21),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onSideMenuItemCallBack(SETTINGS);
            Navigator.pushNamed(context, SettingsScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: settingsCubit.state.theme == ThemeOption.Dark
                      ? Colors.white
                      : Colors.black,
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: TextStyle(fontSize: 21),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
