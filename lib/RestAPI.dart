import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Category>> fetchCategories() async {
  final response = await http.get('http://localhost:8080/category-api/categories');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.body)['results']
      .map((data) => Category.fromJson(data))
      .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Category {
  final int id;
  final String name;
  final String image;
  final String info;

  Category({this.id, this.name, this.image, this.info});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      info: json['info']
    );
  }
}