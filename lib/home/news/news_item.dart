import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';

// ignore: must_be_immutable
class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news);
  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            news.title ?? "",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          Text(
            news.publishedAt ?? "",
            style: TextStyle(fontSize: 18, color: Colors.grey),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
