import 'package:ecommerce_app_huma_volve/features/auth/login/data/models/login_response/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_states.freezed.dart';

@Freezed()
class LoginStates<T> with _$LoginStates<T> {
  const factory LoginStates.initial() = _Initial;
  const factory LoginStates.loginLoading() = LoginLoading;
  const factory LoginStates.loginSuccess(LoginResponse data) = LoginSuccess<T>;
  const factory LoginStates.loginError({required String error}) = LoginError;

  const factory LoginStates.quickLoginError({required String error}) =
      QuickLoginError;
}
