import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/constants/message_constants.dart';
import 'package:weather_forecast/core/error/exceptions.dart';
import 'package:weather_forecast/core/error/failure.dart';
import 'package:weather_forecast/core/usecase/usecase.dart';
import 'package:weather_forecast/domain/entities/position.dart';
import 'package:weather_forecast/domain/repositories/weather_repository.dart';

class GetCityPositionUsecase extends UseCase<Position, GetCityPositionParams> {
  final WeatherRepository repository;
  GetCityPositionUsecase(this.repository);

  @override
  Future<Either<Failure, Position>> call(GetCityPositionParams params) async {
    try {
      final result = await repository.getCityPosition(params);
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

class GetCityPositionParams extends Equatable {
  final String city;

  const GetCityPositionParams({
    required this.city,
  });

  @override
  List<Object?> get props => [
        city,
      ];
}
