import 'package:flutter/material.dart';
import 'package:news_app/model/SourcesResponse.dart';

// ignore: must_be_immutable
class TabItem extends StatelessWidget {
Sources source;
bool isSelected;
TabItem(this.source,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected? Theme.of(context).primaryColor : Colors.transparent,
        border: Border.all(color: Theme.of(context).primaryColor),

      ),
      child: Text(source.name?? "",style: TextStyle(
        color: isSelected?  Colors.white: Theme.of(context).primaryColor,
      ),),
    );
  }
}