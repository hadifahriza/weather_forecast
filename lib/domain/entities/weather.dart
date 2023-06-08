import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/types/types.dart';

class Weather extends Equatable {
  final Id? id;
  final Main? main;
  final Description? description;
  final Icon? icon;

  const Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}
