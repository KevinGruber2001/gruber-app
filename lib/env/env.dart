import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get MOSQUITTO_URL {
    return dotenv.get('MOSQUITTO_BROKER');
  }

  static int get MOSQUITTO_PORT {
    return int.parse(dotenv.get('MOSQUITTO_PORT'));
  }
}
