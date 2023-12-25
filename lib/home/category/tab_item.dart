import 'package:flutter/material.dart';
import 'package:news_app/home/ui/myThemeData.dart';
import 'package:news_app/model/SourcesResponse.dart';

// ignore: must_be_immutable
class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  TabItem(this.source, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? MyThemeData.lightPrimary : Colors.white,
        border: Border.all(color: MyThemeData.lightPrimary),
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : MyThemeData.lightPrimary,
        ),
      ),
    );
  }
}
