import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  const Urls._();

  static String get apiKey => dotenv.env['KEY'] ?? "";

  static const baseUrl = "https://newsapi.org/v2";

  static String get topNews => "/top-headlines?country=us&apiKey=$apiKey";
}
