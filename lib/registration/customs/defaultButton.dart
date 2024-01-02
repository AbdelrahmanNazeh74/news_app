import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isUpperCase;

  const DefaultButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isUpperCase = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
      ),
    );
  }
}
