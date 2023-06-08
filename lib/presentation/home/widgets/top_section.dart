import 'package:flutter/material.dart';
import 'package:weather_forecast/core/constants/api_url.dart';
import 'package:weather_forecast/core/constants/app_constants.dart';
import 'package:weather_forecast/core/styles/constant_style.dart';
import 'package:weather_forecast/core/utils/temp_converter.dart';
import 'package:weather_forecast/domain/entities/general_weather.dart';

class TopSection extends StatelessWidget {
  final GeneralWeather? data;
  final VoidCallback? onTapDetails;

  const TopSection({
    super.key,
    this.data,
    this.onTapDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Location: ${data?.timezone}',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            data?.current?.weather?.first.icon != null
                ? Image.network(
                    '${ApiUrl.image}/${data?.current?.weather?.first.icon}.png',
                    height: ConstantStyle.height100,
                  )
                : const CircularProgressIndicator(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.current?.weather?.first.main ?? '',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                Text(
                  data?.current?.weather?.first.description ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ],
            ),
          ],
        ),
        Text(
          TempConverter.kelvinToCelcius(data?.current?.temp ?? 273.15),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        Text(
          'Feels Like ${TempConverter.kelvinToCelcius(data?.current?.feelslike ?? 273.15)}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        const SizedBox(height: ConstantStyle.height20),
        MaterialButton(
          onPressed: onTapDetails,
          color: Theme.of(context).colorScheme.background,
          padding: const EdgeInsetsDirectional.all(ConstantStyle.padding10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ConstantStyle.radius10),
          ),
          child: Text(
            AppConstants.seeDetails,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ],
    );
  }
}
