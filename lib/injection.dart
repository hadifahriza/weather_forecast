import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  // bloc
  // getIt.registerFactory(() => WeatherBloc(getIt()));

  // usecase
  // getIt.registerLazySingleton(() => GetWeatherUsecase(getIt()));

  // repository
  // getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(getIt()));

  // data source
  // getIt.registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(getIt()));

  getIt.registerLazySingleton(() => Dio());
}
