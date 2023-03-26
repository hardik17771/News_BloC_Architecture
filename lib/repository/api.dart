
import 'dart:convert';

import 'package:http/http.dart';
import '../models/api_model.dart';
import 'package:http/http.dart' as http;


class ApiProvider {


  Future<List<Newss>> fetchNews() async {
    const url = 'https://newsapi.org/v2/everything?q=tesla&from=2023-02-26&sortBy=publishedAt&apiKey=001d18edc256499c941d90df4101c041';
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)['articles'] as List;
      final result = json.map((e) {
        return Newss(
          img_url: e['urlToImage'] ?? '',
          author: e['author'] ?? '',
          title: e['title'] ?? '',
          description: e['description'] ?? '',
        );
      }).toList();
      return result;
    } else {
      throw "Something went wrong ${response.statusCode}";
    }
  }
}


