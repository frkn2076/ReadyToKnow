class MyCategory {
  final String id;
  final String name;
  final String a;
  final String b;
  final String c;

  MyCategory({this.id, this.name, this.a, this.b, this.c});

  factory MyCategory.fromJson(Map<String, dynamic> json) {
    return MyCategory(
        id: json['id'],
        name: json['employee_name'],
        a: json['employee_salary'],
        b: json['employee_age'],
        c: json['profile_image']);
  }
}