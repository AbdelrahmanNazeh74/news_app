import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/categories.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/home_drawer.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/home/ui/myThemeData.dart';
import 'package:news_app/model/category.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return Container(
      decoration: BoxDecoration(
        color: settingsCubit.state.theme == ThemeOption.Dark
            ? Colors.black
            : Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: settingsCubit.state.theme == ThemeOption.Dark
            ? Colors.white
            : Colors.white,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: settingsCubit.state.theme == ThemeOption.Dark
                  ? Colors.black
                  : MyThemeData.lightPrimary,
            ),
          ),
        ),
        drawer: Drawer(
          child: HomeDrawer(onSideMenuItemClick),
        ),
        body: selectedCategoty == null
            ? CategoriesFragment(onCategoryClick)
            : CategoryDetails(selectedCategoty!),
      ),
    );
  }

  Category? selectedCategoty = null;

  void onCategoryClick(Category category) {
    // if someone clicked on category
    // to change to category details view
    selectedCategoty = category;
    setState(() {});
  }

  void onSideMenuItemClick(int clickedItem) {
    if (clickedItem == HomeDrawer.CATEGORIES) {
      selectedCategoty = null;
      setState(() {});
      Navigator.pop(context);
    } else if (clickedItem == HomeDrawer.SETTINGS) {
      Navigator.pop(context);
    }
  }
}
