import 'package:weather_forecast/data/datasource/weather_remote_data_source.dart';
import 'package:weather_forecast/domain/entities/general_weather.dart';
import 'package:weather_forecast/domain/entities/position.dart';
import 'package:weather_forecast/domain/repositories/weather_repository.dart';
import 'package:weather_forecast/domain/usecases/get_city_position_usecase.dart';
import 'package:weather_forecast/domain/usecases/get_general_weather_usecase.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<GeneralWeather> getGeneralWeather(GetGeneralWeatherParams params) async {
    final result = await remoteDataSource.getGeneralWeather(params);
    return result;
  }

  @override
  Future<Position> getCityPosition(GetCityPositionParams params) async {
    final result = await remoteDataSource.getCityPosition(params);
    return result;
  }
}
