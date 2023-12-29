// api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  static const String baseUrl =
      'http://ec2-13-38-116-79.eu-west-3.compute.amazonaws.com:8000/api/v1/';
  static const String loginPrefix = 'auth/user/signin';

  Future<Map<String, dynamic>> login(
      String mobileNumber, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl$loginPrefix',
        data: {'mobileNumber': mobileNumber, 'password': password},
      );

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}
