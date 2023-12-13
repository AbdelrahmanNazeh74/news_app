import 'package:flutter/material.dart';
import 'package:news_app/home/category_widget.dart';
import 'package:news_app/home/ui/myThemeData.dart';
import 'package:news_app/model/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoriesFragment extends StatelessWidget {
  var categories = Category.getCategories();
  Function onCategoryClick;
  CategoriesFragment(this.onCategoryClick);
  @override
  Widget build(BuildContext context) {
    var settingsProvider =Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      color: settingsProvider.currentTheme == ThemeMode.dark ? Colors.black : MyThemeData.lightPrimary,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.message,
            style: TextStyle(
                color: settingsProvider.currentTheme == ThemeMode.dark ? Colors.white : Colors.black,
                fontSize: 18),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              itemBuilder: (_, index) {
                return InkWell(
                    onTap: () {
                      //call back to home screen to modify to change layout
                      onCategoryClick(categories[index]);
                    },
                    child: CategoryWidget(categories[index], index));
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
