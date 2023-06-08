class LengthConverter {
  const LengthConverter._();

  static String kmToM(double value) {
    return (value * 1000).toStringAsFixed(2);
  }

  static String mToKm(double value) {
    return (value / 1000).toStringAsFixed(1);
  }
}
