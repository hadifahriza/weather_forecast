import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/bloc/weather_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => getInitialData());
  }

  void getInitialData() {
    context.read<WeatherBloc>().add(GetWeather(cityController.text == '' ? 'Jakarta' : cityController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: cityController,
                ),
              ),
              TextButton(onPressed: getInitialData, child: const Text('Submit')),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                context.watch<WeatherBloc>().state.generalWeather?.timezone ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
