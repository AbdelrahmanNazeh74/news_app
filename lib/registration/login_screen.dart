// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/ui/myThemeData.dart';
import 'package:news_app/registration/customs/defaultButton.dart';
import 'package:news_app/registration/customs/default_form_field.dart';
import 'package:news_app/registration/customs/text.dart';
import 'package:news_app/registration/login-bloc/login_bloc.dart';
import 'package:news_app/registration/login-bloc/login_event.dart';
import 'package:news_app/registration/login-bloc/login_state.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  static String routeName = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: MyThemeData.darkPrimary,
      appBar: AppBar(
        backgroundColor: MyThemeData.darkPrimary,
        title: const Text('Login'),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login failed: ${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoginFailure) {
            return Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                        text: 'Login failed: ${state.error}',
                        color: Colors.black,
                        fontSize: 14),
                    ElevatedButton(
                      onPressed: () {
                        loginBloc.add(LoginButtonPressed(
                          username: userNameController.text,
                          password: passwordController.text,
                        ));
                      },
                      child: CustomTextWidget(
                          text: 'Retry', color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultFormField(
                      controller: userNameController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
                    ),
                    const SizedBox(height: 16.0),
                    DefaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      suffix: Icons.visibility_outlined,
                      suffixPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      label: 'Password',
                      prefix: Icons.lock_outline,
                    ),
                    const SizedBox(height: 32.0),
                    DefaultButton(
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context)
                            .add(LoginButtonPressed(
                          username: userNameController.text,
                          password: passwordController.text,
                        ));
                      },
                      text: 'login',
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
