import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/types/types.dart';

class MinuteWeather extends Equatable {
  final Dt? dt;
  final Precipitation? precipitation;

  const MinuteWeather({
    this.dt,
    this.precipitation,
  });

  factory MinuteWeather.fromJson(Map<String, dynamic> json) {
    return MinuteWeather(
      dt: json['dt'] as int?,
      precipitation: json['precipitation'] as int?,
    );
  }

  @override
  List<Object?> get props => [
        dt,
        precipitation,
      ];
}
