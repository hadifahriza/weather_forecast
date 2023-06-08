import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/constants/message_constants.dart';
import 'package:weather_forecast/core/error/exceptions.dart';
import 'package:weather_forecast/core/error/failure.dart';
import 'package:weather_forecast/core/usecase/usecase.dart';
import 'package:weather_forecast/domain/entities/general_weather.dart';
import 'package:weather_forecast/domain/repositories/weather_repository.dart';

class GetGeneralWeatherUsecase extends UseCase<GeneralWeather, GetGeneralWeatherParams> {
  final WeatherRepository repository;
  GetGeneralWeatherUsecase(this.repository);

  @override
  Future<Either<Failure, GeneralWeather>> call(GetGeneralWeatherParams params) async {
    try {
      final result = await repository.getGeneralWeather(params);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure(MessagesConstants.failedToConnectToNetwork));
    } catch (e) {
      return const Left(ServerFailure(MessagesConstants.thereIsUnexpectedError));
    }
  }
}

class GetGeneralWeatherParams extends Equatable {
  final String city;

  const GetGeneralWeatherParams({
    required this.city,
  });

  @override
  List<Object?> get props => [
        city,
      ];
}
