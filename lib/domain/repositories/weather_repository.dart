import 'package:weather_forecast/domain/entities/general_weather.dart';
import 'package:weather_forecast/domain/usecases/get_general_weather_usecase.dart';

abstract class WeatherRepository {
  Future<GeneralWeather> getGeneralWeather(GetGeneralWeatherParams params);
}
