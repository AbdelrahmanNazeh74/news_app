import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category_widget.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/home/ui/myThemeData.dart';
import 'package:news_app/model/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CategoriesFragment extends StatelessWidget {
  var categories = Category.getCategories();
  Function onCategoryClick;
  CategoriesFragment(this.onCategoryClick);
  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return Container(
      padding: EdgeInsets.all(12),
      color: settingsCubit.state.theme == ThemeOption.Dark
          ? Colors.black
          : MyThemeData.lightPrimary,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.message,
            style: TextStyle(
                color: settingsCubit.state.theme == ThemeOption.Dark
                    ? Colors.white
                    : Colors.black,
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
