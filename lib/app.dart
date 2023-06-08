import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/core/constants/app_constants.dart';
import 'package:weather_forecast/core/styles/color_style.dart';
import 'package:weather_forecast/core/styles/text_style.dart';

// This widget is configuration accross apps

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<WeatherBloc>(
        //   create: (context) => getIt<WeatherBloc>(),
        // ),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        theme: ThemeData(
          textTheme: CustomTextStyle.textTheme,
          colorScheme: CustomColorStyle.lightColorScheme,
        ),
        home: const Scaffold(
          body: Center(
            child: Text('Weather Forecast App'),
          ),
        ),
      ),
    );
  }
}
