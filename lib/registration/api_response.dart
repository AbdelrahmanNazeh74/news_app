class ApiResponse {
  final bool success;
  final int statusCode;
  final ApiData? data;
  final ApiError? error;

  ApiResponse({
    required this.success,
    required this.statusCode,
    this.data,
    this.error,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      data: json['data'] != null ? ApiData.fromJson(json['data']) : null,
      error: json['error'] != null ? ApiError.fromJson(json['error']) : null,
    );
  }
}

class ApiData {
  final String token;
  final String refreshToken;

  ApiData({
    required this.token,
    required this.refreshToken,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      token: json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}

class ApiError {
  final String type;
  final List<ApiErrorMessage> message;

  ApiError({
    required this.type,
    required this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      type: json['type'] ?? '',
      message: (json['message'] as List<dynamic>?)
              ?.map((msg) => ApiErrorMessage.fromJson(msg))
              .toList() ??
          [],
    );
  }
}

class ApiErrorMessage {
  final String path;
  final String message;

  ApiErrorMessage({
    required this.path,
    required this.message,
  });

  factory ApiErrorMessage.fromJson(Map<String, dynamic> json) {
    return ApiErrorMessage(
      path: json['path'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
