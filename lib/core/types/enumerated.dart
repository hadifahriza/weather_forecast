enum SkyLike {
  clearSky('clear sky', '01d'),
  fewCloud('few clouds', '02d'),
  overcastClouds('overcast clouds', '04d'),
  drizzle('drizzle', '09d'),
  rain('rain', '10d'),
  showerRain('shower rain', '09d'),
  thunderstorm('thunderstorm', '11d'),
  snow('snow', '13d'),
  mist('mist', '50d');

  const SkyLike(this.value, this.iconCode);
  final String value;
  final String iconCode;
}
