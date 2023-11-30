import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourcesResponse.dart';

// ignore: must_be_immutable
class NewsContainer extends StatelessWidget {
Sources selectedSource; 
NewsContainer(this.selectedSource);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(selectedSource.id??""),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasError){
          return Column(children: [
            Text('something went wrong'),
            ElevatedButton(onPressed: (){}, child: Text('try again'))
          ],);
        }
        if(snapshot.data?.status != "ok"){
          // server responce hase code and message
          return Column(children: [
            Text(snapshot.data?.message ?? ""),
            ElevatedButton(onPressed: (){}, child: Text('try again'))
          ],);
        }
        var newsList= snapshot.data?.articles ?? [];
        return ListView.builder(itemBuilder: (_,index){
          return Text(newsList[index].title ??"");
        },itemCount: newsList.length,);
      }
    );
  }
}