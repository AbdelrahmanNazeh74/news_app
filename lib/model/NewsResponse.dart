import 'package:news_app/model/SourcesResponse.dart';

class NewsResponse {
  NewsResponse(
      {this.status, this.totalResults, this.articles, this.code, this.message});

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json['code'];
    message = json['message'];

    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(News.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  List<News>? articles;
  String? message;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "Emily Shapiro"
/// title : "Boyfriend arrested for murder after 21-year-old woman found dead in trunk of her car"
/// description : "A 19-year-old man has been arrested in connection with the death of his 21-year-old girlfriend who was found dead in the trunk of her own car, Houston police said."
/// url : "https://abcnews.go.com/US/boyfriend-arrested-murder-after-21-year-woman-found/story?id=105237008"
/// urlToImage : "https://i.abcnewsfe.com/a/1bdae238-17cd-44f9-a446-b72bdfdc9817/trunk-ht-ml-231129_1701265298043_hpMain_16x9.jpg?w=992"
/// publishedAt : "2023-11-29T14:52:25Z"
/// content : "A 19-year-old man has been arrested in connection with the murder of his 21-year-old girlfriend after she was found shot dead in the trunk of her own car, Houston police announced on Wednesday.\r\nThe … [+1061 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Sources.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
