import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/home/ui/myThemeData.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/home/category/tab_container.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

// ignore: must_be_immutable
class CategoryDetails extends StatelessWidget {
  Category category;
  String keyWord;
  CategoryDetails(this.category, this.keyWord);
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      color: settingsProvider.currentTheme == ThemeMode.dark ? Colors.black : Colors.white,
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<SourcesResponse>(
                future: ApiManager.getSources(category.id),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('something went wrong'),
                        ElevatedButton(
                            onPressed: () {}, child: Text('try again'))
                      ],
                    );
                  }
                  if (snapshot.data?.status != "ok") {
                    // server responce hase code and message
                    return Column(
                      children: [
                        Text(
                          snapshot.data?.message ?? "",
                          style: TextStyle(
                              color: settingsProvider.currentTheme == ThemeMode.dark
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: Text('try again'))
                      ],
                    );
                  }
                  // got data from server
                  var sourcesList = snapshot.data?.sources ?? [];
                  return TabContainer(sourcesList, keyWord);
                }),
          )
        ],
      ),
    );
  }
}
