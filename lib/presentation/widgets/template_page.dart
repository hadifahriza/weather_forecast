import 'package:flutter/material.dart';
import 'package:weather_forecast/bloc/weather_bloc.dart';
import 'package:weather_forecast/core/constants/message_constants.dart';
import 'package:weather_forecast/presentation/error_page.dart';
import 'package:weather_forecast/presentation/widgets/loading_progress.dart';

class TemplatePage extends StatelessWidget {
  final WeatherStatus status;
  final Widget child;

  const TemplatePage({
    required this.status,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (status == WeatherStatus.empty) {
          return const ErrorPage(
            text: MessagesConstants.tryAgain,
          );
        }

        if (status == WeatherStatus.error) {
          return const ErrorPage();
        }

        if (status == WeatherStatus.loading) {
          return Stack(
            alignment: Alignment.center,
            children: [
              child,
              const LoadingProgress(),
            ],
          );
        }

        if (status == WeatherStatus.success) {
          return child;
        }

        return const SizedBox.shrink();
      },
    );
  }
}
