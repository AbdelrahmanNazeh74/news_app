import 'package:flutter/material.dart';
import 'package:news_app/home/categories.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/home_drawer.dart';
import 'package:news_app/home/settings/settings_screen.dart';
import 'package:news_app/home/ui/myThemeData.dart';
import 'package:news_app/model/category.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String keyWord = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyThemeData.isDarkEnaled ? Colors.black : Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: MyThemeData.isDarkEnaled
                  ? Colors.black
                  : Theme.of(context).primaryColor,
            ),
          ),
          title: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              // Perform search functionality here
              keyWord = value;
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.search))
          ],
        ),
        drawer: Drawer(
          child: HomeDrawer(onSideMenuItemClick),
        ),
        body: selectedCategoty == null
            ? CategoriesFragment(onCategoryClick)
            : CategoryDetails(selectedCategoty!, keyWord),
      ),
    );
  }

  Category? selectedCategoty = null;

  void onCategoryClick(Category category) {
    // if someone clicked on category
    // to change to category detailes view
    selectedCategoty = category;
    setState(() {});
  }

  void onSideMenuItemClick(int clickedItem) {
    if (clickedItem == HomeDrawer.CATEGORIES) {
      selectedCategoty = null;
      setState(() {});
      Navigator.pop(context);
    } else if (clickedItem == HomeDrawer.SETTINGS) {
      selectedCategoty = null;
      Navigator.pushNamed(context, SettingsScreen.routeName);
    }
  }
}
