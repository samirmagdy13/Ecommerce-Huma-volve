import 'package:ecommerce_app_huma_volve/core/di/dependency_injection.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/view_model/login_cubit/login_cubit.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/view_model/login_cubit/login_states.dart';
import 'package:ecommerce_app_huma_volve/features/home/view_model/catalog_cubit/catalog_cubit.dart';
import 'package:ecommerce_app_huma_volve/features/main_navigation/screens/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatefulWidget {
  const LoginBlocListener({super.key});

  @override
  State<LoginBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<LoginBlocListener> {
  OverlayEntry? _loadingOverlay;

  void _showLoadingOverlay() {
    if (_loadingOverlay != null) return;

    _loadingOverlay = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black54,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 42,
                  height: 42,
                  child: CircularProgressIndicator(strokeWidth: 3),
                ),
                SizedBox(height: 20),
                Text(
                  'Signing you in...',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 6),
                Text(
                  'Please wait a moment',
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_loadingOverlay!);
  }

  void _hideLoadingOverlay() {
    _loadingOverlay?.remove();
    _loadingOverlay = null;
  }

  @override
  void dispose() {
    _hideLoadingOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginLoading) {
          _showLoadingOverlay();
        } else if (state is LoginSuccess) {
          _hideLoadingOverlay();
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  BlocProvider(
                    create: (context) => getIt<CatalogCubit>(),
                    child: const MainNavigationScreen(),
                  ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            ),
          );
        } else if (state is LoginError) {
          _hideLoadingOverlay();
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  BlocProvider(
                    create: (context) => getIt<CatalogCubit>(),
                    child: const MainNavigationScreen(),
                  ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            ),
          );
          // _hideLoadingOverlay();
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
