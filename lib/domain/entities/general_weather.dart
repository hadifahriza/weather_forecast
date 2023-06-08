import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/types/types.dart';
import 'package:weather_forecast/domain/entities/current_weather.dart';
import 'package:weather_forecast/domain/entities/daily_weather.dart';
import 'package:weather_forecast/domain/entities/minute_weather.dart';

class GeneralWeather extends Equatable {
  final Lat? lat;
  final Lon? lon;
  final Timezone? timezone;
  final TimezoneOffset? timezoneOffset;
  final CurrentWeather? current;
  final List<MinuteWeather>? minutely;
  final List<CurrentWeather>? hourly;
  final List<DailyWeather>? daily;

  const GeneralWeather({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
  });

  factory GeneralWeather.fromJson(Map<String, dynamic> json) {
    return GeneralWeather(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      timezoneOffset: json['timezone_offset'] as int?,
      current: json['current'] == null ? null : CurrentWeather.fromJson(json['current'] as Map<String, dynamic>),
      minutely: (json['minutely'] as List<dynamic>?)?.map((e) => MinuteWeather.fromJson(e as Map<String, dynamic>)).toList(),
      hourly: (json['hourly'] as List<dynamic>?)?.map((e) => CurrentWeather.fromJson(e as Map<String, dynamic>)).toList(),
      daily: (json['daily'] as List<dynamic>?)?.map((e) => DailyWeather.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  @override
  List<Object?> get props => [
        lat,
        lon,
        timezone,
        timezoneOffset,
        current,
        minutely,
        hourly,
        daily,
      ];
}
