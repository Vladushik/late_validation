import 'package:get_it/get_it.dart';

import 'package:clario_test/src/features/splash/bloc/splash_bloc.dart';
import 'package:clario_test/src/features/splash/data/repositories/splash_repository.dart';
import 'package:clario_test/src/features/auth/register/bloc/register_bloc.dart';
import 'package:clario_test/src/features/auth/register/data/repositories/register_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //MARK: - BLoCs
  sl.registerFactory(() => SplashBloc(repository: sl()));
  sl.registerFactory(() => RegisterBloc(repository: sl()));
  //MARK: - Repositories
  sl.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl());
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl());
  //MARK: - Data sources
  //MARK: - Utils
  //MARK: - External
}
