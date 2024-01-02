import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final IconData prefix;
  final IconData? suffix;
  final void Function()? suffixPressed;
  final String? Function(String?) validate;
  final String label;

  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.type,
    required this.prefix,
    this.suffix,
    this.suffixPressed,
    required this.validate,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      keyboardType: type,
      obscureText: type == TextInputType.visiblePassword ? true : false,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[200]),
        prefixIcon: Icon(
          prefix,
          color: Colors.white,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                  color: Colors.white,
                ),
                onPressed: suffixPressed,
              )
            : null,
      ),
      validator: validate,
    );
  }
}
