import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/bloc/weather_bloc.dart';
import 'package:weather_forecast/core/constants/app_constants.dart';
import 'package:weather_forecast/core/routes/route.dart';
import 'package:weather_forecast/core/styles/color_style.dart';
import 'package:weather_forecast/core/styles/text_style.dart';
import 'package:weather_forecast/injection.dart';

// This widget is configuration accross apps

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (context) => getIt<WeatherBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: AppConstants.appName,
        theme: ThemeData(
          textTheme: CustomTextStyle.textTheme,
          colorScheme: CustomColorStyle.lightColorScheme,
        ),
      ),
    );
  }
}
