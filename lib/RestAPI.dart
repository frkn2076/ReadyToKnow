import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Models/CategoryDummy.dart';

class API {
  static Future<List<MyCategory>> fetchCategories() async {
    final response =
        await http.get('http://dummy.restapiexample.com/api/v1/employees');

    if (response.statusCode == 200) {
      return json
          .decode(response.body)['data']
          .map<MyCategory>((data) => MyCategory.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load category');
    }
  }
}


