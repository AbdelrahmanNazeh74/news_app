import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  TextEditingController passwordController;
  PasswordTextField({required this.passwordController, Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
