import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _loginResponseKey = 'login_response';

  final SharedPreferences _prefs;

  AuthService(this._prefs);

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _prefs.setString(_accessTokenKey, accessToken);
    await _prefs.setString(_refreshTokenKey, refreshToken);
  }

  Future<void> saveLoginResponse(Map<String, dynamic> loginResponse) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('loginResponse', json.encode(loginResponse));
  }

  String? getAccessToken() {
    return _prefs.getString(_accessTokenKey);
  }

  String? getRefreshToken() {
    return _prefs.getString(_refreshTokenKey);
  }

  Future<Map<String, dynamic>?> getLoginResponse() async {
    final prefs = await SharedPreferences.getInstance();
    final String? loginResponseString = prefs.getString('loginResponse');

    if (loginResponseString != null) {
      return json.decode(loginResponseString);
    }

    return null;
  }

  Future<void> clearTokens() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
    await _prefs.remove(_loginResponseKey);
  }

  Future<bool> hasToken() async {
    final accessToken = _prefs.getString(_accessTokenKey);
    return accessToken != null && accessToken.isNotEmpty;
  }
}
