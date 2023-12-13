import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class HomeDrawer extends StatelessWidget {
  static const int SETTINGS=1;
  static const int CATEGORIES=1;
  Function onSideMenuItemCallBack;
  HomeDrawer(this.onSideMenuItemCallBack);
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 64,
          ),
          width: double.infinity,
          color: Theme.of(context).primaryColor,
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
                Icon(Icons.list_alt),
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
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings),
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
