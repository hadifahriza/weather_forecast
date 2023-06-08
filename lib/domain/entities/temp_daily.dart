import 'package:equatable/equatable.dart';
import 'package:weather_forecast/core/types/types.dart';

class TempDaily extends Equatable {
  final Day? day;
  final Min? min;
  final Max? max;
  final Night? night;
  final Eve? eve;
  final Morn? morn;

  const TempDaily({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory TempDaily.fromJson(Map<String, dynamic> json) {
    return TempDaily(
      day: (json['day'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      night: (json['night'] as num?)?.toDouble(),
      eve: (json['eve'] as num?)?.toDouble(),
      morn: (json['morn'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [
        day,
        min,
        max,
        night,
        eve,
        morn,
      ];
}
