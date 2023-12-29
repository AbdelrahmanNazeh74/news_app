// auth_repository.dart
// ignore_for_file: unused_local_variable

import 'package:news_app/registration/api_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final ApiService apiService = ApiService();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<void> login(String username, String password) async {
    try {
      final response = await apiService.login(username, password);

      final accessToken = response['data']['token'];
      final refreshToken = response['data']['refreshToken'];

      // Save tokens to secure storage
      var tokenValue =
          await secureStorage.write(key: 'token', value: accessToken);
      var refreshtokenValue =
          await secureStorage.write(key: 'refreshtoken', value: refreshToken);
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}
