import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/bloc/weather_bloc.dart';
import 'package:weather_forecast/presentation/details/details_page.dart';
import 'package:weather_forecast/presentation/home/widgets/bottom_section.dart';
import 'package:weather_forecast/presentation/home/widgets/top_section.dart';
import 'package:weather_forecast/presentation/widgets/loading_progress.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isList = false;
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => getInitialData());
  }

  void getInitialData() {
    context.read<WeatherBloc>().add(GetWeather(cityController.text.isEmpty ? 'Jakarta' : cityController.text));
  }

  void changeList() {
    setState(() {
      isList = !isList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocSelector<WeatherBloc, WeatherState, WeatherState>(
        selector: (state) {
          return state;
        },
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: TopSection(
                    data: state.generalWeather,
                    onTapDetails: () {
                      // TODO: Change to Auto_Route
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailsPage(),
                          ));
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: BottomSection(
                    cityController: cityController,
                    onSearch: () => context.read<WeatherBloc>().add(GetWeather(cityController.text)),
                  ),
                ),
                Positioned.fill(
                  child: Visibility(
                    visible: state.status == WeatherStatus.loading,
                    child: const LoadingProgress(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
