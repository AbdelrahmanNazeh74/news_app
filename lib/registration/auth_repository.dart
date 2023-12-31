// auth_repository.dart
// ignore_for_file: unused_local_variable

import 'package:news_app/registration/api_response.dart';
import 'package:news_app/registration/api_survice.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final ApiService apiService = ApiService();
  final secureStorage = const FlutterSecureStorage();
  Future<void> login(String username, String password) async {
    try {
      final response = await apiService.login(username, password);
      ApiResponse apiResponse = ApiResponse.fromJson(response);

      if (apiResponse.success) {
        final accessToken = apiResponse.data?.token ?? '';
        final refreshToken = apiResponse.data?.refreshToken ?? '';

        await secureStorage.write(key: 'token', value: accessToken);
        await secureStorage.write(key: 'refreshToken', value: refreshToken);
      } else {
        throw Exception('Login failed: ${apiResponse.error?.message}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}
