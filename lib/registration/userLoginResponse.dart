import 'dart:convert';

UserLoginResponse userLoginResponseFromJson(String str) =>
    UserLoginResponse.fromJson(json.decode(str));

String userLoginResponseToJson(UserLoginResponse data) =>
    json.encode(data.toJson());

class UserLoginResponse {
  bool success;
  int statusCode;
  Data data;
  dynamic error;

  UserLoginResponse({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.error,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      UserLoginResponse(
        success: json["success"],
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "data": data.toJson(),
        "error": error,
      };
}

class Data {
  String token;
  String refreshToken;

  Data({
    required this.token,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
      };
}
