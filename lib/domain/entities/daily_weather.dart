import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/types/types.dart';
import 'package:weather_forecast/domain/entities/temp_daily.dart';
import 'package:weather_forecast/domain/entities/weather.dart';

class DailyWeather extends Equatable {
  final Dt? dt;
  final Sunrise? sunrise;
  final Sunset? sunset;
  final Moonrise? moonrise;
  final Moonset? moonset;
  final TempDaily? temp;
  final TempDaily? feelsLike;
  final Pressure? pressure;
  final Humidity? humidity;
  final DewPoint? dewPoint;
  final Uvi? uvi;
  final Clouds? clouds;
  final Visibility? visibility;
  final WindSpeed? windSpeed;
  final WindDeg? windDeg;
  final WindGust? windGust;
  final List<Weather>? weather;
  final Pop? pop;

  const DailyWeather({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      dt: json['dt'] as int?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
      moonrise: json['moonrise'] as int?,
      moonset: json['moonset'] as int?,
      temp: json['temp'] == null ? null : TempDaily.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike: json['feels_like'] == null ? null : TempDaily.fromJson(json['feels_like'] as Map<String, dynamic>),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      dewPoint: (json['dew_point'] as num?)?.toDouble(),
      uvi: (json['uvi'] as num?)?.toDouble(),
      clouds: json['clouds'] as int?,
      visibility: json['visibility'] as int?,
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDeg: (json['wind_deg'] as num?)?.toDouble(),
      windGust: (json['wind_gust'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)?.map((e) => Weather.fromJson(e as Map<String, dynamic>)).toList(),
      pop: (json['pop'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        moonrise,
        moonset,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        uvi,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        windGust,
        weather,
        pop,
      ];
}
