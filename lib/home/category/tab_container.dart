import 'package:flutter/material.dart';
import 'package:news_app/model/SourcesResponse.dart';
import 'package:news_app/home/news/news_container.dart';
import 'package:news_app/home/category/tab_item.dart';

// ignore: must_be_immutable
class TabContainer extends StatefulWidget {
List<Sources> sources;
String keyWord;
TabContainer(this.sources,this.keyWord);

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:widget.sources.length ,
      child: Column(children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.transparent,
          onTap: (index){
            selectedIndex = index;
            setState(() {
              
            });
          },
          tabs: 
            widget.sources.map((source) => TabItem(source, selectedIndex == widget.sources.indexOf(source)
            )).toList()
          ),
          Expanded(child: NewsContainer(widget.sources[selectedIndex],widget.keyWord)
          )
      ],),

    );
  }
}