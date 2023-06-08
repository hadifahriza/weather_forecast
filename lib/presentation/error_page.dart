import 'package:flutter/material.dart';
import 'package:weather_forecast/core/constants/message_constants.dart';

class ErrorPage extends StatelessWidget {
  final String text;

  const ErrorPage({
    this.text = MessagesConstants.somethingWentWrong,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(text),
      ),
    );
  }
}
