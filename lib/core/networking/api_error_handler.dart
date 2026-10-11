import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleError(error);
    } else if (error is SocketException) {
      return ApiErrorModel(message: "noInternetConnection".tr(), code: -1);
    } else {
      return ApiErrorModel(message: "Wrong try again!".tr());
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  final statusCode = error.response?.statusCode;
  switch (error.type) {
    case DioExceptionType.connectionError:
      return ApiErrorModel(message: "noInternetConnection".tr(), code: -1);
    case DioExceptionType.connectionTimeout:
      return ApiErrorModel(
        message: "Connection to the server timed out. Please try again later.",
        code: statusCode,
      );
    case DioExceptionType.sendTimeout:
      return const ApiErrorModel(
        message: "Request sending took too long. Please try again.",
        code: -2,
      );
    case DioExceptionType.receiveTimeout:
      return ApiErrorModel(
        message: "Server response took too long. Please try again later.",
        code: statusCode,
      );
    case DioExceptionType.cancel:
      return ApiErrorModel(
        message: "The request was cancelled before it could complete.",
        code: statusCode,
      );
    case DioExceptionType.badCertificate:
      return ApiErrorModel(
        message: "The server's security certificate is invalid or untrusted.",
        code: statusCode,
      );
    case DioExceptionType.badResponse:
      return _handleResponseError(error);
    case DioExceptionType.unknown:
      return ApiErrorModel(
        message: "An unexpected error occurred. Please try again later.",
        code: statusCode,
      );
    case DioExceptionType.transformTimeout:
      return ApiErrorModel(
        message:
            "Response transformation took too long. Please try again later.",
        code: statusCode,
      );
  }
}

ApiErrorModel _handleResponseError(DioException error) {
  final statusCode = error.response?.statusCode;

  switch (statusCode) {
    case 700:
      return const ApiErrorModel(message: "CopyrightWarning", code: 700);
    case 701:
      return const ApiErrorModel(message: "bad words", code: 701);
    case 702:
      return const ApiErrorModel(message: "warning", code: 702);
    default:
      final data = error.response?.data;
      if (data is Map<String, dynamic>) {
        return ApiErrorModel.fromJson(data);
      } else if (data is String) {
        final decoded = tryDecodeJson(data);

        if (decoded != null) {
          return ApiErrorModel.fromJson(decoded);
        } else {
          return ApiErrorModel(
            message:
                "Server error Code (${statusCode ?? 0}). Please try again later.",
            code: statusCode,
          );
        }
      } else {
        return const ApiErrorModel(message: "Wrong try again!", code: 0);
      }
  }
}

//423 ban user
//700 copyright
//701 bad words
//702 bad Content

Map<String, dynamic>? tryDecodeJson(String data) {
  try {
    final decoded = jsonDecode(data);

    if (decoded is Map<String, dynamic>) {
      return decoded;
    }

    return null;
  } catch (_) {
    return null;
  }
}
