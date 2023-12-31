import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserNameTextField extends StatefulWidget {
  TextEditingController userNameController;
  UserNameTextField({
    required this.userNameController,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<UserNameTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.userNameController,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'UserName',
        hintText: 'Enter your userName',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(color: Colors.grey),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your userName';
        }
        return null;
      },
    );
  }
}
