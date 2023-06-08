import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  const ApiUrl._();

  static String byOneCall = dotenv.get('BY_ONECALL', fallback: '-');
  static String byCity = dotenv.get('BY_CITY', fallback: '-');
  static String appId = dotenv.get('APP_ID', fallback: '-');
}
