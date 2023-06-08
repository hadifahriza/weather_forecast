import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  const ApiUrl._();

  static String baseUrl = dotenv.get('BASE_URL', fallback: '-');
  static String appId = dotenv.get('APP_ID', fallback: '-');
}
