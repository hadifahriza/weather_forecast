import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/types/types.dart';

class Position extends Equatable {
  final Lat? lat;
  final Lon? lon;

  const Position({
    this.lat,
    this.lon,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      lat: json['lat'] as double?,
      lon: json['lon'] as double?,
    );
  }

  @override
  List<Object?> get props => [
        lat,
        lon,
      ];
}
