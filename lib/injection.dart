import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_forecast/bloc/weather_bloc.dart';
import 'package:weather_forecast/data/datasource/weather_remote_data_source.dart';
import 'package:weather_forecast/data/repositories/weather_repository_impl.dart';
import 'package:weather_forecast/domain/repositories/weather_repository.dart';
import 'package:weather_forecast/domain/usecases/get_city_position_usecase.dart';
import 'package:weather_forecast/domain/usecases/get_general_weather_usecase.dart';

final getIt = GetIt.instance;

void init() {
  // bloc
  getIt.registerFactory(() => WeatherBloc(
        getIt(),
        getIt(),
      ));

  // usecase
  getIt.registerLazySingleton(() => GetGeneralWeatherUsecase(getIt()));
  getIt.registerLazySingleton(() => GetCityPositionUsecase(getIt()));

  // repository
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(getIt()));

  // data source
  getIt.registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(getIt()));

  getIt.registerLazySingleton(() => Dio());
}
