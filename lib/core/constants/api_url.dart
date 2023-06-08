import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  const ApiUrl._();

  static String https = 'https:/';
  static String base = 'openweathermap.org';
  static String api = '$https/api.$base/data/2.5';

  static String byOneCall = '$api/onecall';
  static String byCity = '$api/weather';

  static String image = '$https/$base/img/wn';

  static String appId = dotenv.get('APP_ID', fallback: '-');
}
