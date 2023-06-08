import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/bloc/weather_bloc.dart';
import 'package:weather_forecast/core/constants/app_constants.dart';
import 'package:weather_forecast/core/styles/constant_style.dart';
import 'package:weather_forecast/presentation/details/widgets/date_card.dart';
import 'package:weather_forecast/presentation/details/widgets/weather_card.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedIndex = 0;

  void changeSelected(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppConstants.next5Days,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: BlocSelector<WeatherBloc, WeatherState, WeatherState>(
          selector: (state) {
            return state;
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: ConstantStyle.padding20),
                child: Column(
                  children: [
                    SizedBox(
                      height: ConstantStyle.height150,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return DateCard(
                            data: state.generalWeather?.daily?[index],
                            isSelected: selectedIndex == index,
                            onTap: () => changeSelected(index),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(width: ConstantStyle.width10),
                      ),
                    ),
                    const SizedBox(height: ConstantStyle.height20),
                    WeatherCard(data: state.generalWeather?.daily?[selectedIndex]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
