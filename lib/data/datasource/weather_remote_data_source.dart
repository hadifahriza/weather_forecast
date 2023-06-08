import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_forecast/core/constants/api_url.dart';
import 'package:weather_forecast/core/constants/message_constants.dart';
import 'package:weather_forecast/core/error/exceptions.dart';
import 'package:weather_forecast/domain/entities/general_weather.dart';
import 'package:weather_forecast/domain/entities/position.dart';
import 'package:weather_forecast/domain/usecases/get_city_position_usecase.dart';
import 'package:weather_forecast/domain/usecases/get_general_weather_usecase.dart';

abstract class WeatherRemoteDataSource {
  Future<GeneralWeather> getGeneralWeather(GetGeneralWeatherParams params);
  Future<Position> getCityPosition(GetCityPositionParams params);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio client;
  WeatherRemoteDataSourceImpl(this.client);

  @override
  Future<GeneralWeather> getGeneralWeather(GetGeneralWeatherParams params) async {
    try {
      Map<String, dynamic> queryParam = {
        'lat': params.position.lat,
        'lon': params.position.lon,
        'appid': ApiUrl.appId,
      };

      final response = await client.get(
        ApiUrl.byOneCall,
        queryParameters: queryParam,
        options: Options(headers: {}),
      );

      final Map<String, dynamic> responseData = response.data;
      final data = GeneralWeather.fromJson(responseData);
      return data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerExceptions(MessagesConstants.somethingWentWrong);
      } else if (e.type == DioExceptionType.unknown && e.message!.contains("SocketException")) {
        throw const SocketException('');
      } else {
        throw ServerExceptions(MessagesConstants.somethingWentWrong);
      }
    }
  }

  @override
  Future<Position> getCityPosition(GetCityPositionParams params) async {
    try {
      Map<String, dynamic> queryParam = {
        'q': params.city,
        'appid': ApiUrl.appId,
      };

      final response = await client.get(
        ApiUrl.byCity,
        queryParameters: queryParam,
        options: Options(headers: {}),
      );

      final Map<String, dynamic> responseData = response.data;
      final data = Position.fromJson(responseData['coord']);
      return data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerExceptions(MessagesConstants.somethingWentWrong);
      } else if (e.type == DioExceptionType.unknown && e.message!.contains("SocketException")) {
        throw const SocketException('');
      } else {
        throw ServerExceptions(MessagesConstants.somethingWentWrong);
      }
    }
  }
}
