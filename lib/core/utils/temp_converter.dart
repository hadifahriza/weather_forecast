class TempConverter {
  const TempConverter._();

  static String kelvinToCelcius(double value) {
    return '${(value - 273.15).toStringAsFixed(1)} \u00B0C';
  }

  static String kelvinToFahrenheit(double value) {
    return '${((value - 273.15) * 9 / 5 + 32).toStringAsFixed(1)} \u00B0F';
  }

  static String celciusToKelvin(double value) {
    return '${(value + 273.15).toStringAsFixed(1)} K';
  }

  static String celciusToFahrenheit(double value) {
    return '${((value * 9 / 5) + 32).toStringAsFixed(1)} \u00B0F';
  }

  static String fahrenheitToKelvin(double value) {
    return '${((value - 32) * 5 / 9 + 273.15).toStringAsFixed(1)} K';
  }

  static String fahrenheitToCelcius(double value) {
    return '${((value - 32) * 5 / 9).toStringAsFixed(1)} \u00B0C';
  }
}
