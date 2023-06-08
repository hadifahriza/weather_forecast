import 'package:flutter/material.dart';
import 'package:weather_forecast/core/styles/constant_style.dart';
import 'package:weather_forecast/core/utils/datetime_converter.dart';
import 'package:weather_forecast/core/utils/temp_converter.dart';
import 'package:weather_forecast/domain/entities/daily_weather.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final DailyWeather? data;
  final VoidCallback? onTap;

  const DateCard({
    super.key,
    this.isSelected = false,
    this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ConstantStyle.height150,
        width: ConstantStyle.width80,
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.background : Theme.of(context).colorScheme.background.withOpacity(0.25),
          borderRadius: const BorderRadius.all(
            Radius.circular(ConstantStyle.radius50),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DatetimeConverter.dateNameOnly(DatetimeConverter.epochToDateTime(data?.dt ?? 0)),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: isSelected ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              DatetimeConverter.dateOnly(DatetimeConverter.epochToDateTime(data?.dt ?? 0)),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: isSelected ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            Text(
              TempConverter.kelvinToCelcius(data?.temp?.max ?? 273.15),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isSelected ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            Text(
              TempConverter.kelvinToCelcius(data?.temp?.min ?? 273.15),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isSelected ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
