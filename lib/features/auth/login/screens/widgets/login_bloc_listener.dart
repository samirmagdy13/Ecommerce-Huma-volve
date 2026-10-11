import 'package:ecommerce_app_huma_volve/features/auth/login/view_model/login_cubit/login_cubit.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/view_model/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () {},
          loginSuccess: (data) async {},
          loginError: (error) {},
          quickLoginError: (error) {},
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
