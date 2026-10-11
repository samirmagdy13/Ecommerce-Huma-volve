import 'package:dio/dio.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/data/repos/login_repo.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/view_model/login_cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //repos
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  //cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
