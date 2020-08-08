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