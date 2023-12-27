import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/registration/auth_service.dart';

class ApiClient {
  static const baseUrl =
      'http://ec2-13-38-116-79.eu-west-3.compute.amazonaws.com:8000/api/v1/';
  static String loginPrefix = 'auth/user/signin';
  final AuthService authService;

  ApiClient({required this.authService});

  Future<Map<String, dynamic>> login(TextEditingController userNameController,
      TextEditingController passwordController, BuildContext context) async {
    final url = Uri.parse(baseUrl + loginPrefix);
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "mobileNumber": userNameController.text,
      "password": passwordController.text,
    });
    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        // Successful login
        final Map<String, dynamic> responseData = json.decode(response.body);
        // Access token
        final String accessToken = responseData['data']['token'];
        // refresh token
        final String refreshToken = responseData['data']['refreshToken'];
        // Save tokens
        await authService.saveTokens(accessToken, refreshToken);
        print('Access Token: $accessToken');
        print('Refresh Token: $refreshToken');
        // Navigate to the next screen or perform other actions
        Navigator.pushNamed(context, HomeScreen.routeName);
        return responseData;
      } else {
        // Handle login failure
        print('Login failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Login failed');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error during login: $e');
      throw Exception('Error during login');
    }
  }
}
