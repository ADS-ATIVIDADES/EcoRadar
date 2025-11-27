import 'package:flutter_dotenv/flutter_dotenv.dart';

// Configuration file for API keys and constants
class Config {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
}
