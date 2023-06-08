import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/constants/message_constants.dart';
import 'package:weather_forecast/core/error/failure.dart';
import 'package:weather_forecast/domain/entities/general_weather.dart';
import 'package:weather_forecast/domain/entities/position.dart';
import 'package:weather_forecast/domain/usecases/get_city_position_usecase.dart';
import 'package:weather_forecast/domain/usecases/get_general_weather_usecase.dart';
import 'package:weather_forecast/presentation/widgets/show_toast.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // Usecase
  final GetGeneralWeatherUsecase _getGeneralWeatherUsecase;
  final GetCityPositionUsecase _getCityPositionUsecase;

  WeatherBloc(
    this._getGeneralWeatherUsecase,
    this._getCityPositionUsecase,
  ) : super(const WeatherState()) {
    on<GetWeather>(_getGeneralWeatherByCity);
  }

  void _getGeneralWeatherByCity(GetWeather event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    Either<Failure, Position> position = await _getCityPositionUsecase.call(GetCityPositionParams(city: event.city));

    await position.fold(
      (l) async {
        _emitError(emit, MessagesConstants.cityNotFound);
      },
      (r) async {
        Either<Failure, GeneralWeather> result = await _getGeneralWeatherUsecase.call(GetGeneralWeatherParams(position: r));

        await result.fold(
          (l) async {
            _emitError(emit, MessagesConstants.failedToGetData);
          },
          (r) async {
            emit(state.copyWith(
              status: WeatherStatus.success,
              generalWeather: r,
            ));
            showToast(MessagesConstants.success, ToastType.success);
          },
        );
      },
    );
  }

  void _emitError(Emitter<WeatherState> emit, String message) {
    emit(state.copyWith(
      status: WeatherStatus.error,
    ));
    showToast(message, ToastType.error);
  }
}
