import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static Future<List<Category>> fetchCategories() async {
    final response =
        await http.get('http://dummy.restapiexample.com/api/v1/employees');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return json
          .decode(response.body)['data']
          .map<Category>((data) => Category.fromJson(data))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load category');
    }
  }
}

class Category {
  final String id;
  final String name;
  final String a;
  final String b;
  final String c;

  Category({this.id, this.name, this.a, this.b, this.c});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['employee_name'],
        a: json['employee_salary'],
        b: json['employee_age'],
        c: json['profile_image']);
  }
}
