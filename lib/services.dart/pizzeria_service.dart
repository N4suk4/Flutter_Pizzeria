import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pizzeria/models/pizza.dart';

class PizzeriaService {
  static const String uri = 'http://pizzeria.fr/api/';

  Future<List<Pizza>> fetchPizzas() async {
    List<Pizza> list = [];

    try {
      final response = await http
      .get(Uri.parse('${uri}/pizza'));
          

      if (response.statusCode == 200) {
        var json=jsonDecode(utf8.decode(response.bodyBytes));
        print (json.toString());  
        for (final value in json) {
          list.add(Pizza.fromJson(value));
        }
      } else {
        throw Exception('Failed to load pizzas');
      }
    } catch (e) {
      rethrow;
    }
    return list;
  }
}