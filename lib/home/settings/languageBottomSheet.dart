import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/home/settings/bloc/settings_state.dart';
import 'package:news_app/home/ui/myThemeData.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  if (settingsCubit.state.language == 'ar') {
                    BlocProvider.of<SettingsCubit>(context)
                        .changeLanguage('en');
                  } else {
                    BlocProvider.of<SettingsCubit>(context)
                        .changeLanguage('ar');
                  }
                },
                child: settingsCubit.state.language == 'en'
                    ? getSelectedItem(AppLocalizations.of(context)!.english)
                    : getUnselectedItem(AppLocalizations.of(context)!.english),
              ),
              InkWell(
                onTap: () {
                  if (settingsCubit.state.language == 'ar') {
                    BlocProvider.of<SettingsCubit>(context)
                        .changeLanguage('en');
                  } else {
                    BlocProvider.of<SettingsCubit>(context)
                        .changeLanguage('ar');
                  }
                },
                child: settingsCubit.state.language == 'ar'
                    ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                    : getUnselectedItem(AppLocalizations.of(context)!.arabic),
                // Corrected this line
              ),
            ],
          ),
        );
      },
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
