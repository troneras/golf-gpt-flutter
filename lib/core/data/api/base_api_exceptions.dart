import 'package:dio/dio.dart';

/// Your backend should return a json with the following structure:
/// {
///  "code": "string",
///  "message": "string"
/// }
class ApiError implements Exception {
  final int? code;
  final String? message;

  ApiError({
    this.code,
    this.message,
  });

  factory ApiError.fromDioException(DioException e) {
    // Try to extract message from response body first
    String? message;
    final responseData = e.response?.data;
    if (responseData is Map<String, dynamic>) {
      message = responseData['message'] as String?;
    }
    return ApiError(
      code: e.response?.statusCode ?? 0,
      message: message ?? e.message,
    );
  }

  @override
  String toString() {
    return 'ApiError(code: $code, message: $message)';
  }
}
