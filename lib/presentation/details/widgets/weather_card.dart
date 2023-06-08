import 'package:flutter/material.dart';
import 'package:weather_forecast/core/constants/api_url.dart';
import 'package:weather_forecast/core/styles/constant_style.dart';
import 'package:weather_forecast/core/utils/temp_converter.dart';
import 'package:weather_forecast/domain/entities/daily_weather.dart';

class WeatherCard extends StatelessWidget {
  final DailyWeather? data;

  const WeatherCard({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(ConstantStyle.radius50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'During Day',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            data?.weather?.first.icon != null
                ? Image.network(
                    '${ApiUrl.image}/${data?.weather?.first.icon}.png',
                    height: ConstantStyle.height100,
                  )
                : const CircularProgressIndicator(),
            Text(
              TempConverter.kelvinToCelcius(data?.temp?.day ?? 273.15),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Feels Like ${TempConverter.kelvinToCelcius(data?.feelsLike?.day ?? 273.15)}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
