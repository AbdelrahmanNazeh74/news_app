import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/registration/auth_service.dart';
import 'package:news_app/registration/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'splash-screen';

  final AuthService authService;

  SplashScreen({required this.authService});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future:
          authService.hasToken(), // Implement this method in your AuthService
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the token presence is being checked, show a loading indicator
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error
          return Text('Error: ${snapshot.error}');
        } else {
          // If token is present, navigate to home screen, otherwise, navigate to login screen
          final bool hasToken = snapshot.data ?? false;

          if (hasToken) {
            return HomeScreen();
          } else {
            return LoginScreen(
              authService: authService,
            );
          }
        }
      },
    );
  }
}
