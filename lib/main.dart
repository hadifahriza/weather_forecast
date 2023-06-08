import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forecast/app.dart';
import 'package:weather_forecast/injection.dart' as di;

void main() async {
  di.init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}
