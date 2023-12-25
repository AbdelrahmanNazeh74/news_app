import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/home/ui/myThemeData.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                BlocProvider.of<SettingsCubit>(context)
                    .changeTheme(ThemeOption.Dark);
              },
              child: settingsCubit.state.theme == ThemeOption.Light
                  ? getUnselectedItem(AppLocalizations.of(context)!.dark)
                  : getSelectedItem(AppLocalizations.of(context)!.dark)),
          InkWell(
              onTap: () {
                BlocProvider.of<SettingsCubit>(context)
                    .changeTheme(ThemeOption.Light);
              },
              child: settingsCubit.state.theme == ThemeOption.Dark
                  ? getUnselectedItem(AppLocalizations.of(context)!.light)
                  : getSelectedItem(AppLocalizations.of(context)!.light))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: MyThemeData.lightPrimary, fontSize: 24),
        ),
        Icon(
          Icons.check,
          color: MyThemeData.lightPrimary,
        ),
      ],
    );
  }

  Widget getUnselectedItem(String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 24)),
      ],
    );
  }
}
