import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';

class ApiManager{
  static const String baseUrl = 'newsapi.org';
  static Future<SourcesResponse> getSources(String categoryId)async{
    //call api to get new sources
    var url = Uri.https(baseUrl,"/v2/top-headlines/sources",
        {
      'apiKey': '7a02598f55f44da2a4fda378625a3e9d',
      'category': categoryId
        }
    );
    var response=await http.get(url);
    try{
      var bodyString =response.body;
      var json = jsonDecode(bodyString);
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    }catch(e){
      throw e;
    }
}

static Future<NewsResponse> getNews (String sourceId,String keyWord)async{
    var url = Uri.https(baseUrl,'/v2/everything',
    {
      'apiKey': '7a02598f55f44da2a4fda378625a3e9d',
      'sources' : sourceId,
      'q' : keyWord
    });
    var response=await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    }catch(e){
      throw e;
    }
}

}