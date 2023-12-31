import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/settings/app_event_type.dart';
import 'package:news_app/home/settings/bloc/settings_cubit.dart';
import 'package:news_app/model/NewsResponse.dart';

// ignore: must_be_immutable
class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news);
  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return Container(
      padding: EdgeInsets.all(8),
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: news.urlToImage == null
                  ? Icon(Icons.broken_image)
                  : Image.network(
                      news.urlToImage ?? "",
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Text(
            news.author ?? "",
            style: TextStyle(
                fontSize: 12,
                color: settingsCubit.state.theme == ThemeOption.Dark
                    ? Colors.white
                    : Colors.grey),
          ),
          Text(
            news.title ?? "",
            style: TextStyle(
                fontSize: 12,
                color: settingsCubit.state.theme == ThemeOption.Dark
                    ? Colors.white
                    : Colors.black),
          ),
          Text(
            news.publishedAt ?? "",
            style: TextStyle(
                fontSize: 18,
                color: settingsCubit.state.theme == ThemeOption.Dark
                    ? Colors.white
                    : Colors.black),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
