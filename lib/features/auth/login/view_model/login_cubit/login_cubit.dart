import 'package:ecommerce_app_huma_volve/core/networking/api_result.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/models/login_request_body/login_request_body.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/repos/login_repo.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/view_model/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo _repo;

  LoginCubit(this._repo) : super(const LoginStates.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  Future<void> emitLoginState() async {
    emit(const LoginStates.loginLoading());

    final response = await _repo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (data) => emit(LoginStates.loginSuccess(data)),
      failure: (apiErrorModel) {
        emit(LoginStates.loginError(error: apiErrorModel.message));
      },
    );
  }

  void validateThenDoLogin() {
    if (fromKey.currentState!.validate()) {
      emitLoginState();
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
