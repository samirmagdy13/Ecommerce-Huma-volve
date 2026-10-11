import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/models/login_request_body/login_request_body.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/models/login_response/login_response.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
}
