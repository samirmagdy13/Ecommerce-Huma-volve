import 'package:ecommerce_app_huma_volve/core/networking/api_service.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/models/login_request_body/login_request_body.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/models/login_response/login_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';

class LoginRepo {
  final ApiService _apiService;

  const LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _apiService.login(body);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}
