import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryWidget(this.category, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(category.colorCode),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular((index % 2 == 0) ? 0 : 12),
            bottomLeft: Radius.circular((index % 2 == 0) ? 12 : 0),
          )),
      child: Column(
        children: [
          Image.asset(
            category.image,
            height: 120,
            fit: BoxFit.fill,
          ),
          Expanded(
              child: Center(
                  child: Text(
            category.title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )))
        ],
      ),
    );
  }
}
