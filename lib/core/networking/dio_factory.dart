import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  const DioFactory._();
  static Dio? _dio;

  static const Duration timeOut = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(minutes: 1);

  static Future<Dio> getDio() async {
    if (_dio != null) return _dio!;
    _dio = Dio()
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut
      ..options.sendTimeout = sendTimeout;

    //  await addDioHeaders();
    _dio!.interceptors.add(
      PrettyDioLogger(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        enabled: kDebugMode,
      ),
    );
    return _dio!;
  }

  // static Future<void> addDioHeaders() async {
  //   final token = await CashHelper.getSecureString(
  //     key: CashHelperConstants.accessToken,
  //   );
  //   if (token != null) {
  //     _dio?.options.headers = {
  //       ...?_dio?.options.headers,
  //       'Authorization': 'Bearer $token',
  //     };
  //   }
  // }

  static void _setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers = {
      ...?_dio?.options.headers,
      'Authorization': 'Bearer $token',
    };
  }
}
