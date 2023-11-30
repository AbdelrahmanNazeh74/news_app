import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/tab_container.dart';

class CategoryDetails extends StatelessWidget {
static const String routeName= 'cat-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder<SourcesResponse>(future: ApiManager.getSources(), builder: (_,snapshot){
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
            // got data from server
            var sourcesList = snapshot.data?.sources ?? [];
            return TabContainer(sourcesList);

          }),
        )
      ],),
    );
  }
}