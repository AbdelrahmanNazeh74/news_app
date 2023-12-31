import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  CustomTextWidget({
    required this.text,
    required this.color,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
