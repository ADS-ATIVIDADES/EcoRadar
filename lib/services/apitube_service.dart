import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class ApitubeService {
  static const String baseUrl = 'https://api.apitube.io/v1/news/everything';
  static const String apiKeyParam = 'api_key';
  // Categorias ambientais principais:
  // environment, conservation, sustainability
  static const String categoryParam = 'category.id=medtop:06000000,medtop:20000420,medtop:20001374';
  static const String exportParam = 'export=json';
  static const String languageParam = 'language.code=pt';
  static const String perPageParam = 'per_page=10';
  static const String sortParam = 'sort.by=published_at&sort.order=desc';

  Future<Map<String, dynamic>?> fetchNews() async {
    final url = Uri.parse('$baseUrl?$apiKeyParam=${Config.apiKey}&$categoryParam&'
        '$exportParam&$languageParam&$perPageParam&$sortParam');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        print('Erro na API: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Erro ao fazer requisição: $e');
      return null;
    }
  }
}
