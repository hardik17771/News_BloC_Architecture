
import 'dart:convert';

import 'package:http/http.dart';
import '../models/api_model.dart';
import 'package:http/http.dart' as http;


class ApiProvider {


  Future<List<Newss>> fetchNews() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode((response.body)) as List;
      final result = json.map((e) {
        return Newss(author: e['id'],
          title: e['userId'],
          description: e['completed'],);
      }).toList();
      return result;
    } else {
      throw "Something went wrong ${response.statusCode}";
    }
  }
}


