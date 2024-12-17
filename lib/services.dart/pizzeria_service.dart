import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pizzeria/models/pizza.dart';
import 'package:pizzeria/models/boisson.dart';

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

  Future<List<Boisson>> fetchBoissons() async {
  List<Boisson> list = [];

  try {
    final response = await http.get(Uri.parse('${uri}/boissons'));

    if (response.statusCode == 200) {
      var json = jsonDecode(utf8.decode(response.bodyBytes));
      print(json.toString());

      // Parcours des données et création des objets Boisson
      for (final value in json) {
        list.add(Boisson.fromJson(value));
      }
    } else {
      throw Exception('Failed to load boissons');
    }
  } catch (e) {
    rethrow;
  }
  return list;
}

}