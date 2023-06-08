part of 'weather_bloc.dart';

enum WeatherStatus { empty, loading, success, error }

class WeatherState extends Equatable {
  final WeatherStatus status;
  final GeneralWeather? generalWeather;

  const WeatherState({
    this.status = WeatherStatus.empty,
    this.generalWeather,
  });

  @override
  List<Object> get props => [
        status,
      ];

  WeatherState copyWith({
    WeatherStatus? status,
    GeneralWeather? generalWeather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      generalWeather: generalWeather ?? this.generalWeather,
    );
  }
}
