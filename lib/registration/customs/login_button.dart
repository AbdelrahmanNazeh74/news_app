import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/registration/login-bloc/login_bloc.dart';
import 'package:news_app/registration/login-bloc/login_event.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButton({
    required this.usernameController,
    required this.passwordController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          username: usernameController.text,
          password: passwordController.text,
        ));
      },
      child: const Text(
        'Login',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
