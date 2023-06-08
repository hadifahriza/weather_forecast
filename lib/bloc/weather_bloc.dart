import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/error/failure.dart';
import 'package:weather_forecast/domain/entities/general_weather.dart';
import 'package:weather_forecast/domain/usecases/get_general_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // Usecase
  final GetGeneralWeatherUsecase _getGeneralWeatherUsecase;

  WeatherBloc(this._getGeneralWeatherUsecase) : super(const WeatherState()) {
    on<GetWeather>(_getGeneralWeatherByCity);
  }

  void _getGeneralWeatherByCity(GetWeather event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    Either<Failure, GeneralWeather> result = await _getGeneralWeatherUsecase.call(GetGeneralWeatherParams(city: event.city));

    result.fold(
      (l) {
        emit(state.copyWith(
          status: WeatherStatus.error,
        ));
      },
      (r) {
        emit(state.copyWith(
          status: WeatherStatus.success,
          generalWeather: r,
        ));
      },
    );
  }
}
